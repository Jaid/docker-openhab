#!/usr/bin/env bash
set -o errexit -o pipefail

export influxdbHome=/influxdb
export INFLUXD_CONFIG_PATH=$influxdbHome/config
export INFLUXD_ASSETS_PATH=$influxdbHome/assets
export INFLUXD_BOLT_PATH=$influxdbHome/influx.bolt
export INFLUXD_SQLITE_PATH=$influxdbHome/influx.sqlite
appUser=$(id --user --name 1000)

mkdir --parents $INFLUXD_CONFIG_PATH
mkdir --parents $INFLUXD_ASSETS_PATH
chown "$userId:$groupId" --recursive $influxdbHome
