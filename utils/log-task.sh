#!/bin/bash
# log-task.sh - Helper script for DevOps portfolio tasks to record command outputs.
# Usage:  ./log-task.sh "<command(s)>" "<description>" [output_file]
# Single: ./log-task.sh "df -h" "Check disk space" "verification.log"
# Multi:  ./log-task.sh "df -h; free -h; uname -a" "System snapshot" "verification.log"

COMMAND="$1"
DESCRIPTION="$2"
OUTPUT_FILE="${3:-verification.log}"

if [ -z "$COMMAND" ] || [ -z "$DESCRIPTION" ]; then
    echo "Usage: $0 \"<command(s)>\" \"<description>\" [output_file]"
    echo "Example: $0 \"df -h; free -h\" \"Check system resources\" \"verification.log\""
    exit 1
fi

TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")
mkdir -p "$(dirname "$OUTPUT_FILE")"

# Helper: append a line to the log file
log() { printf '%s\n' "$1" >> "$OUTPUT_FILE"; }

# --- Parse commands: split on ';', trim whitespace, drop empties ---
IFS=';' read -ra _RAW <<< "$COMMAND"
CMDS=()
for _raw in "${_RAW[@]}"; do
    _trimmed="$(echo "$_raw" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')"
    [ -n "$_trimmed" ] && CMDS+=("$_trimmed")
done

TOTAL=${#CMDS[@]}

# --- Terminal feedback ---
echo ""
echo "┌──────────────────────────────────────────────────"
echo "│  📋 $DESCRIPTION"
echo "│  🕐 $TIMESTAMP"
echo "│  📂 $OUTPUT_FILE"
printf "│  🔢 %d command(s) queued\n" "$TOTAL"
echo "└──────────────────────────────────────────────────"

# --- Write task section header to log ---
log ""
log "---"
log ""
log "## 🔍 $DESCRIPTION"
log ""
log "> **Timestamp:** \`$TIMESTAMP\`"
log ""

# --- Run and log each command individually ---
i=1
for CMD in "${CMDS[@]}"; do
    printf "  [%d/%d] Running: %s\n" "$i" "$TOTAL" "$CMD"
    log "### $(printf '%02d' "$i"). \`$CMD\`"
    log ""
    log "\`\`\`bash"
    log "$CMD"
    log "\`\`\`"
    log ""
    log "**Output:**"
    log ""
    log "\`\`\`text"
    eval "$CMD" >> "$OUTPUT_FILE" 2>&1
    log "\`\`\`"
    log ""
    i=$(( i + 1 ))
done

echo "  ✔  $TOTAL entry/entries appended → $OUTPUT_FILE"

# --- Sync log output into README.md ---
MARKER="<!-- LOG_OUTPUT -->"
README_FILE="$(cd "$(dirname "$OUTPUT_FILE")" && pwd)/README.md"

if [ -f "$README_FILE" ] && grep -q "$MARKER" "$README_FILE"; then
    MARKER_LINE=$(grep -n "$MARKER" "$README_FILE" | head -1 | cut -d: -f1)
    head -n "$MARKER_LINE" "$README_FILE" > "${README_FILE}.tmp"
    printf '\n' >> "${README_FILE}.tmp"
    cat "$OUTPUT_FILE" >> "${README_FILE}.tmp"
    mv "${README_FILE}.tmp" "$README_FILE"
    echo "  ✔  README.md synced  → $README_FILE"
fi

echo ""