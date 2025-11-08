#
# Build
#
FROM maven:3.8.1-openjdk-16 AS build
# Copy POM
RUN mkdir -p /opt/dittoregister
ADD pom.xml /opt/dittoregister
# Download dependencies
WORKDIR /opt/dittoregister
RUN mvn dependency:resolve-plugins dependency:go-offline
# Create JAR
COPY src /opt/dittoregister/src
RUN mvn package
#
# Run
#
FROM eclipse-temurin:16-jdk-alpine
COPY --from=build /opt/dittoregister/target/lib /opt/lib
COPY --from=build /opt/dittoregister/target/dittoregister-*.jar /opt/dittoregister.jar
RUN apk add --no-cache iputils iproute2
WORKDIR /opt
ENTRYPOINT [ "java","-jar", "/opt/dittoregister.jar" ]
