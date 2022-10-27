#!/usr/bin/env bash
set -o errexit -o pipefail

rustTarget=$(/root/.cargo/bin/rustc -vV | sed -n 's|host: ||p')
CARGO_INSTALL_ROOT=/build RUSTFLAGS='-C target-feature=+crt-static -C opt-level=z -C debuginfo=0 -C codegen-units=1' /root/.cargo/bin/cargo install --target "$rustTarget" sd
