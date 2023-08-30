#!/bin/bash
set -e
input=${1:-0}
date=`date`
echo -e "{'date':'$date', 'agentid':$input}" >> /data/agent.on
exit 0
