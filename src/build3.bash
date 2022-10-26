#!/usr/bin/env bash
set -o errexit
set -o pipefail

curl https://sh.rustup.rs -sSf | sh -s -- -y --no-modify-path
