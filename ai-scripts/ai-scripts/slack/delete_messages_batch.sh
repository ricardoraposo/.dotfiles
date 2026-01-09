#!/usr/bin/env bash

set -e

if [ "$#" -lt 2 ]; then
  echo "Usage: $0 <CHANNEL_ID> <TIMESTAMP1> [TIMESTAMP2] ... [TIMESTAMPN]"
  echo "Example: $0 C07US58UC1Z 1763585515.001319 1763585516.001320"
  exit 1
fi

CHANNEL_ID="$1"
shift
TIMESTAMPS=("$@")

SLACK_TOKEN=${SLACK_MCP_TOKEN}

if [ -z "$SLACK_TOKEN" ]; then
  echo "Error: SLACK_MCP_TOKEN environment variable not set"
  exit 1
fi

RESULTS=()

for TS in "${TIMESTAMPS[@]}"; do
  RESPONSE=$(curl -s -X POST https://slack.com/api/chat.delete \
    -H "Authorization: Bearer ${SLACK_TOKEN}" \
    -H "Content-Type: application/json" \
    -d "{
          \"channel\": \"${CHANNEL_ID}\",
          \"ts\": \"${TS}\"
        }")
  
  RESULT=$(echo "$RESPONSE" | jq '{ok, channel, ts}')
  RESULTS+=("$RESULT")
done

echo "${RESULTS[@]}" | jq -s '.'

