#!/bin/sh
set -e

if [ "${1:0:1}" = "-" ]; then
  set -- /sbin/tini -- php /vendor/bin/phpvisualdebt "$@"
elif [ "$1" = "/vendor/bin/phpvisualdebt" ]; then
  set -- /sbin/tini -- php "$@"
elif [ "$1" = "phpvisualdebt" ]; then
  set -- /sbin/tini -- php /vendor/bin/"$@"
elif [ -d "$1" ]; then
  set -- /sbin/tini -- php /vendor/bin/phpvisualdebt "$@"
fi

exec "$@"
