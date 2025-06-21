#!/bin/bash
set -e
# Copy scada lts uploads
if [ -d /scada-lts-uploads ]; then
  mkdir -p /usr/local/tomcat/webapps/ScadaLTS/uploads
  for f in /scada-lts-uploads/*; do
    cp -f "$f" /usr/local/tomcat/webapps/ScadaLTS/uploads
  done
fi
# Configure ScadaLTS
sed -i "s|<!--SCADADBUSER-->|username=\"$SCADA_DB_USER\"|g" /usr/local/tomcat/conf/context.xml
sed -i "s|<!--SCADADBPASS-->|password=\"$SCADA_DB_PASS\"|g" /usr/local/tomcat/conf/context.xml
sed -i "s|<!--SCADADBURL-->|url=\"jdbc:mysql://$DB_HOST:$DB_PORT/$SCADA_DB_NAME\"|g" /usr/local/tomcat/conf/context.xml
# Wait DB
echo "Waiting for DB"
wait-for-it -t 0 --strict "${DB_HOST}:${DB_PORT}" -- echo "Database online"
# Start tomcat
exec catalina.sh run