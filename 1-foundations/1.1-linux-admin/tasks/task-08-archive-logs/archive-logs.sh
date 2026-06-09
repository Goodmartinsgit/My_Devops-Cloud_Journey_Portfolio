#!/bin/bash
# archive-logs.sh - Find and archive system log files modified in the last 7 days.

ARCHIVE_DIR="/projects/devops/backups"
ARCHIVE_NAME="$ARCHIVE_DIR/logs-$(date +%Y%m%d_%H%M%S).tar.gz"
LOG_FILE="/projects/devops/logs/archive-logs.log"

# Create directories
mkdir -p "$ARCHIVE_DIR"
mkdir -p "$(dirname "$LOG_FILE")"

echo "[$(date)] Starting log archive" >> "$LOG_FILE"

# Find and count files modified in last 7 days
COUNT=$(find /var/log -name "*.log" -mtime -7 -type f 2>/dev/null | wc -l)
echo "[$(date)] Found $COUNT log files to archive" >> "$LOG_FILE"

# Package and compress files
find /var/log -name "*.log" -mtime -7 -type f 2>/dev/null | \
    tar -czvf "$ARCHIVE_NAME" -T - 2>/dev/null

echo "[$(date)] Archive created: $ARCHIVE_NAME" >> "$LOG_FILE"
echo "[$(date)] Archive size: $(du -sh $ARCHIVE_NAME | cut -f1)" >> "$LOG_FILE"
