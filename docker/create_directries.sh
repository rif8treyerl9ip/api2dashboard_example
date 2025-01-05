#!/bin/bash

mkdir -p airflow_cosmos/airflow/dags/dbt
mkdir -p airflow_cosmos/airflow/data
mkdir -p airflow_cosmos/airflow/logs
mkdir -p src/experimental
mkdir -p src/sql


mkdir -p dbt/macros
mkdir -p dbt/logs
mkdir -p dbt/seeds
mkdir -p dbt/target
mkdir -p dbt/tests

# create symbolic link for scripts
cd airflow || exit 1
rm scripts
ln -s ../src scripts
cd - || exit 1

# create symbolic link for dbt
cd airflow/dags || exit 1
rm dbt
ln -s ../../dbt dbt
cd - || exit 1
