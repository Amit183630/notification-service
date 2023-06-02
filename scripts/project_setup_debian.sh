#!/bin/bash

KAFKA_DIR=/usr/local/kafka
WORKSPACE_DIR=/workspaces/notification-service
LOG_DIR=$WORKSPACE_DIR/logs
current_date_time=$(date +"%d-%m-%Y-%T")

sudo apt-get update

check_and_create_directory "$WORKSPACE_DIR/logs/other"
check_and_create_directory "$WORKSPACE_DIR/logs/application"

kafka_init
redis_init
app_init


