FROM ubuntu:latest

# Core dependencies
RUN apt-get update && apt-get install -y \
  ca-certificates \
  curl

ARG NODE_VERSION=14.16.0
ARG NODE_PACKAGE=node-v$NODE_VERSION-linux-x64
ARG NODE_HOME=/opt/$NODE_PACKAGE

ENV NODE_PATH $NODE_HOME/lib/node_modules
ENV PATH $NODE_HOME/bin:$PATH

RUN curl https://nodejs.org/dist/v$NODE_VERSION/$NODE_PACKAGE.tar.gz | tar -xzC /opt/

# comes with npm
RUN npm install -g typescript
# Node

RUN npm install -g newman newman-reporter-html

ENV HTTP_PROXY="http://outappl.pnet.ch:3128"
ENV HTTPS_PROXY="http://outappl.pnet.ch:3128"
ENV NO_PROXY="localhost,artifactory.tools.post.ch,pnet.ch,post.ch,pnetcloud.ch,pextint.ch"

WORKDIR /etc/newman

ENTRYPOINT ["newman"]
