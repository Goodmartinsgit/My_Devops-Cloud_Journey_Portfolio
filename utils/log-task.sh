#!/bin/bash
# log-task.sh - Helper script for DevOps portfolio tasks to record command outputs.
# Usage: ./log-task.sh "<command>" "<description>" [output_file]
# Example: ./log-task.sh "df -h" "Checking disk space" "verification.log"

COMMAND="$1"
DESCRIPTION="$2"
OUTPUT_FILE="${3:-verification.log}"

if [ -z "$COMMAND" ] || [ -z "$DESCRIPTION" ]; then
    echo "Usage: $0 \"<command>\" \"<description>\" [output_file]"
    echo "Example: $0 \"df -h\" \"Check disk partition usage\" \"verification.log\""
    exit 1
fi

TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")

# Ensure the parent directory of the output file exists
mkdir -p "$(dirname "$OUTPUT_FILE")"

echo "=== Running Command: $COMMAND ==="
echo "Description: $DESCRIPTION"

# Prepare the markdown formatted entry
{
    echo "### 🔍 $DESCRIPTION"
    echo "*   **Timestamp**: $TIMESTAMP"
    echo "*   **Command Run**:"
    echo "    \`\`\`bash"
    echo "    $COMMAND"
    echo "    \`\`\`"
    echo "*   **Console Output**:"
    echo "    \`\`\`text"
    
    # Run the command, capturing both stdout and stderr, and indent it for clean markdown nesting
    eval "$COMMAND" 2>&1 | sed 's/^/    /'
    
    echo "    \`\`\`"
    echo ""
} >> "$OUTPUT_FILE"

echo "Result appended to $OUTPUT_FILE"
echo "================================="
