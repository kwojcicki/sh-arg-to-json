#!/usr/bin/env bash

set -e

# check if essential commands are in our PATH
for cmd in jq; do
  if ! command -v $cmd &> /dev/null; then
    echo >&2 "error: \"$cmd\" not found!"
    exit 1
  fi
done

json='{}'

while (( "$#" >= 2 )); do
  if [[ -f "$2" ]]; then
    #echo "$2 exist"
    file=$(cat "$2" | jq -asR . )
    #echo "$file"
    json=$(echo "${json}" | jq '. += {"'"${1}"'":'"$file"'}')
  else
    #echo "coordinate: {lat: $1, lng: $2}"
    json=$(echo "${json}" | jq '. += {"'${1}'":"'${2}'"}')
  fi
  shift 2
done

#echo "Result"
echo ${json}
