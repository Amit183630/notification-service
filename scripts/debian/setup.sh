source setup_library.sh
sudo apt-get update

check_and_create_directory "$LOG_DIR/other"
check_and_create_directory "$LOG_DIR/application"

kafka_init
redis_init
app_init