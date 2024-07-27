![Cosmos Logo](https://raw.githubusercontent.com/astronomer/astronomer-cosmos/main/docs/_static/cosmos-logo.svg)

-------------------

## Setting up an Environment with Airflow and DBT

Follow these steps to set up an environment that includes Airflow and DBT:

### 1. Build the Docker Image

```bash
docker\build.bat
```

### 2. Run the Docker Container

```bash
docker\run.bat
```

### 3. Restart Existing Container (If Applicable)

If you have an existing container that you want to restart, use the following command:

```bash
docker\restart.bat
```

## Initial Setup When Creating the Container

Run the following command initially when creating the container to initialize Airflow:

```bash
 docker/airflow/init.sh
 docker/airflow/start.sh
```

## Stopping and Cleaning Up

To stop the Airflow processes and clean up the environment, follow these steps:

- Kill any remaining Airflow processes:

```bash
chmod +x docker/airflow/kill_airflow_processes.sh
docker/airflow/kill.sh
```

- Clean up Airflow logs:

```bash
rm -rf /workspace/airflow/logs/*
```

-  Stop the Docker container:

```bash
docker\stop.bat
```

-  Delete the Docker container:

```bash
docker\delete.bat
```



