#!/usr/bin/env bash

set -e

if [ "$#" -lt 2 ]; then
  echo "Usage: $0 <PR_LINK> <TASK_TITLE> [CHANNEL_ID]"
  echo "Example: $0 https://github.com/org/repo/pull/123 'EXP-123: Task Title'"
  echo "Note: Use this when there's no Linear task link"
  exit 1
fi

PR_LINK="$1"
TASK_TITLE="$2"
CHANNEL_ID="${3:-C07US58UC1Z}"

SLACK_TOKEN=${SLACK_MCP_TOKEN}

if [ -z "$SLACK_TOKEN" ]; then
  echo "Error: SLACK_MCP_TOKEN environment variable not set"
  exit 1
fi

MESSAGE="👉 <${PR_LINK}|PR> para ${TASK_TITLE}"

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

echo "$RESPONSE" | jq

if echo "$RESPONSE" | jq -e '.ok == true' > /dev/null; then
  echo "✅ Message sent to Slack!"
  exit 0
else
  echo "❌ Failed to send message"
  exit 1
fi

