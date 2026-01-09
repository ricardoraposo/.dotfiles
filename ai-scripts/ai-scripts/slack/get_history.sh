#!/usr/bin/env bash

set -e

if [ "$#" -lt 1 ]; then
  echo "Usage: $0 <CHANNEL_ID> [LIMIT] [SLACK_TOKEN]"
  echo "Example: $0 C07US58UC1Z 50"
  echo "Default limit: 50"
  exit 1
fi

CHANNEL_ID="$1"
LIMIT="${2:-50}"
SLACK_TOKEN="${3:-${SLACK_MCP_TOKEN}}"

if [ -z "$SLACK_TOKEN" ]; then
  echo "Error: SLACK_MCP_TOKEN environment variable not set and no token provided"
  exit 1
fi

RESPONSE=$(curl -s -X GET "https://slack.com/api/conversations.history?channel=${CHANNEL_ID}&limit=${LIMIT}" \
  -H "Authorization: Bearer ${SLACK_TOKEN}" \
  -H "Content-Type: application/x-www-form-urlencoded")

echo "$RESPONSE" | jq '{ok, messages: [.messages[] | {user, ts, text}]}'

if echo "$RESPONSE" | jq -e '.ok == true' > /dev/null; then
  MESSAGE_COUNT=$(echo "$RESPONSE" | jq '.messages | length')
  echo "✅ Retrieved ${MESSAGE_COUNT} messages from channel!"
  exit 0
else
  echo "❌ Failed to retrieve conversation history"
  exit 1
fi


