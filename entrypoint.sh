#!/bin/bash
set -e

if [ "$1" = 'rsync_server' ]; then
    exec /usr/bin/rsync --no-detach --daemon --config /etc/rsyncd.conf "$@"
fi

exec "$@"
