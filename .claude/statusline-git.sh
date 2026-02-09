#!/bin/bash

# Configuration: Set to "true" if using API billing, "false" for Pro/Max subscription
SHOW_COST=true

# Read JSON input from stdin
input=$(cat)

# Extract information from JSON
model_name=$(echo "$input" | jq -r '.model.display_name')
current_dir=$(echo "$input" | jq -r '.workspace.current_dir')

# Extract cost information - only if configured to show
if [ "$SHOW_COST" = "true" ]; then
 cost_value=$(echo "$input" | jq -r '.cost.total_cost_usd // 0')
 if [ "$cost_value" != "0" ]; then
  session_cost=$(printf "%.2f" "$cost_value")
 else
  session_cost=""
 fi
else
 session_cost=""
fi

# Get directory name (basename)
dir_name=$(basename "$current_dir")

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[0;33m'
CYAN='\033[0;36m'
GRAY='\033[0;90m'
NC='\033[0m' # No Color

# Change to the current directory to get git info
cd "$current_dir" 2>/dev/null || cd /

# Get git branch
if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
 branch=$(git branch --show-current 2>/dev/null || echo "detached")

 # Handle author prefix - only truncate if more than 4 chars
 if [[ "$branch" == */* ]]; then
  author="${branch%%/*}"
  branch_part="${branch#*/}"

  # Only truncate author if more than 4 chars
  if [ ${#author} -gt 4 ]; then
   author="${author:0:4}…"
  fi

  branch="${author}/${branch_part}"
 fi

 # Truncate total to max 25 characters (including ellipsis)
 if [ ${#branch} -gt 25 ]; then
  branch="${branch:0:24}…"
 fi

 # Get git status with file counts
 status_output=$(git status --porcelain 2>/dev/null)

 if [ -n "$status_output" ]; then
 # Count files and get basic line stats
 total_files=$(echo "$status_output" | wc -l | xargs)
 line_stats=$(git diff --numstat HEAD 2>/dev/null | awk '{added+=$1; removed+=$2} END {print added+0, removed+0}')

 added=$(echo $line_stats | cut -d' ' -f1)
 removed=$(echo $line_stats | cut -d' ' -f2)

 # Build status display
 git_info=" ${YELLOW}($branch${NC} ${YELLOW}|${NC} ${GRAY}${total_files} files${NC}"

 [ "$added" -gt 0 ] && git_info="${git_info} ${GREEN}+${added}${NC}"
 [ "$removed" -gt 0 ] && git_info="${git_info} ${RED}-${removed}${NC}"

 git_info="${git_info}${YELLOW})${NC}"
 else
 git_info=" ${YELLOW}($branch)${NC}"
 fi
else
 git_info=""
fi

# Add session cost if available
cost_info=""
if [ -n "$session_cost" ]; then
 cost_info=" ${GRAY}[\$$session_cost]${NC}"
fi

# Output the status line
echo -e "${BLUE}${dir_name}${NC} ${GRAY}|${NC} ${CYAN}${model_name}${NC}${git_info:+ ${GRAY}|${NC}}${git_info}${cost_info}"
