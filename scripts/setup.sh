#!/bin/bash

# Install Kafka
wget https://downloads.apache.org/kafka/3.4.0/kafka_2.13-3.4.0.tgz
tar -xzf kafka_2.13-3.4.0.tgz
rm kafka_2.13-3.4.0.tgz
mv kafka_2.13-3.4.0.tgz /usr/local/kafka

# Install PostgreSQL
apt-get update
apt-get install -y postgresql

# Install Redis
apt-get install -y redis-server

# Start Kafka, PostgreSQL, and Redis services
service kafka start
service postgresql start
service redis-server start