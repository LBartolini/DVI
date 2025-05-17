FROM openwrt/rootfs:x86_64-openwrt-23.05

RUN mkdir /var/lock;opkg update;opkg install quagga quagga-ospfd quagga-zebra; rm -Rf /var/lock

ENTRYPOINT ["/sbin/init"]