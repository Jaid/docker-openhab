#!/usr/bin/env bash
set -o errexit
set -o pipefail

if [[ ! -f conf/services/runtime.cfg ]]; then
  mkdir --parents conf/services
  cp --verbose /template/conf/services/runtime.cfg conf/services/runtime.cfg
fi

influxd
/entrypoint gosu openhab tini -s ./start.sh
