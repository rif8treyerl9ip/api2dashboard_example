#!/bin/bash

# Get current directory and check if -r flag is provided
base_dir="$(pwd)"
rm_flag=${1:-""}  # If no argument provided, empty string
echo "rm_flag: $rm_flag"

docker run -it "${rm_flag}" \
  --name airflow-dbt \
  --user airflow \
  --env-file docker/.env \
  -p 8080:8080 \
  -p 8501:8501 \
  -e TZ=Asia/Tokyo \
  -v "${base_dir}:/workspace" \
  airflow-dbt
