FROM debian:10

RUN apt-get update && apt-get install -y git iputils-ping iproute2
WORKDIR /usr/local/src
RUN git clone https://github.com/thiagoralves/OpenPLC_v3.git
WORKDIR /usr/local/src/OpenPLC_v3
RUN git checkout e0ed93dfd86d09aa521e7b56873021123a56aa97
RUN ./install.sh docker
COPY ./entrypoint.sh ./
RUN /usr/local/src/OpenPLC_v3/.venv/bin/python3 -m pip install flask werkzeug flask-login pyserial pymodbus==2.5.3
RUN chmod +x ./entrypoint.sh
ENTRYPOINT ["./entrypoint.sh"]
