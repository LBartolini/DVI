FROM camunda/camunda-bpm-platform:tomcat-7.15.0 AS camunda
FROM tomcat:9-jdk21-openjdk-bullseye AS run

RUN apt-get update -qq && apt-get install -y curl wait-for-it iputils-ping iproute2

WORKDIR /usr/local/tomcat/
COPY --from=camunda /camunda/conf/bpm-platform.xml /usr/local/tomcat/conf/bpm-platform.xml
COPY --from=camunda /camunda/lib/*.jar /usr/local/tomcat/lib/
COPY --from=camunda /camunda/webapps/camunda /usr/local/tomcat/webapps/camunda/
COPY --from=camunda /camunda/webapps/camunda-welcome /usr/local/tomcat/webapps/camunda-welcome
COPY --from=camunda /camunda/webapps/engine-rest /usr/local/tomcat/webapps/engine-rest

ADD context.xml /usr/local/tomcat/conf/
ADD server.xml /usr/local/tomcat/conf/
ADD entrypoint.sh /usr/local/bin
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]