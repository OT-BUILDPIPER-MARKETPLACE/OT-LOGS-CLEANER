#!/bin/bash

# Define the target directories

log_directories=("/var/log/buildpiper" "/var/log/buildpipier")

# Specify the date before which log files should be deleted
delete_before_date="$1"

delete_before_timestamp=$(date -d "$delete_before_date" +%Y%m%d)

# Delete old log files in the given directory

for directory in "${log_directories[@]}"; do

    find "$directory" -type f -name "*.log*" ! -newermt "$delete_before_date" -exec rm -f {} \;
    
done

echo "Log files older than $delete_before_date deleted successfully."
