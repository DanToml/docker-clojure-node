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
  python \
  tar \
  xz

RUN curl -SLO "https://nodejs.org/dist/v7.9.0/node-v7.9.0.tar.xz"

RUN tar -xf node-v7.9.0.tar.xz \
  && cd "node-v7.9.0" \
  && ./configure \
  && make -j$(getconf _NPROCESSORS_ONLN) \
  && make install \
  && apk del .build-deps \
  && cd .. \
  && rm -Rf "node-v7.9.0" \
  && rm "node-v7.9.0.tar.xz"
