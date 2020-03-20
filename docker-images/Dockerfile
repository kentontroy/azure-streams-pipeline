FROM node:12.0-slim

RUN npm install
RUN apt-get update
RUN apt-get install -f
RUN apt-get install -y gcc g++ make
RUN apt-get install -y vim
RUN apt-get install -y librdkafka-dev
RUN apt-get install -y libsasl2-dev
RUN apt-get install -y libssl-dev
RUN apt-get install -y --reinstall procps

RUN mkdir /app
WORKDIR /app

RUN npm install kafkajs
RUN npm install json-stringify
RUN npm install avro-js
RUN npm install lodash
RUN npm install router
RUN npm install finalhandler
RUN npm install http
RUN npm install request

