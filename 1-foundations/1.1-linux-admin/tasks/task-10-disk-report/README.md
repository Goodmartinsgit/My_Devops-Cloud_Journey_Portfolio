# Task 10: Write a Disk Usage Report Script

## 🎯 Task Objective
Automate system disk audits and generate a comprehensive diagnostic report detailing partition sizes, top directories, largest logs, and inode structures. Retain only the last 7 reports.

---

## 💻 Script Code
The Bash script is saved in the portfolio:
👉 **[disk-report.sh](./disk-report.sh)**

```bash
#!/bin/bash
# disk-report.sh - Generates a detailed disk usage report and manages rotation.

REPORT_DIR="/projects/devops/logs"
REPORT_FILE="$REPORT_DIR/disk-report-$(date +%Y%m%d_%H%M%S).log"

mkdir -p "$REPORT_DIR"

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

echo "Disk report saved to: $REPORT_FILE"
cat "$REPORT_FILE"

# Keep only last 7 reports
ls -t "$REPORT_DIR"/disk-report-*.log | tail -n +8 | xargs rm -f 2>/dev/null
echo "Old reports cleaned up. Current reports: $(ls $REPORT_DIR/disk-report-*.log | wc -l)"
```

---

## 🛠️ Step-by-Step Implementation

1.  **Deploy Script**:
    Write the code to the script file.

2.  **Assign Privileges**:
    ```bash
    chmod +x disk-report.sh
    ```

3.  **Run with Administrative Sudo**:
    ```bash
    sudo ./disk-report.sh
    ```

---

## 📝 Verification Logs

1.  **Check Generated Outputs**:
    ```bash
    ls -la /projects/devops/logs/disk-report-*.log
    ```

2.  **Verify Contents of Report File**:
    ```bash
    cat /projects/devops/logs/disk-report-[timestamp].log
    ```

Log it:
```bash
../../../../utils/log-task.sh "sudo ./disk-report.sh" "Generating and verifying disk report" "verification.log"
```

👉 **[verification.log](./verification.log)**
