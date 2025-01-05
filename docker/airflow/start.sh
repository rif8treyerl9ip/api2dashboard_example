#!/bin/bash

source /tmp/.cvenv/bin/activate

airflow webserver --port 8080 &
echo "Started Airflow Webserver (PID: $!)"

sleep 5

airflow scheduler &
echo "Started Airflow Scheduler (PID: $!)"

pgrep -f "airflow"
