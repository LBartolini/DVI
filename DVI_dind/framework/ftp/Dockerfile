FROM vinetutech/wingftp:7.4.0
RUN apt-get update -qq && apt-get install -y iputils-ping iproute2
CMD ["/bin/sh", "-c", "/etc/init.d/wftpserver start && tail -f /dev/null"]