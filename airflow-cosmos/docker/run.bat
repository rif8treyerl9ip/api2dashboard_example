@REM docker run -it --rm ^
docker run -it ^
    --name airflow-dbt ^
    --user airflow ^
    --env-file docker/.env -p 8080:8080 ^
    -v %cd%/airflow/dags:/workspace/airflow/dags ^
    -v %cd%/airflow/logs:/workspace/airflow/logs ^
    -v %cd%/airflow/data:/workspace/airflow/data ^
    -v %cd%/airflow/scripts:/workspace/airflow/scripts ^
    -v %cd%/docker:/workspace/docker ^
    airflow-dbt

@REM docker\run.bat
