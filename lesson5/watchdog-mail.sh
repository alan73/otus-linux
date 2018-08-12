#!/bin/bash

SERVICE_NAME=my-service.sh

function send_mail() {
  echo "my-service stopped!" | mail -s "my-service stopped!" s_savelov@mail.ru
}

while true; do
  # Перезапустить сервис при необходимости
  if [[ ! $(ps cax | grep $SERVICE_NAME) ]]; then
    echo "service is not running"
    my-service.sh & &> /dev/null
    echo "sending mail..."
  fi

  sleep 1
done
