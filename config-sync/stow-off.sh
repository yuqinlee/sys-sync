#!/usr/bin/env bash
set -euo pipefail

# cancel public config stow
stow \
    -D \
    --target ~ . \
    --ignore multi \
    --ignore etc \
    --ignore stow-on.sh \
    --ignore stow-off.sh

# cancel multi device config stow
HOST="$(uname -n)"
STOW_DIR="./multi"

if [[ -d "$STOW_DIR/$HOST" ]]; then
    stow --dir "$STOW_DIR" --target "$HOME" -D "$HOST"
fi
