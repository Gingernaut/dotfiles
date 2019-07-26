export CONSUL_HTTP_ADDR="consul1-app.eng.qops.net:8500"
export TUNNEL_SERVICE_DISABLE_TUNNELING=1
# opens a tunnel to a consul service and opens the root page in the web browser
# requires CONSUL_HTTP_ADDR to be set, likely to consul1-app.eng.qops.net:8500
tunnel_service () {
        DC=$1
        SERVICE_NAME=$2
        ssh $DC "host -t srv $SERVICE_NAME.service.consul" | sed 's/\.$//' | awk '{print $(NF-1), $NF}' | while read port host
        do
                echo $port $(ssh $DC "dig +noall +answer $host" | awk 'NR==1{print $NF}')
        done | while read port ip
        do
                if [ -z "$TUNNEL_SERVICE_DISABLE_TUNNELING" ]
                then
                        ssh $DC -L $port:$ip:$port 2> /dev/null && echo "Tunnel created at localhost:$port"
                fi
                if [ -z "$TUNNEL_SERVICE_DISABLE_OPEN_URL" ]
                then
                        if [ -z "$TUNNEL_SERVICE_DISABLE_TUNNELING" ]
                        then
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

    if [ -n "$dc" ]; then
        completions=$(consul catalog services -datacenter=$dc)
        reply=("${(ps:\n:)completions}")
    fi
}

function _sh_tunnel_service_completion() {
    dc="${COMP_WORDS[1]}"

    if [ -n "$dc" ]; then
        completions=$(consul catalog services -datacenter=$dc)
        COMPREPLY=($(compgen -W "${completions}" "${COMP_WORDS[2]}"))
    fi
}
if type compctl >/dev/null; then
    compctl -K _zsh_tunnel_service_completion tunnel_service
fi
if type complete >/dev/null; then
    complete -F _sh_tunnel_service_completion tunnel_service
fi
