#!/bin/bash

if [ -z "$LINEAR_API_KEY" ]; then
  echo "Error: LINEAR_API_KEY environment variable is not set"
  exit 1
fi

QUERY=$(cat <<EOF
{
  "query": "{ __schema { types { name kind description fields { name description type { name kind ofType { name kind } } } } } }"
}
EOF
)

curl -X POST \
  -H "Content-Type: application/json" \
  -H "Authorization: $LINEAR_API_KEY" \
  --data "$QUERY" \
  https://api.linear.app/graphql

