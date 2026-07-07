# Task 12: Create a Custom Systemd Service for Your Backup Script

## Objective

Wrap a backup automation script into a systemd service unit, schedule it to run automatically using a systemd timer, and monitor execution via journal logs.

<!-- LOG_OUTPUT -->


---

## Creating system-backup.sh and making it executable

> **Timestamp:** `2026-06-16 09:46:20`

### 01. `sudo chmod +x /projects/devops/scripts/system-backup.sh`

```bash
sudo chmod +x /projects/devops/scripts/system-backup.sh
```

**Output:**

```text
```

### 02. `ls -la /projects/devops/scripts/system-backup.sh`

```bash
ls -la /projects/devops/scripts/system-backup.sh
```

**Output:**

```text
-rwxr-xr-x 1 root root 818 Jun 16 09:45 /projects/devops/scripts/system-backup.sh
```


---

## Verifying system-backup.service unit file contents

> **Timestamp:** `2026-06-16 09:47:22`

### 01. `cat /etc/systemd/system/system-backup.service`

```bash
cat /etc/systemd/system/system-backup.service
```

**Output:**

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


---

## Reloading systemd daemon to register new service

> **Timestamp:** `2026-06-16 09:47:56`

### 01. `sudo systemctl daemon-reload`

```bash
sudo systemctl daemon-reload
```

**Output:**

```text
```


---

## Starting system-backup service

> **Timestamp:** `2026-06-16 09:48:18`

### 01. `sudo systemctl start system-backup`

```bash
sudo systemctl start system-backup
```

**Output:**

```text
```


---

## Checking system-backup service status

> **Timestamp:** `2026-06-16 09:48:42`

### 01. `sudo systemctl status system-backup`

```bash
sudo systemctl status system-backup
```

**Output:**

```text
 system-backup.service - System Backup Service
     Loaded: loaded (/etc/systemd/system/system-backup.service; disabled; preset: enabled)
     Active: active (exited) since Tue 2026-06-16 09:48:22 WAT; 20s ago
       Docs: file:///projects/devops/scripts/system-backup.sh
    Process: 5810 ExecStart=/projects/devops/scripts/system-backup.sh (code=exited, status=0/SUCCESS)
   Main PID: 5810 (code=exited, status=0/SUCCESS)
        CPU: 2.069s

Jun 16 09:48:22 ELDAVED-GLOBAL system-backup.sh[5814]: /etc/alternatives/awk
Jun 16 09:48:22 ELDAVED-GLOBAL system-backup.sh[5814]: /etc/fstab
Jun 16 09:48:22 ELDAVED-GLOBAL system-backup.sh[5814]: /etc/ldap/
Jun 16 09:48:22 ELDAVED-GLOBAL system-backup.sh[5814]: /etc/ldap/ldap.conf
Jun 16 09:48:22 ELDAVED-GLOBAL system-backup.sh[5818]: /projects/devops/scripts/
Jun 16 09:48:22 ELDAVED-GLOBAL system-backup.sh[5818]: /projects/devops/scripts/system-backup.sh
Jun 16 09:48:22 ELDAVED-GLOBAL system-backup.sh[5818]: /projects/devops/scripts/archive-logs.sh
Jun 16 09:48:22 ELDAVED-GLOBAL system-backup.sh[5818]: /projects/devops/scripts/disk-report.sh
Jun 16 09:48:22 ELDAVED-GLOBAL system-backup.sh[5818]: /projects/devops/scripts/file-management.sh
Jun 16 09:48:22 ELDAVED-GLOBAL systemd[1]: Finished system-backup.service - System Backup Service.
```


---

## Checking system-backup service journal logs

> **Timestamp:** `2026-06-16 09:49:05`

### 01. `sudo journalctl -u system-backup -n 30`

```bash
sudo journalctl -u system-backup -n 30
```

**Output:**

