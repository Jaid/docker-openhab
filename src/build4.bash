#!/usr/bin/env bash
set -o errexit -o pipefail

DEBIAN_FRONTEND=noninteractive apt-get --option Acquire::Retries=60 --option Acquire::http::Timeout=180 --yes install git
