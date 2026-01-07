#!/usr/bin/env bash

set -e

if [ "$#" -lt 2 ]; then
  echo "Usage: $0 <CHANNEL_ID> <MESSAGE_TIMESTAMP> [SLACK_TOKEN]"
  echo "Example: $0 C07US58UC1Z 1763585515.001319"
  echo "Note: Message timestamp can be found in Slack message details"
  exit 1
fi

CHANNEL_ID="$1"
MESSAGE_TS="$2"
SLACK_TOKEN="${3:-${SLACK_MCP_TOKEN}}"

if [ -z "$SLACK_TOKEN" ]; then
  echo "Error: SLACK_MCP_TOKEN environment variable not set and no token provided"
  exit 1
fi

RESPONSE=$(curl -s -X POST https://slack.com/api/chat.delete \
  -H "Authorization: Bearer ${SLACK_TOKEN}" \
  -H "Content-Type: application/json" \
  -d "{
        \"channel\": \"${CHANNEL_ID}\",
        \"ts\": \"${MESSAGE_TS}\"
      }")

echo "$RESPONSE" | jq

if echo "$RESPONSE" | jq -e '.ok == true' > /dev/null; then
  echo "✅ Message deleted from Slack!"
  exit 0
else
  echo "❌ Failed to delete message"
  exit 1
fi

