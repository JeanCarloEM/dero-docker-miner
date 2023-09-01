# Maintainer
FROM alpine:3.18

LABEL MAINTAINER="Jean Carlo EM <jeancarlo@jeancarloem.com>"

ENV WALLET=""
ENV DAEMON=""
ENV RELEASE="https://github.com/deroproject/derohe/releases/latest/download/dero_linux_amd64.tar.gz"
ENV CORES="4"

# Install necessary packages
RUN apk update && \
    apk add --no-cache ca-certificates tar wget sudo bash

RUN mkdir /app
COPY start.sh /app/

RUN chmod +x /app/*

WORKDIR /app

RUN sudo wget -c $RELEASE  -O - | sudo tar -xz -C /app/
RUN ls -la /app/
RUN sudo chmod +x /app/*/dero-miner-linux-amd64
RUN sudo chmod +x /app/*/derod-linux-amd64

# RUN MINER
ENTRYPOINT ["/bin/bash","-c","/app/start.sh"]