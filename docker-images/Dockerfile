FROM debezium/example-mysql:0.8

RUN apt-get update -y 
RUN apt-get -y install net-tools
RUN apt-get -y install netcat
RUN apt-get -y install systemd
RUN apt-get install -y vim

USER root:root

RUN mkdir /opt/kafka-connect-configs
RUN echo "Copying post start scripts to create MySQL demo database and sample table"
COPY poststart.sh /opt/kafka-connect-configs
RUN chmod -R 755 /opt/kafka-connect-configs

WORKDIR /opt/kafka-connect-configs

