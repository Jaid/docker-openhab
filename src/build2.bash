#!/usr/bin/env bash
set -o errexit
set -o pipefail

curl --location --retry 3 --fail --silent --show-error --header 'Cache-Control: no-cache' https://raw.githubusercontent.com/vishnubob/wait-for-it/81b1373f17855a4dc21156cfe1694c31d7d1792e/wait-for-it.sh --output wait-for-it.bash
chmod ugo+rx wait-for-it.bash
