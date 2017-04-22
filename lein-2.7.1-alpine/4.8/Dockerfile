#
# NOTE: THIS DOCKERFILE IS GENERATED VIA "update.sh"
#
# PLEASE DO NOT EDIT IT DIRECTLY.
#
FROM clojure:lein-2.7.1-alpine
MAINTAINER Danielle Tomlinson <dan@tomlinson.io>

ENV NPM_CONFIG_LOGLEVEL info

RUN apk add --no-cache \
      libstdc++ \
      && apk add --no-cache --virtual .build-deps \
      binutils-gold \
      curl \
      g++ \
      gcc \
      libgcc \
      linux-headers \
      make \
      python

RUN curl -SLO "https://nodejs.org/dist/v4.8/node-v4.8.tar.xz"

RUN tar -xf "node-v4.8.tar.xz" \
      && cd "node-v4.8" \
      && ./configure \
      && make -j$(getconf _NPROCESSORS_ONLN) \
      && make install \
      && apk del .build-deps \
      && cd .. \
      && rm -Rf "node-v4.8" \
      && rm "node-v4.8.tar.xz"
