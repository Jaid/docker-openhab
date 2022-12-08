#!/usr/bin/env bash
set -o errexit -o pipefail -o xtrace

influxPort=${influxPort:-28086}
influxUrl=http://127.0.0.1:$influxPort
influxPassword=${influxPassword:-___habopen___}
export INFLUXD_HTTP_BIND_ADDRESS=:$influxPort
export INFLUX_HOST=$influxUrl

if [[ ! -f $OPENHAB_CONF/services/influxdb.cfg ]]; then
  cp --verbose --recursive --update /template/conf/* "$OPENHAB_CONF"
fi

/bin/sd --string-mode '$influxPassword' "$influxPassword" "$OPENHAB_CONF/services/influxdb.cfg"
/bin/sd --string-mode '$influxUrl' "$influxUrl" "$OPENHAB_CONF/services/influxdb.cfg"

appUser=$(id --user --name "$USER_ID")

mkdir --parents "$INFLUXD_CONFIG_PATH"
mkdir --parents "$INFLUXD_ASSETS_PATH"
mkdir --parents "$INFLUXD_ENGINE_PATH"
chown "$USER_ID:$GROUP_ID" --recursive "$influxdbHome"

su "$appUser" -c influxd &
/wait-for-it --timeout=180 "127.0.0.1:$influxPort"
sleep 1

if [[ ! -f $influxdbLocalConfig ]]; then
  printf 'Influx user not existing, creating now\n'
  su "$appUser" -c "influx setup --force --org openhab --bucket default --username openhab --password '$influxPassword'"
fi
