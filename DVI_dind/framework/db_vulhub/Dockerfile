FROM vulhub/mysql:5.5.23
RUN apt update && apt install -y iputils-ping
EXPOSE 3306
ENTRYPOINT [ "/bin/bash", "-c", "mysqld_safe" ]