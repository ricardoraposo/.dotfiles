#!/bin/bash

if [ -z "$1" ] || [ -z "$2" ]; then
  echo "Usage: $0 <ISSUE_ID> <STATE_ID>"
  echo "Example: $0 BLA-123 NEW-STATE-ID"
  exit 1
fi

ISSUE_ID="$1"
STATE_ID="$2"

if [ -z "$LINEAR_API_KEY" ]; then
  echo "Error: LINEAR_API_KEY environment variable is not set"
  exit 1
fi

QUERY=$(cat <<EOF
{
  "query": "mutation IssueUpdate { issueUpdate(id: \"$ISSUE_ID\", input: { stateId: \"$STATE_ID\" }) { success issue { id title state { id name } } } }"
}
EOF
)

curl -X POST \
  -H "Content-Type: application/json" \
  -H "Authorization: $LINEAR_API_KEY" \
  --data "$QUERY" \
  https://api.linear.app/graphql


