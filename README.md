# Even simpler dnscrypt-proxy usage via Docker
[![Build Status](https://travis-ci.org/dnscryptio/dnscrypt-proxy-docker.svg?branch=master)](https://travis-ci.org/dnscryptio/dnscrypt-proxy-docker)

# Usage

Build the image:

	docker build -t dnscrypt-proxy .

Start the container:

	docker run -d -p 127.0.0.1:50053:50053/udp dnscrypt-proxy

# Credit

The Dockerfile in this project is based on [dnscryptio/dnscrypt-proxy-docker]https://github.com/dnscryptio/dnscrypt-proxy-docker(), which in turn is based on [dnscrypt-server-docker](https://github.com/jedisct1/dnscrypt-server-docker) by [Frank Denis](https://00f.net/).
