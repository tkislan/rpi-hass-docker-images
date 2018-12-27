#!/bin/sh -ex

tmpdir="$(mktemp -d)"
bucket="test-hass-backup"
secret_files="ip_bans.yaml secrets.yaml known_devices.yaml"
inner_dirs="first first/second first/second/third"

for d in $inner_dirs; do
  mkdir "${tmpdir}/${d}"
  for f in $secret_files; do
    touch "${tmpdir}/${d}/${f}"
  done
  touch "${tmpdir}/${d}/some_config.yaml"
done

backup_filepath="$(CONFIG_PATH="${tmpdir}" ./create_backup.sh)"

backup_file_count="$(tar -tvf "${backup_filepath}" | wc -l)"

if [ ! "${backup_file_count}" = "7" ]; then # 1 root dir, 3 inner dirs, 3 config files
  echo "Invalid file in archive" >&2
fi

rm -r "${tmpdir}"
