#!/usr/bin/env bash

set -e

if [ "$#" -lt 3 ]; then
  echo "Usage: $0 <PR_LINK> <TASK_LINK> <TASK_NAME> [CHANNEL_ID]"
  echo "Example: $0 https://github.com/org/repo/pull/123 https://linear.app/task/EXP-123 'EXP-123: Task Title'"
  exit 1
fi

PR_LINK="$1"
TASK_LINK="$2"
TASK_NAME="$3"
CHANNEL_ID="${4:-C07US58UC1Z}"

SLACK_TOKEN=${SLACK_MCP_TOKEN}

if [ -z "$SLACK_TOKEN" ]; then
  echo "Error: SLACK_MCP_TOKEN environment variable not set"
  exit 1
fi

MESSAGE="👉 <${PR_LINK}|PR> para <${TASK_LINK}|${TASK_NAME}>"

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
