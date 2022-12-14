#!/usr/bin/env bash
set -o errexit
set -o pipefail

curl --location --retry 3 --fail --silent --show-error --header 'Cache-Control: no-cache' https://sh.rustup.rs | sh -s -- -y --no-modify-path --profile minimal
