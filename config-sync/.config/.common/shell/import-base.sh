# import base of current dir
SCRIPT_DIR=$(
    cd "$(dirname "$0")" || exit 1
    pwd
)
. "$SCRIPT_DIR"/base/alias.sh
. "$SCRIPT_DIR"/base/env.sh
. "$SCRIPT_DIR"/base/func.sh
