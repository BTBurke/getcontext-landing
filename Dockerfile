FROM ubuntu:16.04
MAINTAINER Bryan Burke <bryan@getcontext.io>

RUN apt-get update && apt-get upgrade -y  && apt-get install -y curl git
RUN curl https://caddyserver.com/download/build?os=linux&arch=amd64&features=cors%2Cgit > caddy.tar.gz
RUN tar -xvzf caddy.tar.gz
RUN mv caddy /usr/local/bin/caddy

RUN git clone https://github.com/BTBurke/getcontext-landing /site

VOLUME /root/.caddy

WORKDIR /site

ENTRYPOINT ["caddy", "--agree"]
