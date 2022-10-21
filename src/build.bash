#!/usr/bin/env bash
set -o errexit
set -o pipefail

# influxdb.key GPG Fingerprint: 05CE15085FC09D18E99EFB22684A14CF2582E0C5
curl --location --fail --retry 3 https://repos.influxdata.com/influxdb.key >influxdb.key
gpg --no-default-keyring --keyring influxdbTemp.gpg --import influxdb.key
gpg --no-default-keyring --keyring influxdbTemp.gpg --export --output influxdb.gpg
mv influxdb.gpg /etc/apt/keyrings/influxdb.gpg
printf 'deb [signed-by=/etc/apt/keyrings/influxdb.gpg] https://repos.influxdata.com/ubuntu stable main' | tee /etc/apt/sources.list.d/influxdb.list

DEBIAN_FRONTEND=noninteractive apt-get --option Acquire::Retries=60 --option Acquire::http::Timeout=180 --yes update
DEBIAN_FRONTEND=noninteractive apt-get --option Acquire::Retries=60 --option Acquire::http::Timeout=180 --yes install influxdb2
