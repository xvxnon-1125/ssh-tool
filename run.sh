#!/bin/bash

SERVER_LIST="./server.txt"

if [ $# -eq 0 ]; then
echo "ERROR: Command not specified."
echo "Usage: $0 <command>"
exit 1
fi

for SERVER in $(cat "${SERVER_LIST}")
do
printf "\n=== %s %s ===\n" 
"$SERVER" 
"$(date '+%Y-%m-%d %H:%M:%S')"

ssh "$SERVER" "$@"

done
