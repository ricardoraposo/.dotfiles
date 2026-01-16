#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage: $0 <TASK_ID>"
  echo "Example: $0 BLA-123"
  exit 1
fi

TASK_ID="$1"

if [ -z "$LINEAR_API_KEY" ]; then
  echo "Error: LINEAR_API_KEY environment variable is not set"
  exit 1
fi

QUERY=$(cat <<EOF
{
  "query": "query Issue { issue(id: \"$TASK_ID\") { id title description branchName url state { id name } } }"
}
EOF
)

RESPONSE=$(curl -s -X POST \
  -H "Content-Type: application/json" \
  -H "Authorization: $LINEAR_API_KEY" \
  --data "$QUERY" \
  https://api.linear.app/graphql)

echo "$RESPONSE" | jq '.data.issue'
