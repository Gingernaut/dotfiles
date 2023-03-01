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

    
    # company projects
    cd ~/code/global/qamel-driver && echo "Updating $(pwd)" && git pull origin master;
    

    cd $TMP
}

dlogs() {
    docker ps | grep $1 | awk '{if(NR>0)print}' | awk '{ print $1 }' | read CTNR_ID; docker logs --follow $CTNR_ID
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