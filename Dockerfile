FROM debian:11
MAINTAINER dnscrypt.io

ENV DEPENDENCIES \
    bzip2 \
    tar \
    unzip \
    curl \
    libsodium23

RUN set -x && \
    apt-get update && \
    apt-get install -y $DEPENDENCIES # --no-install-recommends

ENV DNSCRYPT_PROXY_VERSION 2.1.1
ENV DNSCRYPT_PROXY_SHA256 6735fa19833eca5585fc4bc474201f95c6e03151725f1e9aa737e25f9e8c386b
ENV DNSCRYPT_PROXY_DOWNLOAD_URL https://github.com/DNSCrypt/dnscrypt-proxy/releases/download/${DNSCRYPT_PROXY_VERSION}/dnscrypt-proxy-linux_x86_64-${DNSCRYPT_PROXY_VERSION}.tar.gz

RUN set -x && \
    mkdir -p /tmp/dnscrypt-proxy && \
    cd /tmp/dnscrypt-proxy && \
    curl -sSL $DNSCRYPT_PROXY_DOWNLOAD_URL -o dnscrypt-proxy.tar.gz && \
    echo "${DNSCRYPT_PROXY_SHA256} *dnscrypt-proxy.tar.gz" | sha256sum -c - && \
    gunzip dnscrypt-proxy.tar.gz && \
    tar xf dnscrypt-proxy.tar && \
    mkdir -p /opt/dnscrypt-proxy/ && \
    mkdir -p /etc/dnscrypt-proxy/ && \
    cp ./linux-x86_64/dnscrypt-proxy /opt/dnscrypt-proxy/ && \
    cp ./linux-x86_64/example-dnscrypt-proxy.toml /etc/dnscrypt-proxy/dnscrypt-proxy.toml && \
    rm -fr /tmp/* /var/tmp/*

EXPOSE 50053/tcp 50053/udp

CMD /opt/dnscrypt-proxy/dnscrypt-proxy -config /etc/dnscrypt-proxy/dnscrypt-proxy.toml
