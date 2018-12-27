#!/bin/sh -ex

filename="$(date +"%m%d%Y-%H%M").tar.gz"
filepath="/tmp/${filename}"

CONFIG_PATH=${CONFIG_PATH:-/config}

tar \
  -czvf "${filepath}" \
  --exclude ip_bans.yaml \
  --exclude secrets.yaml \
  --exclude known_devices.yaml \
  "${CONFIG_PATH}" > /dev/null

echo -n "${filepath}"
