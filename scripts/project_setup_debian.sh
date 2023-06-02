#!/bin/bash

KAFKA_DIR=/usr/local/kafka
WORKSPACE_DIR=/workspaces/notification-service
LOG_DIR=$WORKSPACE_DIR/logs

# Install Kafka
wget https://downloads.apache.org/kafka/3.4.0/kafka_2.13-3.4.0.tgz
tar -xzf kafka_2.13-3.4.0.tgz
sudo rm kafka_2.13-3.4.0.tgz
sudo mv kafka_2.13-3.4.0 $KAFKA_DIR

# Install PostgreSQL
sudo apt-get update
#sudo apt-get install -y postgresql

# Install Redis
sudo apt-get install -y redis-server

# Start Kafka, PostgreSQL, and Redis services

#Start Kafka server
cd $KAFKA_DIR
current_date_time=$(date +"%d-%m-%Y-%T")
nohup ./bin/zookeeper-server-start.sh config/zookeeper.properties > $LOG_DIR/other/zookeeper_$current_date_time.log &
nohup ./bin/kafka-server-start.sh config/server.properties > $LOG_DIR.other/kafka_$current_date_time.log &


#sudo service postgresql start
sudo service redis-server start

#Start Project
cd $WORKSPACE_DIR
nohup mvn spring-boot:run >$LOG_DIR/application/notif_service_main_$current_date_time.log &