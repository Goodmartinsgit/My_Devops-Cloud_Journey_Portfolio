# Task 7: Write a Script to Create and Selectively Delete Files

## 🎯 Task Objective
Automate temporary directory creation, generate 10 test files with text content, clean up only odd-numbered files, and record a structured history log of these operations.

---

## 💻 Script Code
The Bash script is saved in the portfolio workspace:
👉 **[file-management.sh](./file-management.sh)**

```bash
#!/bin/bash
# file-management.sh - Creates 10 files, deletes odd-numbered ones, and logs output.

WORK_DIR="/tmp/test-files"
LOG_FILE="/projects/devops/logs/file-management.log"
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")

mkdir -p "$WORK_DIR"
mkdir -p "$(dirname "$LOG_FILE")"

echo "[$TIMESTAMP] Starting file management task" >> "$LOG_FILE"

# Create 10 files
echo "[$TIMESTAMP] Creating 10 files..." >> "$LOG_FILE"
for i in $(seq 1 10); do
    touch "$WORK_DIR/file-$i.txt"
    echo "Content of file $i" > "$WORK_DIR/file-$i.txt"
    echo "[$TIMESTAMP] Created: file-$i.txt" >> "$LOG_FILE"
done

# List created files
echo "[$TIMESTAMP] Files created:" >> "$LOG_FILE"
ls "$WORK_DIR" >> "$LOG_FILE"

# Delete odd-numbered files
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
```

---

## 🛠️ Step-by-Step Implementation

1.  **Place the Script**:
    Write the script contents into the file above.

2.  **Make Executable**:
    ```bash
    chmod +x file-management.sh
    ```

3.  **Run the Script**:
    ```bash
    ./file-management.sh
    ```

---

## 📝 Verification Logs

1.  **Inspect Remaining Files**:
    ```bash
    ls -la /tmp/test-files/
    # Expected: Only file-2.txt, file-4.txt, file-6.txt, file-8.txt, file-10.txt remain.
    ```

2.  **Inspect execution logs**:
    ```bash
    cat /projects/devops/logs/file-management.log
    ```

To log your outputs to the portfolio folder:
```bash
../../../../utils/log-task.sh "ls -la /tmp/test-files/; cat /projects/devops/logs/file-management.log" "Executing file management and reading logs" "verification.log"
```

👉 **[verification.log](./verification.log)**
