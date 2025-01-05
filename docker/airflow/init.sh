#!/bin/bash

# 引数の定義
while getopts "r" opt; do
  case ${opt} in
    r )
      DO_RESET=true
      ;;
    \? )
      echo "Usage: $0 [-r]"
      echo "  -r: Reset airflow database"
      exit 1
      ;;
  esac
done

export DBT_PROFILES_DIR=/workspace/airflow/dags/dbt
export DBT_PROJECT_DIR=/workspace/airflow/dags/dbt

if [ "$DO_RESET" = true ]; then
    echo "Reset airflow database..."
    airflow db reset -y
    
    # Initialize airflow database
    airflow db init
    
    # Create an admin user for Airflow web UI
    airflow users create \
        --username admin \
        --password admin \
        --firstname Airflow \
        --lastname Admin \
        --role Admin \
        --email admin@example.com
fi

# Activate the Python virtual environment
source /tmp/.cvenv/bin/activate
# Set DBT profiles directory environment variable
export DBT_PROFILE_DIR='/workspace/airflow/dags/dbt'

if [ ! -f "$AIRFLOW_HOME/airflow.db" ]; then
    echo "Airflow database not found, initializing..."
    
    # Initialize Airflow database
    airflow db init

    # Create an admin user for Airflow web UI
    airflow users create \
        --username admin \
        --password admin \
        --firstname Airflow \
        --lastname Admin \
        --role Admin \
        --email admin@example.com
fi

# Delete existing airflow_db connection if exists
airflow connections delete 'airflow_db'

# Add PostgreSQL connection for Airflow metadata database
airflow connections add 'airflow_db' \
    --conn-type 'postgres' \
    --conn-host 'host.docker.internal' \
    --conn-schema "$JQD" \
    --conn-login "$JQU1" \
    --conn-password "$JQP" \
    --conn-port '5432'

# Add Slack webhook connection for notifications
airflow connections add 'test_slack' \
    --conn-type 'slackwebhook' \
    --conn-host 'https://hooks.slack.com/services' \
    --conn-schema '' \
    --conn-login '' \
    --conn-password "$SLACK_WEBHOOK"

# Set timezone to Asia/Tokyo in Airflow config
sed -i 's|^default_timezone = .*|default_timezone = Asia/Tokyo|' airflow/airflow.cfg

# Disable loading example DAGs
sed -i 's/load_examples = True/load_examples = False/' airflow/airflow.cfg

mkdir -p src/streamlit/.streamlit
cat << EOF > src/streamlit/.streamlit/config.toml
[server]
runOnSave = true
port = 8501
address = "0.0.0.0"

[browser]
gatherUsageStats = false

[theme]
base = "dark"
EOF