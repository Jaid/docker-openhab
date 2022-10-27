#!/usr/bin/env bash
set -o errexit
set -o pipefail

# influxdb.key GPG Fingerprint: 05CE15085FC09D18E99EFB22684A14CF2582E0C5
# curl --location --fail --retry 3 https://repos.influxdata.com/influxdb.key >influxdb.key
printf '-----BEGIN PGP PUBLIC KEY BLOCK-----
Version: GnuPG v1
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
vqIHrEqk446nGPDqJPS5
=9iF7
-----END PGP PUBLIC KEY BLOCK-----' >influxdb.key
gpg --no-default-keyring --keyring influxdbTemp.gpg --import influxdb.key
gpg --no-default-keyring --keyring influxdbTemp.gpg --export --output influxdb.gpg
mv influxdb.gpg /etc/apt/keyrings/influxdb.gpg
printf 'deb [signed-by=/etc/apt/keyrings/influxdb.gpg] https://repos.influxdata.com/ubuntu stable main' | tee /etc/apt/sources.list.d/influxdb.list

DEBIAN_FRONTEND=noninteractive apt-get --option Acquire::Retries=60 --option Acquire::http::Timeout=180 --yes update
DEBIAN_FRONTEND=noninteractive apt-get --option Acquire::Retries=60 --option Acquire::http::Timeout=180 --yes install influxdb2
