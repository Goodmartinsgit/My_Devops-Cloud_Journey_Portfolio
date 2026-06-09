#!/bin/bash
# system-backup.sh - Automated backup of system configuration files and scripts.

LOG_FILE="/projects/devops/logs/backup.log"
BACKUP_DIR="/projects/devops/backups"
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")

# Ensure target directory exists
mkdir -p "$BACKUP_DIR"

echo "[$TIMESTAMP] Backup service started" >> "$LOG_FILE"

# Backup /etc (configuration files)
tar -czvf "$BACKUP_DIR/etc-backup-$(date +%Y%m%d).tar.gz" /etc/ 2>/dev/null
echo "[$TIMESTAMP] /etc backup complete" >> "$LOG_FILE"

# Backup project scripts
tar -czvf "$BACKUP_DIR/scripts-backup-$(date +%Y%m%d).tar.gz" \
    /projects/devops/scripts/ 2>/dev/null
echo "[$TIMESTAMP] Scripts backup complete" >> "$LOG_FILE"

# Remove backups older than 7 days
find "$BACKUP_DIR" -name "*.tar.gz" -mtime +7 -delete
echo "[$TIMESTAMP] Old backups cleaned up" >> "$LOG_FILE"
echo "[$TIMESTAMP] Backup complete" >> "$LOG_FILE"
