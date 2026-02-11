#!/usr/bin/env bash

set -e

if [ "$#" -lt 1 ]; then
  echo "Usage: $0 '<SQL_QUERY>'"
  echo "Example: $0 'SELECT * FROM users LIMIT 10'"
  exit 1
fi

SQL_QUERY="$1"

UPPER_QUERY=$(echo "$SQL_QUERY" | tr '[:lower:]' '[:upper:]')

if echo "$UPPER_QUERY" | grep -qE '^\s*(INSERT|UPDATE|DELETE|DROP|ALTER|CREATE|TRUNCATE|REPLACE|MERGE|CALL|EXEC|EXECUTE|LOAD)\s'; then
  echo "Error: Mutation queries are not allowed. Use the standard query.sh script for INSERT, UPDATE, DELETE, etc."
  echo "Detected mutation attempt in query: ${SQL_QUERY:0:50}..."
  exit 1
fi

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

OUTPUT=$(mysql -h "$MYSQL_HOST" \
  -P "$MYSQL_PORT" \
  -u "$MYSQL_USER" \
  -p"$MYSQL_PASSWORD" \
  -D "$MYSQL_DATABASE" \
  --batch \
  --raw \
  -e "$SQL_QUERY" 2>&1)

if [ $? -ne 0 ]; then
  echo "$OUTPUT"
  exit 1
fi

if [ -z "$OUTPUT" ]; then
  echo "[]"
  exit 0
fi

headers=$(echo "$OUTPUT" | head -n 1)
body=$(echo "$OUTPUT" | tail -n +2)

if [ -z "$body" ]; then
  echo "[]"
  exit 0
fi

header_array=()
IFS=$'\t' read -ra header_array <<< "$headers"

echo "$body" | jq -R --argjson headers "$(printf '%s\n' "${header_array[@]}" | jq -R . | jq -s .)" '
  split("\t") as $values |
  [range($headers | length) as $i | {($headers[$i]): $values[$i]}] |
  add
' | jq -s '.'
