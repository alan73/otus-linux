#!/bin/bash

SERVICE_NAME=my-service.sh

while true; do
  # Перезапустить сервис при необходимости
  if [[ ! $(ps cax | grep $SERVICE_NAME) ]]; then
    echo "service is not running"
    my-service.sh & &> /dev/null
    echo "service restarted"
  else
    echo "service is running"
  fi

  sleep 1
done
