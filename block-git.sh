#!/bin/bash
COMMAND=$(jq -r '.tool_input.command')

if echo "$COMMAND" | grep -qE 'push .*--force|reset --hard|rebase'; then
  echo "Blockerat: kommandot skriver om git-historiken." >&2
  exit 2
fi

exit 0