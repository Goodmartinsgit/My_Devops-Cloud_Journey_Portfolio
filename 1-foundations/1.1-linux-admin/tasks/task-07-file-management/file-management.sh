#!/bin/bash
# file-management.sh - Creates 10 files, deletes odd-numbered ones, and logs output.

WORK_DIR="/tmp/test-files"
LOG_FILE="/projects/devops/logs/file-management.log"
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")

# Create working directory
mkdir -p "$WORK_DIR"
mkdir -p "$(dirname "$LOG_FILE")"

echo "[$TIMESTAMP] Starting file management task" >> "$LOG_FILE"

# Create 10 numbered files
echo "[$TIMESTAMP] Creating 10 files..." >> "$LOG_FILE"
for i in $(seq 1 10); do
    touch "$WORK_DIR/file-$i.txt"
    echo "Content of file $i" > "$WORK_DIR/file-$i.txt"
    echo "[$TIMESTAMP] Created: file-$i.txt" >> "$LOG_FILE"
done

# List created files
echo "[$TIMESTAMP] Files created:" >> "$LOG_FILE"
ls "$WORK_DIR" >> "$LOG_FILE"

# Delete odd-numbered files (1, 3, 5, 7, 9)
echo "[$TIMESTAMP] Deleting odd-numbered files..." >> "$LOG_FILE"
for i in 1 3 5 7 9; do
    if [ -f "$WORK_DIR/file-$i.txt" ]; then
        rm "$WORK_DIR/file-$i.txt"
        echo "[$TIMESTAMP] Deleted: file-$i.txt" >> "$LOG_FILE"
    fi
done

# Log remaining files
echo "[$TIMESTAMP] Remaining files:" >> "$LOG_FILE"
ls "$WORK_DIR" >> "$LOG_FILE"

echo "[$TIMESTAMP] Task complete. $(ls $WORK_DIR | wc -l) files remaining." >> "$LOG_FILE"
echo "Script complete. Check $LOG_FILE for details."
