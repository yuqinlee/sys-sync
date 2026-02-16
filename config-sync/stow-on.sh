#!/bin/bash
set -euo pipefail

# public config stow
stow \
    --target ~ . \
    --adopt \
    --ignore multi \
    --ignore etc \
    --ignore stow-on.sh \
    --ignore stow-off.sh \
    --ignore README.md \

# multi device config stow
HOST="$(uname -n)"
STOW_DIR="./multi"

if [[ -d "$STOW_DIR/$HOST" ]]; then
     stow --dir "$STOW_DIR" --target "$HOME" "$HOST" --adopt
fi
