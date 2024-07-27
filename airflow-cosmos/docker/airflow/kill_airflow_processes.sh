#!/bin/bash

# Find PIDs of processes containing the specified strings
airflow_pid=$(ps aux | grep "webserver" | grep -v "grep" | awk '{print $2}')
gunicorn_pid=$(ps aux | grep "gunicorn" | grep -v "grep" | awk '{print $2}')
scheduler_pid=$(ps aux | grep "scheduler" | grep -v "grep" | awk '{print $2}')
task_pid=$(ps aux | grep "task runner" | grep -v "grep" | awk '{print $2}')

# Kill processes gracefully with SIGTERM
for pid in $airflow_pid $gunicorn_pid $scheduler_pid $task_pid; do
    if [ -n "$pid" ]; then
        echo "Killing process with PID: $pid"
        kill -SIGTERM "$pid"
    fi
done

# Wait for processes to terminate
sleep 5

# Check if processes are still running
for pid in $airflow_pid $gunicorn_pid $scheduler_pid $task_pid; do
    if ps -p "$pid" > /dev/null; then
        echo "Process with PID $pid is still running. Forcing termination with SIGKILL."
        kill -SIGKILL "$pid"
    fi
done

echo "All specified processes have been terminated."
