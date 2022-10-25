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

influxUp=false
set +o errexit
bash /wait-for-it 127.0.0.1:8086 --timeout=2 --strict -- export influxUp=true
set -o errexit
if ! $influxUp; then
  influxd --engine-path "$INFLUXD_CONFIG_PATH" &>/dev/null &
  bash /wait-for-it --timeout=180 127.0.0.1:8086
fi
sleep 10
if [[ ! -f $INFLUXD_CONFIG_PATH/config ]]; then
  influx setup --force --org openhab --bucket default --username openhab --password habopen_________
fi
exit 0
if [[ $DEBUG_OPENHAB = true ]]; then
  /entrypoint "$@" debug
else
  /entrypoint "$@"
fi
