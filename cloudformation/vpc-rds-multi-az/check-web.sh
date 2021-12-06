#!/bin/bash
URL=$1
if [[ -z "$URL" ]]; then
  echo "missing url."
  exit 99
fi

while true; do
  #echo -n "$(date '+%Y/%m/%d %H:%M:%S'): "
  HTTP_CODE=$(curl -L -s -o /dev/null -w "%{http_code}" ${URL})
  if [[ "${HTTP_CODE}" = "200" ]]; then
    HTTP_CODE="\e[92m${HTTP_CODE}\e[0m"
  else
    HTTP_CODE="\e[91m${HTTP_CODE}\e[0m"
  fi
  echo -e "$(date '+%Y/%m/%d %H:%M:%S'): ${HTTP_CODE}"
  sleep 1s
done
