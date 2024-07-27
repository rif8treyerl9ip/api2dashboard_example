FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    libffi-dev \
    libssl-dev \
    libpq-dev \
    python3.10 \
    python3.10-dev \
    python3.10-distutils \
    python3-pip \
    python3-dev \
    python3-venv \
    git \
    sudo \
    vim \
    jq \
    postgresql-client \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -ms /bin/bash airflow \
    && usermod -aG sudo airflow \
    && echo "airflow ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER airflow

WORKDIR /workspace

ENV AIRFLOW_HOME=/workspace/airflow
ENV PATH="/workspace/airflow/.local/bin:$PATH" \
    AIRFLOW__CORE__LOAD_EXAMPLES=false

RUN python3 -m venv .venv \
    && . .venv/bin/activate \
    && pip install --upgrade pip setuptools wheel \
    && pip install pandas psycopg2 requests \
    apache-airflow \
    astronomer-cosmos \
    dbt-core \
    dbt-postgres \
    apache-airflow-providers-postgres \
    "apache-airflow-providers-common-sql>=1.3.1" \
    apache-airflow-providers-slack

RUN mkdir -p /workspace/airflow /workspace/docker
RUN chown airflow:airflow /workspace
RUN chown -R airflow:airflow /workspace/docker

EXPOSE 8080
