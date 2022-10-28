#!/usr/bin/env bash
set -o errexit -o pipefail

export PATH="$PATH:/root/.cargo/bin"

rustup default nightly
rustTarget=$(rustc -vV | sed -n 's|host: ||p')
CARGO_INSTALL_ROOT=/build RUSTFLAGS='-C target-feature=+crt-static -C target-cpu=native -C opt-level=s -C debuginfo=0 -C codegen-units=1' CARGO_NET_GIT_FETCH_WITH_CLI=true cargo install --target "$rustTarget" sd
