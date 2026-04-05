#! /bin/bash
mkdir -p "/data/data-local/keepass"
rclone mount --allow-non-empty nutcloud:/keepass/ /data/data-local/share/keepass/db/ \
    --vfs-cache-mode full \
    --vfs-cache-max-size 1G \
    --vfs-cache-max-age 24h \
    --dir-cache-time 12h \
    --poll-interval 10m \
    --timeout 1m \
    --contimeout 10s \
    --retries 10 \
    --low-level-retries 20 \
    --log-file /var/log/rclone.log \
    --log-level INFO \
    --umask 022

