#!/bin/bash

# Install Kafka
wget https://downloads.apache.org/kafka/3.4.0/kafka_2.13-3.4.0.tgz
tar -xzf kafka_2.13-3.4.0.tgz
sudo rm kafka_2.13-3.4.0.tgz
sudo mv kafka_2.13-3.4.0 /usr/local/kafka

# Install PostgreSQL
sudo apt-get update
#sudo apt-get install -y postgresql

# Install Redis
sudo apt-get install -y redis-server

# Start Kafka, PostgreSQL, and Redis services
source kafka-start.sh
#sudo service postgresql start
sudo service redis-server start