FROM ubuntu:16.04
MAINTAINER Bryan Burke <bryan@getcontext.io>

RUN apt-get update && apt-get upgrade -y  && apt-get install -y wget git
RUN wget https://s3.amazonaws.com/context-public/caddy.tar.gz
RUN tar -xvzf caddy.tar.gz
RUN mv caddy /usr/local/bin/caddy

RUN mkdir -p /site
ADD . /site

VOLUME /root/.caddy

WORKDIR /site

ENTRYPOINT ["caddy", "--agree"]
