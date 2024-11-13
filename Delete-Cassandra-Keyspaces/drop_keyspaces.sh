#!/bin/bash

# Initialize variables
USERNAME=""
PASSWORD=""
PREFIX=""
DELETE_FLAG=false

# Parse command-line options
while [[ "$#" -gt 0 ]]; do
    case "$1" in
        -u|--username)
            USERNAME="$2"
            shift 2
            ;;
        -p|--password)
            PASSWORD="$2"
            shift 2
            ;;
        -prefix|--keyspace-prefix)
            PREFIX="$2"
            shift 2
            ;;
        -d|--delete)
            DELETE_FLAG=true
            shift
            ;;
        *)
            echo "Unknown option: $1"
            echo "Usage: $0 -u <username> -p <password> -prefix <keyspace_prefix> [-d|--delete]"
            exit 1
            ;;
    esac
done

# Check if all required arguments are provided
if [[ -z "$USERNAME" || -z "$PASSWORD" || -z "$PREFIX" ]]; then
    echo "Usage: $0 -u <username> -p <password> -prefix <keyspace_prefix> [-d|--delete]"
    exit 1
fi

# Variable to count the number of keyspaces to delete
count=0

# Loop through all keyspaces that start with the given prefix
for keyspace in $(echo "DESCRIBE KEYSPACES;" | cqlsh -u "$USERNAME" -p "$PASSWORD" | tr -s ' ' '\n' | grep "^${PREFIX}"); do
    # If delete flag is set, delete the keyspace, otherwise just print and count it
    if $DELETE_FLAG; then
        echo "DROP KEYSPACE ${keyspace};" | cqlsh -u "$USERNAME" -p "$PASSWORD"
        echo "Keyspace ${keyspace} has been deleted."
    else
        echo "Keyspace ${keyspace} would be deleted."
        ((count++))  # Increment the counter for each keyspace found
    fi
done

# If the delete flag was not set, print the number of keyspaces found
if ! $DELETE_FLAG; then
    echo "Total keyspaces that would be deleted: $count"
fi
