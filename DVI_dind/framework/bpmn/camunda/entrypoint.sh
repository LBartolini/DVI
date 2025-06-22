#!/bin/bash
set -e
# Configure Camunda
sed -i "s|<!--CAMUNDADBUSER-->|username=\"$CAMUNDA_DB_USER\"|g" /usr/local/tomcat/conf/server.xml
sed -i "s|<!--CAMUNDADBPASS-->|password=\"$CAMUNDA_DB_PASS\"|g" /usr/local/tomcat/conf/server.xml
sed -i "s|<!--CAMUNDADBURL-->|url=\"jdbc:mysql://$DB_HOST:$DB_PORT/$CAMUNDA_DB_NAME\"|g" /usr/local/tomcat/conf/server.xml
# Wait DB
echo "Waiting for DB"
wait-for-it -t 0 --strict "${DB_HOST}:${DB_PORT}" -- echo "Database online"
# Start tomcat
exec catalina.sh run