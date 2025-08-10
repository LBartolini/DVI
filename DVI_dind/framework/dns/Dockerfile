FROM debian:12-slim
RUN apt-get update -qq && apt-get install -y bind9 dnsutils iputils-ping
ENTRYPOINT [ "/usr/sbin/named", "-c", "/etc/bind/named.conf", "-f", "-u", "bind" ]