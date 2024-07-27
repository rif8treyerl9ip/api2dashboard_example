#!/bin/bash

source .venv/bin/activate
airflow webserver --port 8080 > airflow/logs/webserver.log 2>&1 & \

source .venv/bin/activate
airflow scheduler > airflow/logs/scheduler.log 2>&1 &

# docker/airflow/start.sh
