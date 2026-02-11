#!/usr/bin/env bash

set -e

if [ "$#" -lt 1 ]; then
  echo "Usage: $0 '<SQL_QUERY>'"
  echo "Example: $0 'SELECT * FROM users LIMIT 10'"
  echo "Example: $0 'SELECT COUNT(*) FROM orders'"
  exit 1
fi

SQL_QUERY="$1"

if [ -z "$MYSQL_HOST" ]; then
  echo "Error: MYSQL_HOST environment variable not set"
  exit 1
fi

if [ -z "$MYSQL_DATABASE" ]; then
  echo "Error: MYSQL_DATABASE environment variable not set"
  exit 1
fi

if [ -z "$MYSQL_USER" ]; then
  echo "Error: MYSQL_USER environment variable not set"
  exit 1
fi

if [ -z "$MYSQL_PASSWORD" ]; then
  echo "Error: MYSQL_PASSWORD environment variable not set"
  exit 1
fi

MYSQL_PORT="${MYSQL_PORT:-3306}"

mysql -h "$MYSQL_HOST" \
  -P "$MYSQL_PORT" \
  -u "$MYSQL_USER" \
  -p"$MYSQL_PASSWORD" \
  -D "$MYSQL_DATABASE" \
  -e "$SQL_QUERY"
