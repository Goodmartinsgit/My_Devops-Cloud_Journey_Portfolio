# Task 11: Configure Logrotate for a Custom Application Log

## 🎯 Task Objective
Simulate a rapidly growing application log and configure system-level `logrotate` directives (daily rotations, 14-file preservation, compression, delay compression, creation mask) to manage disk space.

---

## 🛠️ Step-by-Step Implementation

1.  **Generate Target Application Logs (Simulation)**:
    Create a fake application folder structure and simulate a growing trace:
    ```bash
    mkdir -p /var/log/myapp
    touch /var/log/myapp/app.log

    # Simulate entries
    for i in $(seq 1 1000); do
        echo "[$(date)] INFO: Request $i processed successfully" >> /var/log/myapp/app.log
    done
    
    ls -lh /var/log/myapp/app.log
    ```

2.  **Define Logrotate Specifications**:
    Save the custom logrotate block into `/etc/logrotate.d/myapp`:
    ```bash
    sudo nano /etc/logrotate.d/myapp
    ```
    
    Add this configuration:
    ```text
    /var/log/myapp/*.log {
        daily
        rotate 14
        compress
        delaycompress
        missingok
        notifempty
        create 0640 root root
        sharedscripts
        postrotate
            echo "[$(date)] Log rotated by logrotate" >> /var/log/myapp/app.log
        endscript
    }
    ```

3.  **Core Directives Explained**:
    *   `daily`: Triggers the rotation process every 24 hours.
    *   `rotate 14`: Retains up to 14 rotated log segments. Oldest segment is removed on the 15th cycle.
    *   `compress`: Packages inactive rotated segments using gzip compression to save block allocation storage.
    *   `delaycompress`: Delays compression of the most recent rotated segment (`app.log.1`) to the subsequent cycle (safeguarding active process handles).
    *   `missingok`: Silently bypasses error reporting if the active logging directory/file is missing.
    *   `notifempty`: Bypasses rotation cycle if the target log has a size of 0.
    *   `create 0640 root root`: Instantly creates a fresh empty log file with specified owner permissions after a rotation.
    *   `postrotate/endscript`: Execute custom routines (like restarting service hooks or logging execution notifications) post-rotation.

---

## 📝 Verification Logs

1.  **Dry Run Configuration Checks**:
    ```bash
    sudo logrotate --debug /etc/logrotate.d/myapp
    ```

2.  **Force Immediate Rotation**:
    ```bash
    sudo logrotate --force /etc/logrotate.d/myapp
    ```

3.  **Confirm File Outputs**:
    ```bash
    ls -la /var/log/myapp/
    # Expected: app.log (newly created empty file) and app.log.1 (rotated archive log)
    ```

Log it:
```bash
../../../../utils/log-task.sh "sudo logrotate --force /etc/logrotate.d/myapp; ls -la /var/log/myapp/" "Logrotate Execution & File Verification" "verification.log"
```

👉 **[verification.log](./verification.log)**
