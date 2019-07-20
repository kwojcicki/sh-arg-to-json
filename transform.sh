#!/usr/bin/env bash

set -e

# check if essential commands are in our PATH
for cmd in jq; do
  if ! command -v $cmd &> /dev/null; then
    echo >&2 "error: \"$cmd\" not found!"
    exit 1
  fi
done

usage() {
	echo "usage: $0 --f param1 --test param2 --file /etc/hostname ..."
	[ -z "$1" ] || exit "$1"
}

json='{}'

if (("$#" % 2)); then
    usage 1
fi

while (( "$#" >= 2 )); do
  if [[ -f "$2" ]]; then
    file=$(cat "$2" | jq -asR . )
    json=$(echo "${json}" | jq '. += {"'"${1}"'":'"$file"'}')
  else
    json=$(echo "${json}" | jq '. += {"'${1}'":"'${2}'"}')
  fi
  shift 2
done

echo ${json}
