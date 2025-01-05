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
    tree \
    postgresql-client \
    graphviz \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -ms /bin/bash airflow \
    && usermod -aG sudo airflow \
    && echo "airflow ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER airflow

WORKDIR /workspace

ENV AIRFLOW_HOME=/workspace/airflow
ENV PATH="/tmp/.cvenv/bin:$PATH" \
    AIRFLOW__CORE__LOAD_EXAMPLES=false

COPY docker/requirements.txt /tmp/requirements.txt
RUN python3 -m venv /tmp/.cvenv \
    && . /tmp/.cvenv/bin/activate \
    && pip install -r /tmp/requirements.txt

RUN mkdir -p /workspace/airflow /workspace/docker
RUN chown airflow:airflow /workspace
RUN chown -R airflow:airflow /workspace/docker

EXPOSE 8080
