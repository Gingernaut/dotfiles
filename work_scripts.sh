#!/usr/bin/env bash



pull_gitlab_repos() {
    export TMP=$(pwd)

    # Egress projects
    cd ~/code/qdl/data-lake-egress-api-java/ && echo "Updating $(pwd)" && git pull origin master;
    cd ~/code/qdl/egress-python/ && echo "Updating $(pwd)" && git pull origin master;
    cd ~/code/qdl/datalake-egress/ && echo "Updating $(pwd)" && git pull origin master;
    cd ~/code/qdl/egress-golang-api/ && echo "Updating $(pwd)" && git pull origin master;
    cd ~/code/qdl/presto-ecs/ && echo "Updating $(pwd)" && git pull origin master;
    cd ~/code/qdl/egress-async-worker/ && echo "Updating $(pwd)" && git pull origin master;

    # ARS
    cd ~/code/qdl/fieldsets-ingress/ && echo "Updating $(pwd)" && git pull origin master;
    cd ~/code/qdl/ars-api/ && echo "Updating $(pwd)" && git pull origin master;
    cd ~/code/qdl/iq-spark-scheduler/ && echo "Updating $(pwd)" && git pull origin master;
    cd ~/code/qdl/iq-progress-service/ && echo "Updating $(pwd)" && git pull origin master;
    
    
    # QDL general
    cd ~/code/qdl/docker-images/ && echo "Updating $(pwd)" && git pull origin master;
    cd ~/code/qdl/iq-data-platform-gateway/ && echo "Updating $(pwd)" && git pull origin master;
    cd ~/code/qdl/shared-qamelfiles/ && echo "Updating $(pwd)" && git pull origin master;
    cd ~/code/qdl/test-harness/ && echo "Updating $(pwd)" && git pull origin master;

    
    # company projects
    cd ~/code/global/qamel-driver && echo "Updating $(pwd)" && git pull origin master;
    cd ~/code/global/auto-patched-images-registry && echo "Updating $(pwd)" && git pull origin main;
    cd ~/code/global/vault && echo "Updating $(pwd)" && git pull origin master;
    cd ~/code/global/vault-govcloud && echo "Updating $(pwd)" && git pull origin master;
    cd ~/code/global/hiera && echo "Updating $(pwd)" && git pull origin master;
    cd ~/code/global/jwt-curl && echo "Updating $(pwd)" && git pull origin master;

    # tooling
    cd ~/cli-ai/ && echo "Updating $(pwd)" && git pull origin main && zsh ./run_build.zsh;

    cd $TMP
}



regions () {
	echo """
    DC        AWS REGION
    -----------------------------------------------------
    b1        us-west-2        $(TZ=America/Los_Angeles \date "+%Y-%m-%d %H:%M")
    g1-cmh    us-east-2        $(TZ=EST \date "+%Y-%m-%d %H:%M")

    syd1      ap-southeast-2   $(TZ=Australia/Sydney \date "+%Y-%m-%d %H:%M")
    fra1      eu-central-1     $(TZ=Europe/Berlin \date "+%Y-%m-%d %H:%M")
    yul1      ca-central-1     $(TZ=EST \date "+%Y-%m-%d %H:%M")
    hnd1      ap-northeast-1   $(TZ=Asia/Tokyo \date "+%Y-%m-%d %H:%M")
    sjc1      us-west-1        $(TZ=America/Los_Angeles \date "+%Y-%m-%d %H:%M")
    iad1      us-east-1        $(TZ=EST \date "+%Y-%m-%d %H:%M")
    sin1      ap-southeast-1   $(TZ=Asia/Singapore \date "+%Y-%m-%d %H:%M")
    lhr1      eu-west-2        $(TZ=Europe/Berlin \date "+%Y-%m-%d %H:%M")

    gov1      us-gov-west-1    $(TZ=America/Los_Angeles \date "+%Y-%m-%d %H:%M")
    """
}

function sanity_check() {
    function run_request () {
        local dc=$1
        local brand=$2
        local fsid=$3
        local token=$4
        if [ -z $5 ]
        then
            local fail=""
        else
            local fail="--fail"
        fi

        local BODY='{"table":{"name":"'$fsid'"},"metrics":[{"metric":"count","field":"_recordId","key":"count"}]}'
        ssh $DC  "curl $fail --silent -H'X-JWT: $token' -H 'Content-Type: application/json' --data '$BODY' iq-data-platform.service.consul:9000/datalake-egress-api/v2/query"
    }

    echo "b1-prv 0d72581cbb7f4f29b257fd2a qb1prv
    g1-iad 2face0722ce54b96b317822c qg1iad
    lhr1 9c4b0255f482400f8e4b1ae7 qcorp
    iad1 ff26a80ffa444b4e82d0b823 qus1
    sjc1 0c28018f33464df285425fac qaz1
    syd1 1abb5c0b0315423ba9093bad qasia
    fra1 442dc7088677407bb7b45196 qeurope" | grep ${1:-".*"} | while read dc fsid brand
    do
        DC=$(echo "$dc" | sed -e 's/b1-prv/b1/' -e 's/g1-iad/g1/')
        JWT_SHOW_TOKEN=1 JWT_AUD=qualtrics JWT_BRAND_ID=$brand jwt_curl | while read token
        do 
            echo -n "dc=$(printf %-6s $dc) fieldset_id=$fsid brand=$(printf %-7s $brand) status="
            run_request $DC $brand $fsid $token 0 >/dev/null
            if [ $? -eq 0 ]
            then
                echo "SUCCESS"
            else
                echo "FAILED response=$(run_request $DC $brand $fsid $token)"
            fi
        done
    done

}



