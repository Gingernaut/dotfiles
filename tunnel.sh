export CONSUL_HTTP_ADDR="consul1-app.eng.qops.net:8500"
export TUNNEL_SERVICE_DISABLE_TUNNELING=1
# opens a tunnel to a consul service and opens the root page in the web browser
# requires CONSUL_HTTP_ADDR to be set, likely to consul1-app.eng.qops.net:8500
tunnel_service () {
        DC=$(echo "$1" | sed -e 's/b1-prv/b1/' -e 's/g1-iad/g1/' -e 's/a1-prv/a1/')
        SERVICE_NAME=$2
        ssh $DC "host -t srv $SERVICE_NAME.service.consul" | sed 's/\.$//' | awk '{print $(NF-1), $NF}' | while read port host
        do
                echo $port $(ssh $DC "dig +noall +answer $host" | awk 'NR==1{print $NF}')
        done | while read port ip
        do
                if [ -z "$TUNNEL_SERVICE_DISABLE_TUNNELING" ] && ! [[ "$DC" =~ ^(b1|g1|a1)$ ]]; then
                    ssh $DC -L $port:$ip:$port 2>/dev/null && echo "Tunnel created at localhost:$port"
                fi
                if [ -z "$TUNNEL_SERVICE_DISABLE_OPEN_URL" ]; then
                    if [ -z "$TUNNEL_SERVICE_DISABLE_TUNNELING" ] && ! [[ "$DC" =~ ^(b1|g1|a1)$ ]]; then
                            open http://localhost:$port && echo "opened browser tab at 'http://localhost:$port'"
                    else
                        open http://$ip:$port && echo "opened browser tab at 'http://$ip:$port'"
                    fi
                fi
        done
}


function _zsh_tunnel_service_completion() {
    local dc


    dc=${words[2]}
    datacenters=$(CONSUL_HTTP_ADDR="$STAGE_CONSUL_HTTP_ADDR" consul catalog datacenters && consul catalog datacenters)
    greppable_datacenters=$(echo $datacenters | tr '\r\n' '|' | sed -e 's/^/|/' -e 's/$/|/')


    # if DC matches the possible DCs
    if [[ "$greppable_datacenters" == *"|$dc|"* ]]; then
        if [[ "$dc" =~ ^(b1-prv|g1-iad|a1-prv)$ ]]; then
            completions=$(CONSUL_HTTP_ADDR="$STAGE_CONSUL_HTTP_ADDR" consul catalog services -datacenter="$dc")
        else
            completions=$(consul catalog services -datacenter="$dc")
        fi
    else
        completions=$datacenters
    fi
    reply=("${(ps:\n:)completions}")
}


function _sh_tunnel_service_completion() {
    dc="${COMP_WORDS[1]}"
    datacenters=$(CONSUL_HTTP_ADDR="$STAGE_CONSUL_HTTP_ADDR" consul catalog datacenters && consul catalog datacenters)
    greppable_datacenters=$(echo $datacenters | sed -e 's/ /|/g' -e 's/^/|/' -e 's/$/|/')


    if [[ "$greppable_datacenters" == *"|$dc|"* ]]; then
        if [[ "$dc" =~ ^(b1-prv|g1-iad|a1-prv)$ ]]; then
            completions=$(CONSUL_HTTP_ADDR="$STAGE_CONSUL_HTTP_ADDR" consul catalog services -datacenter="$dc")
        else
            completions=$(consul catalog services -datacenter="$dc")
        fi
    else
        completions=$datacenters
    fi
    COMPREPLY=($(compgen -W "${completions}" "${COMP_WORDS[2]}"))
}
if type compctl >/dev/null; then
    compctl -K _zsh_tunnel_service_completion tunnel_service
fi
if type complete >/dev/null; then
    complete -F _sh_tunnel_service_completion tunnel_service
fi
