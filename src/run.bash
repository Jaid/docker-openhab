#!/usr/bin/env bash
set -o errexit
set -o pipefail

if [[ ! -f conf/services/runtime.cfg ]]; then
  mkdir --parents conf/automation/jsr223
  mkdir conf/icons
  mkdir conf/items
  mkdir conf/persistence
  mkdir conf/rules
  mkdir conf/scripts
  mkdir conf/sitemaps
  mkdir conf/sounds
  mkdir conf/things
  cp --verbose --recursive --update /template/conf/* conf
fi

influxd &>/dev/null &
bash /wait-for-it 127.0.0.1:8086
influx setup --force --org openhab --bucket main --username openhab --password habopen_________

if [[ $DEBUG_OPENHAB = true ]]; then
  /entrypoint "$@" debug
else
  /entrypoint "$@"
fi
