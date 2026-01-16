# AI Scripts Repository

This repository contains Bash shell scripts for interacting with Linear and Slack APIs.

## Project Structure

```
ai-scripts/
├── command/          # Composite scripts combining multiple APIs
│   └── notify_linear_pr.sh
├── linear/           # Linear API integration scripts
│   ├── get_task.sh
│   ├── list_team_issues.sh
│   ├── list_teams.sh
│   ├── list_states.sh
│   ├── introspect_schema.sh
│   └── update_issue_state.sh
└── slack/            # Slack API integration scripts
    ├── send_message.sh
    ├── send_pr_simple.sh
    ├── send_pr_link.sh
    ├── get_history.sh
    ├── delete_message.sh
    └── delete_messages_batch.sh
```

### Folder Purposes

- **command/**: Contains composite scripts that combine functionality from multiple API integrations. These scripts orchestrate workflows across Linear and Slack (e.g., fetching task details from Linear and posting to Slack).
- **linear/**: Scripts for interacting with the Linear API using GraphQL queries.
- **slack/**: Scripts for interacting with the Slack API using REST endpoints.

## Shell Script Guidelines

### Shebang
- Use `#!/usr/bin/env bash` for maximum portability
- Only use `#!/bin/bash` when POSIX compliance is not required and bash-specific features are needed

### Error Handling
- Use `set -e` at the top of scripts to fail fast on errors
- Always check required environment variables before making API calls:
  ```bash
  if [ -z "$LINEAR_API_KEY" ]; then
    echo "Error: LINEAR_API_KEY environment variable is not set"
    exit 1
  fi
  ```
- Validate all required arguments:
  ```bash
  if [ "$#" -lt 2 ]; then
    echo "Usage: $0 <ARG1> <ARG2>"
    exit 1
  fi
  ```
- Use descriptive error messages that explain what's missing

### Exit Codes
- Exit `0` on success
- Exit `1` on failure
- Use explicit exit statements rather than relying on `set -e`

### Variable Assignment
- Use quotes around variable assignments: `VARIABLE="value"`
- Use uppercase with underscores for constants: `API_ENDPOINT="https://api.example.com"`
- Use lowercase for local variables: `response=$(...)`
- Default values with parameter expansion: `${VARIABLE:-default}`
- Assign directly from command output: `RESPONSE=$(curl -s ...)`

### Parameter Handling
- Always validate argument count at script start
- Provide usage message with examples:
  ```bash
  echo "Usage: $0 <REQUIRED> [OPTIONAL]"
  echo "Example: $0 arg1 arg2"
  ```
- Document required environment variables
- Use descriptive variable names (e.g., `CHANNEL_ID`, `MESSAGE_TS`)

### API Calls (cURL)
- Use `-s` flag for silent mode (no progress meter)
- Always set Content-Type header: `-H "Content-Type: application/json"`
- Always include Authorization header with Bearer token
- Use heredoc for JSON data to maintain readability:
  ```bash
  curl -X POST \
    -H "Content-Type: application/json" \
    -H "Authorization: $TOKEN" \
    --data "$QUERY" \
    https://api.example.com/endpoint
  ```

### JSON Processing (jq)
- Always validate API responses before processing:
  ```bash
  if echo "$RESPONSE" | jq -e '.ok == true' > /dev/null; then
    # success handling
  else
    # error handling
  fi
  ```
- Output filtered results: `echo "$RESPONSE" | jq '{field1, field2}'`
- Use `-e` flag to make jq output exit non-zero on empty/false results

### Formatting
- Use 2 spaces for indentation
- Limit line length to 100 characters where practical
- Use backslash continuations with proper alignment:
  ```bash
  curl -X POST \
    -H "Header: value" \
    -H "Another: value"
  ```
- One command per line in control structures

### API-Specific Patterns

#### Linear Scripts
- Require `LINEAR_API_KEY` environment variable
- Use GraphQL queries with heredoc syntax
- Endpoint: `https://api.linear.app/graphql`
- Query format:
  ```bash
  QUERY=$(cat <<EOF
  {
    "query": "query Name { queryName { field1 field2 } }"
  }
  EOF
  )
  ```

#### Slack Scripts
- Require `SLACK_MCP_TOKEN` environment variable
- Use REST API endpoints
- Default channel: `C07US58UC1Z`
- Common patterns:
  - `chat.postMessage` for sending messages
  - `chat.delete` for removing messages
  - `conversations.history` for fetching messages
  - Always set `unfurl_links: false` and `unfurl_media: false`
  - Use mrkdwn format for rich text: `"mrkdwn": true`

### Security
- Never hardcode API tokens or credentials
- Use environment variables for all secrets
- Validate environment variables are set before making API calls
- Use minimal required permissions

### Best Practices
- Make scripts executable: `chmod +x script.sh`
- Include usage documentation in each script
- Provide example invocations in comments
- Use consistent variable naming across similar scripts
- Document any side effects or requirements
- Keep scripts focused on single responsibilities
