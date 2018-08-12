#!/bin/bash

LOCK_FILE=/tmp/lockfile

if [[ -f $LOCK_FILE ]]; then
  echo "lock-file already exists!"
  exit 1
fi

# Выполнить полезную нагрузку
trap "rm -f $LOCK_FILE" INT TERM EXIT
touch $LOCK_FILE
sleep 1000

# Корректно завершиться
trap - INT TERM EXIT
rm -f $LOCK_FILE
exit 0
