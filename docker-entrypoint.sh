#!/bin/sh
set -e

isCommand() {
  for cmd in \
    "analyse" \
    "help" \
    "list"
  do
    if [ -z "${cmd#"$1"}" ]; then
      return 0
    fi
  done

  return 1
}

if [ "${1:0:1}" = "-" ]; then
  set -- /sbin/tini -- php /vendor/bin/phpvisualdebt "$@"
elif [ "$1" = "/vendor/bin/phpvisualdebt" ]; then
  set -- /sbin/tini -- php "$@"
elif [ "$1" = "phpvisualdebt" ]; then
  set -- /sbin/tini -- php /vendor/bin/"$@"
elif isCommand "$1"; then
  set -- /sbin/tini -- php /vendor/bin/phpvisualdebt "$@"
fi

exec "$@"
