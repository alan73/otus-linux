#!/bin/bash

LOG_PATH=''
SHOW_STAT=''

main() {
  # Разобрать аргументы командной строки
  parse_arguments $@
  if [[ -z $LOG_PATH ]]; then
     show_help_message
     exit 1
  fi

  # Показать статистику по запросам от разных IP
  if [[ -n $SHOW_STAT ]]; then
    show_stat
  fi

  exit 0
}

parse_arguments() {
  while true; do
    case "$1" in
      # Путь до файла логов
      -t)
      LOG_PATH="$2"
      shift 2
      ;;
      # Показать статистику по запросам от разных IP
      --stat)
      SHOW_STAT='yes'
      shift
      ;;
      # Показать справку
      -h)
      show_help_message
      exit 0
      ;;
      # Больше нечего обрабатывать
      *)
      break
      ;;
    esac
  done
}

show_stat() {
  # Подсчитать число запросов от каждого IP
  awk -F'-' '{ array[$1]++ }; \
             END { for (ip in array) printf "%s %d\n", ip, array[ip] }' \
             "$LOG_PATH" | sort -n -r -k 2
}

show_help_message() {
    echo "usage: nginx-log-analyzer: -t <path-to-log>"
}

main $@
