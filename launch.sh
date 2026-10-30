#!/bin/bash
# Launcher for the Playwright MCP.
#  - strips --headless so the browser is always visible
DIR="/Users/okami/MCP/playwright"
CLI="$DIR/node_modules/@playwright/mcp/cli.js"

kept=()
for a in "$@"; do
  if [ "$a" = "--headless" ]; then
    echo "[playwright-mcp] ignored --headless (always headed)" >&2
    continue
  fi
  kept+=("$a")
done

exec /Users/okami/.local/node/bin/node "$CLI" "${kept[@]}"
