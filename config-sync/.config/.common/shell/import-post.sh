# import post of current dir
SCRIPT_DIR=$(
    cd "$(dirname "$0")" || exit 1
    pwd
)
. "$SCRIPT_DIR"/post/alias.sh
. "$SCRIPT_DIR"/post/env.sh
. "$SCRIPT_DIR"/post/func.sh
