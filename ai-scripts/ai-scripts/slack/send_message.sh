#!/usr/bin/env bash

set -e

if [ "$#" -lt 1 ]; then
  echo "Usage: $0 <MESSAGE> [CHANNEL_ID]"
  echo "Example: $0 'Hello, Slack!'"
  exit 1
fi

MESSAGE="$1"
CHANNEL_ID="${2:-C07US58UC1Z}"

SLACK_TOKEN=${SLACK_MCP_TOKEN}

if [ -z "$SLACK_TOKEN" ]; then
  echo "Error: SLACK_MCP_TOKEN environment variable not set"
  exit 1
fi

RESPONSE=$(curl -s -X POST https://slack.com/api/chat.postMessage \
  -H "Authorization: Bearer ${SLACK_TOKEN}" \
  -H "Content-Type: application/json" \
  -d "{
        \"channel\": \"${CHANNEL_ID}\",
        \"text\": \"${MESSAGE}\",
        \"mrkdwn\": true,
        \"unfurl_links\": false,
        \"unfurl_media\": false
      }")

echo "$RESPONSE" | jq '{ok, channel, ts}'

if echo "$RESPONSE" | jq -e '.ok == true' > /dev/null; then
  exit 0
else
  exit 1
fi

