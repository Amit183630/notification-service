cd /usr/local/kafka
LOG_FOLDER=/workspaces/notification-service/logs/other
current_date_time=$(date +"%d-%m-%Y-%T")
nohup ./bin/zookeeper-server-start.sh config/zookeeper.properties > $LOG_FOLDER/zookeeper_$current_date_time.log &
nohup ./bin/kafka-server-start.sh config/server.properties > $LOG_FOLDER/kafka_$current_date_time.log &