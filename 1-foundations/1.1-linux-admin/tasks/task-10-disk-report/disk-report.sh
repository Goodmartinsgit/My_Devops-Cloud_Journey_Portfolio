#!/bin/bash
# disk-report.sh - Generates a detailed disk usage report and manages rotation.

REPORT_DIR="/projects/devops/logs"
REPORT_FILE="$REPORT_DIR/disk-report-$(date +%Y%m%d_%H%M%S).log"

# Create report directory if it doesn't exist
mkdir -p "$REPORT_DIR"

# Generate report block
{
    echo "=========================================="
    echo "DISK USAGE REPORT"
    echo "Generated: $(date)"
    echo "Server: $(hostname)"
    echo "=========================================="
    echo ""

    echo "--- FILESYSTEM OVERVIEW ---"
    df -hT | grep -v tmpfs | grep -v udev
    echo ""

    echo "--- TOP 10 DIRECTORIES BY SIZE (/) ---"
    du -sh /* 2>/dev/null | sort -rh | head -10
    echo ""

    echo "--- TOP 10 LARGEST FILES IN /var ---"
    find /var -type f -printf '%s %p\n' 2>/dev/null | \
        sort -rn | head -10 | \
        awk '{printf "%.1f MB\t%s\n", $1/1024/1024, $2}'
    echo ""

    echo "--- LOG DIRECTORY SIZES ---"
    du -sh /var/log/* 2>/dev/null | sort -rh | head -15
    echo ""

    echo "--- INODE USAGE ---"
    df -ih | grep -v tmpfs | grep -v udev
    echo ""

    echo "--- DISK HEALTH SUMMARY ---"
    for disk in $(lsblk -d -o NAME -n | grep -v "loop"); do
        echo "Disk: /dev/$disk"
        echo "  Size: $(lsblk -d -o SIZE -n /dev/$disk 2>/dev/null)"
    done

    echo ""
    echo "Report complete."
} > "$REPORT_FILE"

# Display summary to stdout
echo "Disk report saved to: $REPORT_FILE"
cat "$REPORT_FILE"

# Keep only last 7 reports (clean older files)
ls -t "$REPORT_DIR"/disk-report-*.log | tail -n +8 | xargs rm -f 2>/dev/null
echo "Old reports cleaned up. Current reports: $(ls $REPORT_DIR/disk-report-*.log | wc -l)"
