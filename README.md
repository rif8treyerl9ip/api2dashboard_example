![Cosmos Logo](https://raw.githubusercontent.com/astronomer/astronomer-cosmos/main/docs/_static/cosmos-logo.svg)

-------------------

## Setting up an Environment with Airflow and DBT

Follow these steps to set up an environment that includes Airflow and DBT:

Create directories:

```bash
docker/create_directries.sh
```

### Build and Run

```bash
docker/build.sh

docker/run.sh --rm
```

## Initial Setup When Creating the Container

Run the following command initially when creating the container to initialize Airflow:

```bash
source docker/airflow/init.sh
source docker/airflow/start.sh
```

## Stopping and Cleaning Up

To stop the Airflow processes and clean up the environment, follow these steps:

- Kill any remaining Airflow processes:

```bash
docker/airflow/kill.sh
```

- Clean up Airflow logs:

```bash
docker/airflow/clean_log.sh
```