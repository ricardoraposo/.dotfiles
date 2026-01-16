#!/usr/bin/env bash

set -e

if [ "$#" -lt 2 ]; then
  echo "Usage: $0 <TASK_ID> <PR_URL> [CHANNEL_ID]"
  echo "Example: $0 BLA-123 https://github.com/org/repo/pull/123"
  exit 1
fi

TASK_ID="$1"
PR_URL="$2"
CHANNEL_ID="${3:-C07US58UC1Z}"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

TASK_RESPONSE=$("$SCRIPT_DIR/linear/get_task.sh" "$TASK_ID")
TASK_TITLE=$(echo "$TASK_RESPONSE" | jq -r '.title // empty')
TASK_URL=$(echo "$TASK_RESPONSE" | jq -r '.url // empty')

if [ -z "$TASK_TITLE" ] || [ -z "$TASK_URL" ]; then
  echo "Error: Could not fetch task details"
  exit 1
fi

"$SCRIPT_DIR/slack/send_pr_link.sh" "$PR_URL" "$TASK_URL" "$TASK_TITLE" "$CHANNEL_ID"
