# Task 12: Create a Custom Systemd Service for Your Backup Script

## 🎯 Task Objective
Create an automated system backup script, configure a custom systemd service (`oneshot`) to run it, and declare a systemd timer to automate its execution daily (running 5 minutes after boot, recurring daily, persistently tracking missed schedules).

---

## 💻 Script Code
The backup execution script is saved here:
👉 **[system-backup.sh](./system-backup.sh)**

```bash
#!/bin/bash
# system-backup.sh - Automated backup of system configuration files and scripts.

LOG_FILE="/projects/devops/logs/backup.log"
BACKUP_DIR="/projects/devops/backups"
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")

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
```

---

## 🛠️ Step-by-Step Implementation

1.  **Script Deployment**:
    Create the script file, save the contents, and make it executable:
    ```bash
    chmod +x system-backup.sh
    ```

2.  **Define Systemd Service Unit**:
    Create the service unit file `/etc/systemd/system/system-backup.service` to govern execution limits:
    ```text
    [Unit]
    Description=System Backup Service
    Documentation=file:///projects/devops/scripts/system-backup.sh
    After=network.target
    Wants=network.target

    [Service]
    Type=oneshot
    User=root
    Group=root
    WorkingDirectory=/projects/devops
    ExecStart=/projects/devops/scripts/system-backup.sh
    StandardOutput=journal
    StandardError=journal
    TimeoutStartSec=3600
    RemainAfterExit=yes

    [Install]
    WantedBy=multi-user.target
    ```

3.  **Define Systemd Timer Unit**:
    Create `/etc/systemd/system/system-backup.timer` to schedule automated triggers:
    ```text
    [Unit]
    Description=Run System Backup Daily
    Requires=system-backup.service

    [Timer]
    OnCalendar=daily
    OnBootSec=5min
    Unit=system-backup.service
    Persistent=true

    [Install]
    WantedBy=timers.target
    ```

4.  **Register & Start Services**:
    Reload the systemd daemon to pick up the new unit files, start the service manually to verify correctness, and enable both the service and the timer:
    ```bash
    sudo systemctl daemon-reload
    
    # Run the service immediately to test it
    sudo systemctl start system-backup
    
    # Enable the timer for daily scheduling
    sudo systemctl enable --now system-backup.timer
    ```

---

## 📝 Verification Logs

1.  **Check Service Status**:
    Ensure the oneshot service executed and exited successfully:
    ```bash
    sudo systemctl status system-backup
    ```

2.  **Check Timer Schedule status**:
    ```bash
    sudo systemctl status system-backup.timer
    sudo systemctl list-timers system-backup.timer
    ```

3.  **Inspect Backup Files Created**:
    ```bash
    ls -la /projects/devops/backups/
    ```

4.  **Inspect Logs**:
    ```bash
    cat /projects/devops/logs/backup.log
    sudo journalctl -u system-backup -n 30
    ```

Log it:
```bash
../../../../utils/log-task.sh "sudo systemctl status system-backup; sudo systemctl list-timers system-backup.timer; ls -la /projects/devops/backups/" "Systemd Service & Timer verification" "verification.log"
```

👉 **[verification.log](./verification.log)**
