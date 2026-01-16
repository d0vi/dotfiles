#!/bin/bash

# Read JSON input from stdin
input=$(cat)

# Extract data from JSON
current_dir=$(echo "$input" | jq -r '.workspace.current_dir')
model=$(echo "$input" | jq -r '.model.display_name')
usage=$(echo "$input" | jq '.context_window.current_usage')

# Get current directory name (basename)
dir_name=$(basename "$current_dir")

# Get git branch (skip optional locks for better performance)
branch=$(git -C "$current_dir" -c core.useBuiltinFSMonitor=false -c gc.autodetach=false branch --show-current 2>/dev/null)

# Define ANSI color codes
CYAN='\033[36m'
GREEN='\033[32m'
YELLOW='\033[33m'
BLUE='\033[34m'
MAGENTA='\033[35m'
RESET='\033[0m'

# Define Unicode icons
FOLDER_ICON="📁"
BRANCH_ICON="🌿"
ROBOT_ICON="🤖"
STATS_ICON="📊"

# Build status line components
status_parts=""

# Add current directory
status_parts="${FOLDER_ICON} ${CYAN}${dir_name}${RESET}"

# Add git branch if available
if [ -n "$branch" ]; then
    status_parts="${status_parts}  ${BRANCH_ICON} ${GREEN}${branch}${RESET}"
fi

# Add model name
status_parts="${status_parts}  ${ROBOT_ICON} ${BLUE}${model}${RESET}"

# Add context usage if available
if [ "$usage" != "null" ]; then
    current=$(echo "$usage" | jq '.input_tokens + .cache_creation_input_tokens + .cache_read_input_tokens')
    size=$(echo "$input" | jq '.context_window.context_window_size')
    pct=$((current * 100 / size))
    status_parts="${status_parts}  ${STATS_ICON} ${YELLOW}${pct}%${RESET}"
fi

# Output the complete status line
printf "%b" "$status_parts"
