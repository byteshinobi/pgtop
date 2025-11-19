#!/bin/zsh
DB=$1

if [ -z "$DB" ]; then
  echo "Error: Database name required"
  echo "Usage: $0 <db-name>"
  exit 1
fi

CONFIG_FILE="pgtoprc-${DB}"
if [ ! -f "$CONFIG_FILE" ]; then
    echo
    echo "Error: Configuration file '${CONFIG_FILE}' not found"
    echo "Please create ${CONFIG_FILE} before building the Docker image"
    echo
    exit 1
fi

docker build --build-arg DB=${DB} -t pgtop-${DB} .
