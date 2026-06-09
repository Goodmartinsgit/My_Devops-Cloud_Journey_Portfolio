# Task 8: Find and Archive Recent Log Files

## 🎯 Task Objective
Perform audit operations to locate logs modified in the last 7 days and compress them into a `.tar.gz` archive for rotation and backups. Automate this via a bash script.

---

## 💻 Archive Script Code
The automated script is saved here:
👉 **[archive-logs.sh](./archive-logs.sh)**

```bash
#!/bin/bash
# archive-logs.sh - Find and archive system log files modified in the last 7 days.

ARCHIVE_DIR="/projects/devops/backups"
ARCHIVE_NAME="$ARCHIVE_DIR/logs-$(date +%Y%m%d_%H%M%S).tar.gz"
LOG_FILE="/projects/devops/logs/archive-logs.log"

mkdir -p "$ARCHIVE_DIR"
mkdir -p "$(dirname "$LOG_FILE")"

echo "[$(date)] Starting log archive" >> "$LOG_FILE"

# Find and count files
COUNT=$(find /var/log -name "*.log" -mtime -7 -type f 2>/dev/null | wc -l)
echo "[$(date)] Found $COUNT log files to archive" >> "$LOG_FILE"

# Create the archive
find /var/log -name "*.log" -mtime -7 -type f 2>/dev/null | \
    tar -czvf "$ARCHIVE_NAME" -T - 2>/dev/null

echo "[$(date)] Archive created: $ARCHIVE_NAME" >> "$LOG_FILE"
echo "[$(date)] Archive size: $(du -sh $ARCHIVE_NAME | cut -f1)" >> "$LOG_FILE"
```

---

## 🛠️ Step-by-Step Implementation

1.  **Create Test Log Files (Verification Scenario)**:
    Create sample logs of varying modification times (including older ones) to verify filtration works:
    ```bash
    mkdir -p /tmp/sample-logs
    touch /tmp/sample-logs/app.log
    touch /tmp/sample-logs/error.log
    touch -t 202301010000 /tmp/sample-logs/old.log # Set modified time to 2023
    ```

2.  **Filter Logic Test**:
    Validate that finding files modified in the last 7 days works:
    ```bash
    find /tmp/sample-logs -name "*.log" -mtime -7 -type f
    # Expected: Only app.log and error.log are returned (old.log is excluded)
    ```

3.  **Run the script**:
    Make it executable and execute:
    ```bash
    chmod +x archive-logs.sh
    ./archive-logs.sh
    ```

---

## 📝 Verification Logs

1.  **Inspect the Created Archive**:
    Verify the archive directory contents and file size:
    ```bash
    ls -lh /projects/devops/backups/
    ```

2.  **Verify Contents of the Archive**:
    List files in the archive to confirm only valid logs were selected:
    ```bash
    tar -tvf /projects/devops/backups/logs-*.tar.gz | head -n 20
    ```

3.  **Read Execution Script Log**:
    ```bash
    cat /projects/devops/logs/archive-logs.log
    ```

Log it:
```bash
../../../../utils/log-task.sh "ls -lh /projects/devops/backups/; cat /projects/devops/logs/archive-logs.log" "Log archiving verification" "verification.log"
```

👉 **[verification.log](./verification.log)**
