#!/bin/bash


function findPort {
    RESP=$(host -t srv $1 | head -n1)
    if [[ "$RESP" == *"not found"* ]] 
    then
        # port not found, return nothing
        echo ""
    else
        echo $(echo $RESP | awk '{print $(NF-1)}')
    fi


}
URL="${@: -1}"
URL_HOST=$(echo $URL | awk -F'/' '{print $1}')
URL_PATH=$(echo "$URL" |sed 's#^[^/]*##')
PORT=$(findPort $URL_HOST)


if [ "$PORT" == "" ]
then
    (>&2 echo "no SRV record found for $URL_HOST")
    exit 1
fi


ARG_LENGTH_MINUS_ONE=$(($#-1))


curl "${@:1:$ARG_LENGTH_MINUS_ONE}" "${URL_HOST}:${PORT}${URL_PATH}"