```text
Jun 16 09:48:22 ELDAVED-GLOBAL system-backup.sh[5814]: /etc/alternatives/ex.fr.1.gz
Jun 16 09:48:22 ELDAVED-GLOBAL system-backup.sh[5814]: /etc/alternatives/view.de.1.gz
Jun 16 09:48:22 ELDAVED-GLOBAL system-backup.sh[5814]: /etc/alternatives/x-cursor-theme
Jun 16 09:48:22 ELDAVED-GLOBAL system-backup.sh[5814]: /etc/alternatives/pager
Jun 16 09:48:22 ELDAVED-GLOBAL system-backup.sh[5814]: /etc/alternatives/which.1.gz
Jun 16 09:48:22 ELDAVED-GLOBAL system-backup.sh[5814]: /etc/alternatives/vi.fr.1.gz
Jun 16 09:48:22 ELDAVED-GLOBAL system-backup.sh[5814]: /etc/alternatives/which.sl1.gz
Jun 16 09:48:22 ELDAVED-GLOBAL system-backup.sh[5814]: /etc/alternatives/builtins.7.gz
Jun 16 09:48:22 ELDAVED-GLOBAL system-backup.sh[5814]: /etc/alternatives/ex.ja.1.gz
Jun 16 09:48:22 ELDAVED-GLOBAL system-backup.sh[5814]: /etc/alternatives/nc.1.gz
Jun 16 09:48:22 ELDAVED-GLOBAL system-backup.sh[5814]: /etc/alternatives/which.pl1.gz
Jun 16 09:48:22 ELDAVED-GLOBAL system-backup.sh[5814]: /etc/alternatives/lzcat.1.gz
Jun 16 09:48:22 ELDAVED-GLOBAL system-backup.sh[5814]: /etc/alternatives/which.de1.gz
Jun 16 09:48:22 ELDAVED-GLOBAL system-backup.sh[5814]: /etc/alternatives/pybabel
Jun 16 09:48:22 ELDAVED-GLOBAL system-backup.sh[5814]: /etc/alternatives/netcat
Jun 16 09:48:22 ELDAVED-GLOBAL system-backup.sh[5814]: /etc/alternatives/lzmore.1.gz
Jun 16 09:48:22 ELDAVED-GLOBAL system-backup.sh[5814]: /etc/alternatives/lzless
Jun 16 09:48:22 ELDAVED-GLOBAL system-backup.sh[5814]: /etc/alternatives/nawk
Jun 16 09:48:22 ELDAVED-GLOBAL system-backup.sh[5814]: /etc/alternatives/lzdiff.1.gz
Jun 16 09:48:22 ELDAVED-GLOBAL system-backup.sh[5814]: /etc/alternatives/which.fr1.gz
Jun 16 09:48:22 ELDAVED-GLOBAL system-backup.sh[5814]: /etc/alternatives/awk
Jun 16 09:48:22 ELDAVED-GLOBAL system-backup.sh[5814]: /etc/fstab
Jun 16 09:48:22 ELDAVED-GLOBAL system-backup.sh[5814]: /etc/ldap/
Jun 16 09:48:22 ELDAVED-GLOBAL system-backup.sh[5814]: /etc/ldap/ldap.conf
Jun 16 09:48:22 ELDAVED-GLOBAL system-backup.sh[5818]: /projects/devops/scripts/
Jun 16 09:48:22 ELDAVED-GLOBAL system-backup.sh[5818]: /projects/devops/scripts/system-backup.sh
Jun 16 09:48:22 ELDAVED-GLOBAL system-backup.sh[5818]: /projects/devops/scripts/archive-logs.sh
Jun 16 09:48:22 ELDAVED-GLOBAL system-backup.sh[5818]: /projects/devops/scripts/disk-report.sh
Jun 16 09:48:22 ELDAVED-GLOBAL system-backup.sh[5818]: /projects/devops/scripts/file-management.sh
Jun 16 09:48:22 ELDAVED-GLOBAL systemd[1]: Finished system-backup.service - System Backup Service.
```


---

## Enabling system-backup service to start on boot

> **Timestamp:** `2026-06-16 09:49:21`

### 01. `sudo systemctl enable system-backup`

```bash
sudo systemctl enable system-backup
```

**Output:**

```text
Created symlink /etc/systemd/system/multi-user.target.wants/system-backup.service → /etc/systemd/system/system-backup.service.
```


---

## Verifying backup files were created and checking backup log

> **Timestamp:** `2026-06-16 09:49:41`

### 01. `ls -la /projects/devops/backups/`

```bash
ls -la /projects/devops/backups/
```

**Output:**

```text
total 536
drwxr-xr-x 2 devops-user devops-user   4096 Jun 16 09:48 .
drwxr-xr-x 7 devops-user devops-user   4096 Jun 13 17:23 ..
-rw-r--r-- 1 root        root        433447 Jun 16 09:48 etc-backup-20260616.tar.gz
-rw-r--r-- 1 root        root        101415 Jun 15 21:53 logs-20260615.tar.gz
-rw-r--r-- 1 root        root          1722 Jun 16 09:48 scripts-backup-20260616.tar.gz
```

### 02. `cat /projects/devops/logs/backup.log`

```bash
cat /projects/devops/logs/backup.log
```

**Output:**

```text
[2026-06-16 09:48:20] Backup service started
[2026-06-16 09:48:20] /etc backup complete
[2026-06-16 09:48:20] Scripts backup complete
[2026-06-16 09:48:20] Old backups cleaned up
[2026-06-16 09:48:20] Backup complete
```


---

## Verifying system-backup.timer unit file contents

> **Timestamp:** `2026-06-16 09:50:52`

### 01. `cat /etc/systemd/system/system-backup.timer`

```bash
cat /etc/systemd/system/system-backup.timer
```

**Output:**

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


---

## Enabling system-backup timer and verifying it is scheduled

> **Timestamp:** `2026-06-16 09:51:06`

### 01. `sudo systemctl daemon-reload`

```bash
sudo systemctl daemon-reload
```

**Output:**

```text
```

### 02. `sudo systemctl enable --now system-backup.timer`

```bash
sudo systemctl enable --now system-backup.timer
```

**Output:**

```text
Created symlink /etc/systemd/system/timers.target.wants/system-backup.timer → /etc/systemd/system/system-backup.timer.
```

### 03. `sudo systemctl list-timers system-backup.timer`

```bash
sudo systemctl list-timers system-backup.timer
```

**Output:**

```text
NEXT LEFT LAST                           PASSED UNIT                ACTIVATES
-       - Tue 2026-06-16 09:51:11 WAT 624ms ago system-backup.timer system-backup.service

1 timers listed.
Pass --all to see loaded but inactive timers, too.
```

