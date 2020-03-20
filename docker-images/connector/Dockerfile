FROM confluentinc/cp-kafka-connect-base:5.4.1

RUN apt-get update -y 
RUN apt-get -y install net-tools
RUN apt-get -y install netcat
RUN apt-get -y install systemd
RUN apt-get install -y vim

USER root:root

RUN   confluent-hub install --no-prompt confluentinc/kafka-connect-gcs-source:1.2.1 \
   && confluent-hub install --no-prompt confluentinc/kafka-connect-gcs:5.5.0 \
   && confluent-hub install --no-prompt debezium/debezium-connector-sqlserver:1.0.0 \
   && confluent-hub install --no-prompt debezium/debezium-connector-mysql:1.0.0 \
   && confluent-hub install --no-prompt wepay/kafka-connect-bigquery:latest \
   && confluent-hub install --no-prompt confluentinc/kafka-connect-jdbc:5.4.1 \
   && confluent-hub install --no-prompt confluentinc/kafka-connect-salesforce:1.4.2

COPY connect-distributed /usr/bin/ 

RUN chmod 755 /usr/bin/connect-distributed

RUN mkdir /etc/kafka-custom

ENV MYSQL_DRIVER_VERSION 5.1.39

RUN curl -k -SL "https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-${MYSQL_DRIVER_VERSION}.tar.gz" \
     | tar -xzf - -C /usr/share/java/kafka/ --strip-components=1 mysql-connector-java-5.1.39/mysql-connector-java-${MYSQL_DRIVER_VERSION}-bin.jar

