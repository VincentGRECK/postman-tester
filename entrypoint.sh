#!/bin/sh
set -e

# We check if we have a postman collection file as parameter
if [ -z "$1" ]; then
  echo "No PostMan Test file"
  echo "Usage: docker run --rm -v $(pwd)/collections:/collections postman-tester my_collection.json"
  exit 1
fi

COLLECTION_FILE="/collections/$1"

# Vérifie que le fichier existe
if [ ! -f "$COLLECTION_FILE" ]; then
  echo " The file could not be found : $COLLECTION_FILE"
  exit 1
fi

# We check if we have any env file
if [ -n "$2" ]; then
  ENV_FILE="/collections/$2"
  echo " Env file found : $ENV_FILE"
  newman run "$COLLECTION_FILE" -e "$ENV_FILE" --reporters cli,junit --reporter-junit-export /app/results/results.xml

else
  echo "Env file not found "
  exit 1
fi
