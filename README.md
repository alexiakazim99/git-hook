# Git History Guardrail (Claude Code Hook)

A Claude Code `PreToolUse` hook that blocks git commands which rewrite
history, so a human stays in the loop before anything destructive runs.

## What it blocks

- `git push --force`
- `git reset --hard`
- `git rebase`

## How it works

- `.claude/settings.json` registers a `PreToolUse` hook on `Bash` tool calls.
- `.claude/hooks/block-git.sh` inspects the command. If it matches a
  history-rewriting pattern, it exits with code `2` to block the call;
  otherwise it exits `0` and the command runs.

## Files

- `.claude/settings.json` — hook registration
- `.claude/hooks/block-git.sh` — the block logic

## Requirements

- `jq` (used to read the tool input)
