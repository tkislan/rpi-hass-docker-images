#!/bin/sh -ex

backup_filepath="$(CONFIG_PATH="${tmpdir}" ./create_backup.sh)"

if ! /upload_backup.sh "${backup_filepath}"; then
  echo "Backup upload failed" >&2
fi

rm -v "${backup_filepath}" "hass-backup"
