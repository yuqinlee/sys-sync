#!/bin/bash
set -euo pipefail

# cancel public config stow
stow \
    --delete \
    --target "$HOME" . \
    --ignore multi \
    --ignore etc \
    --ignore stow-on.sh \
    --ignore stow-off.sh \
    --ignore README.md

HOST="$(uname -n)"
STOW_DIR="./multi"

if [[ -d "$STOW_DIR/$HOST" ]]; then
    stow \
        --dir "$STOW_DIR" \
        --target "$HOME" \
        --delete "$HOST"
fi
