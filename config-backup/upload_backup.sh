#!/bin/sh -ex

if [ "$#" -ne 2 ] || ! [ -f "$1" ]; then
  echo "Usage: $0 file" >&2
  exit 1
fi

if [[ -z "$MC_HOSTS_hass" ]]; then
  echo "Missing environment variable: MC_HOSTS_hass" >&2
  exit 1
fi

mc cp "$1" "hass/$2"
