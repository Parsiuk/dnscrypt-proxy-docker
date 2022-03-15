# Even simpler dnscrypt-proxy usage via Docker

This Dockerfile is using Debian 11 and the latest version of dnscrypt-proxy. Provided configuration is listening on all ports.

# Usage

Build the image:

    docker build -t dnscrypt-proxy .

Start the container:

    docker run -d -p 0.0.0.0:50053:53/udp --name dnscrypt-proxy dnscrypt-proxy

# Credit

The Dockerfile in this project is based on [dnscryptio/dnscrypt-proxy-docker](https://github.com/dnscryptio/dnscrypt-proxy-docker), which in turn is based on [dnscrypt-server-docker](https://github.com/jedisct1/dnscrypt-server-docker) by [Frank Denis](https://00f.net/).
