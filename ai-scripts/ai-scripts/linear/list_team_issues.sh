#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage: $0 <TEAM_ID>"
  echo "Example: $0 9cfb482a-81e3-4154-b5b9-2c805e70a02d"
  exit 1
fi

TEAM_ID="$1"

if [ -z "$LINEAR_API_KEY" ]; then
  echo "Error: LINEAR_API_KEY environment variable is not set"
  exit 1
fi

QUERY=$(cat <<EOF
{
  "query": "query Team { team(id: \"$TEAM_ID\") { id name issues { nodes { id title description assignee { id name } createdAt archivedAt } } } }"
}
EOF
)

curl -X POST \
  -H "Content-Type: application/json" \
  -H "Authorization: $LINEAR_API_KEY" \
  --data "$QUERY" \
  https://api.linear.app/graphql


