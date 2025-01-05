#!/bin/bash

if [ -d ".venv" ]; then
    echo "Virtual environment already exists"
else
    python3 -m venv .venv
    source .venv/bin/activate
    python3 -m pip install pre-commit
    pre-commit install
fi

source .venv/bin/activate