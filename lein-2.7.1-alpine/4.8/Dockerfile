#
# NOTE: THIS DOCKERFILE IS GENERATED VIA "update.sh"
#
# PLEASE DO NOT EDIT IT DIRECTLY.
#
FROM clojure:lein-2.7.1-alpine
MAINTAINER Danielle Tomlinson <dan@tomlinson.io>

ENV NPM_CONFIG_LOGLEVEL info
ENV NODE_VERSION 4.8

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
      python \
      && curl -SLO "https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION.tar.xz" \
      && tar -xf "node-v$NODE_VERSION.tar.xz" \
      && cd "node-v$NODE_VERSION" \
      && ./configure \
      && make -j$(getconf _NPROCESSORS_ONLN) \
      && make install \
      && apk del .build-deps \
      && cd .. \
      && rm -Rf "node-v$NODE_VERSION" \
      && rm "node-v$NODE_VERSION.tar.xz"
