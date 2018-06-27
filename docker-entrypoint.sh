#!/usr/bin/env sh
set -e

if [ "$(printf %c "$1")" = '-' ]; then
  set -- /sbin/tini -- php /composer/vendor/bin/phpvisualdebt "$@"
elif [ "$1" = "/composer/vendor/bin/phpvisualdebt" ]; then
  set -- /sbin/tini -- php "$@"
elif [ "$1" = "phpvisualdebt" ]; then
  set -- /sbin/tini -- php /composer/vendor/bin/"$@"
elif [ -d "$1" ]; then
  set -- /sbin/tini -- php /composer/vendor/bin/phpvisualdebt "$@"
fi

exec "$@"
