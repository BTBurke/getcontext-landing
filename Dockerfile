FROM ubuntu:16.04
MAINTAINER Bryan Burke <bryan@getcontext.io>

RUN apt-get update && apt-get upgrade -y  && apt-get install -y wget git
RUN wget https://github.com/mholt/caddy/releases/download/v0.9.5/caddy_linux_amd64.tar.gz
RUN tar -xvzf caddy_linux_amd64.tar.gz
RUN mv caddy /usr/local/bin

RUN git clone github.com/BTBurke/getcontext-landing /site

VOLUME /root/.caddy

WORKDIR /site

ENTRYPOINT ["caddy", "--agree"]
