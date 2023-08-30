#!/bin/bash

# Retry for matching this count or timeout
EXPECTED_CNT=$1
# Maximum time to wait in seconds
MAX_POLL_DELAY=$2
# Retry interval 
POLL_INTERVAL=5
# Get the current timestamp
START_TIME=$(date +%s)
# Checkin file
FILE_NAME='/data/agent.on'


check-is-available() {
    if [ $(grep "agentid" $FILE_NAME |wc -l) -lt $EXPECTED_CNT ]; then
        return 1
    else
        return 0
    fi
}

while true; do
    current_time=$(date +%s)
    elapsed_time=$((current_time - START_TIME))
    
    if [ $elapsed_time -ge $MAX_POLL_DELAY ]; then
        exit 1
    fi
    
    check-is-available
    exit_status=$?
    if [ $exit_status -eq 0 ]; then
        exit 0
    else
        sleep $POLL_INTERVAL
    fi
done
