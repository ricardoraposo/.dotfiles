#!/bin/bash

if [ -z "$LINEAR_API_KEY" ]; then
  echo "Error: LINEAR_API_KEY environment variable is not set"
  exit 1
fi

QUERY=$(cat <<EOF
{
  "query": "query Teams { teams { nodes { id name } } }"
}
EOF
)

curl -X POST \
  -H "Content-Type: application/json" \
  -H "Authorization: $LINEAR_API_KEY" \
  --data "$QUERY" \
  https://api.linear.app/graphql





