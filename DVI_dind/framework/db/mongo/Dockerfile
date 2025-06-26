FROM mongo:5
RUN apt-get update && apt-get install -y iputils-ping iproute2
CMD [ "mongod", "--noscripting" ]