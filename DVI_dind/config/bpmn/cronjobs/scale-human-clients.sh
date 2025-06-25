#!/bin/sh
set -e

for building in biblioteca seb delfino lagorio marchi locatelli
do
curl \
  -H "Content-Type: application/json" \
  -X POST \
  --data @- \
  "http://${CAMUNDA_HOST}:${CAMUNDA_PORT}/engine-rest/process-definition/key/scale-human-clients/start" <<EOF
{
  "variables": {
    "debug": { "value": true, "type": "Boolean" },
    "cluster_size": { "value" : 10, "type": "Double" },
    "ditto_url": { "value" : "http://${DITTO_HOST}:${DITTO_PORT}" },
    "ditto_username" : { "value" : "camunda-people-simulator" },
    "ditto_password" : { "value" : "secret" },
    "ditto_thing_id" : { "value" : "FDT:people-simulator" },
    "compose_service_name" : { "value" : "client_${building}" },
    "docker_api_proxy" : { "value" : "http://${DOCKER_API_PROXY_HOST}:${DOCKER_API_PROXY_PORT}" }
  }
}
EOF
done
