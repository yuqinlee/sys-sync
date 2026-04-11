# import prev of current dir
SCRIPT_DIR=$(
    cd "$(dirname "$0")" || exit 1
    pwd
)
. "$SCRIPT_DIR"/prev/base-env.sh
