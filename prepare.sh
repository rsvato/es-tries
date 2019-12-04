#! /bin/sh

CURL=$(which curl)

if [ ${CURL}z == "z" ]; then
    echo "No curl found, cannot continue"
    exit 1
fi

CURL -X PUT http://localhost:9200/_template/liferay-template --data-binary @template.json -H 'Content-type: application/json'
