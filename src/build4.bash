#!/usr/bin/env bash
set -o errexit -o pipefail

export influxdbHome=/influxdb
export INFLUXD_CONFIG_PATH=$influxdbHome/config
export INFLUXD_ASSETS_PATH=$influxdbHome/assets
export INFLUXD_BOLT_PATH=$influxdbHome/influx.bolt
export INFLUXD_SQLITE_PATH=$influxdbHome/influx.sqlite
appUser=$(id --user --name 1000)

su "$appUser" -c influxd &
influxdPid=$!
./wait-for-it.bash --timeout=180 127.0.0.1:8086
sleep 2

su "$appUser" -c 'influx setup --force --org openhab --bucket default --username openhab --password "${openhabInfluxPassword:-___habopen___}"'
