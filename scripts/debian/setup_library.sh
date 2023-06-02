KAFKA_DIR=/usr/local/kafka
WORKSPACE_DIR=/workspaces/notification-service
LOG_DIR=$WORKSPACE_DIR/logs
current_date_time=$(date +"%d-%m-%Y-%T")

function check_and_create_directory(){
    if [ ! -d "$1" ]; then
    mkdir -p "$1"
    echo "Directory '$1' created."
    else
    echo "Directory '$1' already exists."
    fi
}

function kafka_init(){
    # Install Kafka
    wget https://downloads.apache.org/kafka/3.4.0/kafka_2.13-3.4.0.tgz
    tar -xzf kafka_2.13-3.4.0.tgz
    sudo rm kafka_2.13-3.4.0.tgz
    sudo mv kafka_2.13-3.4.0 $KAFKA_DIR
    cd $KAFKA_DIR
    sudo nohup ./bin/zookeeper-server-start.sh config/zookeeper.properties > $LOG_DIR/other/zookeeper_$current_date_time.log &
    sudo nohup ./bin/kafka-server-start.sh config/server.properties > $LOG_DIR/other/kafka_$current_date_time.log &

}

function redis_init(){
    #Install Redis
    sudo apt-get install -y redis-server
    sudo service redis-server start
}
function app_init(){
    #Start Project
    cd $WORKSPACE_DIR
    nohup mvn spring-boot:run >$LOG_DIR/application/notif_service_main_$current_date_time.log &
}
function db_init(){
    # Install PostgreSQL
    sudo apt-get install -y postgresql
    sudo service postgresql start
}