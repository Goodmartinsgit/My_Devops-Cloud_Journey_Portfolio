# Task 8: Find and Archive Recent Log Files

## Objective

Write a Bash script that searches for system log files modified within the past 7 days and compresses them into a timestamped `.tar.gz` archive for rotation backups.

<!-- LOG_OUTPUT -->


---

## Creating test log files with different timestamps

> **Timestamp:** `2026-06-15 21:49:45`

### 01. `sudo mkdir -p /tmp/sample-logs`

```bash
sudo mkdir -p /tmp/sample-logs
```

**Output:**

```text
```

### 02. `sudo touch /tmp/sample-logs/app.log`

```bash
sudo touch /tmp/sample-logs/app.log
```

**Output:**

```text
```

### 03. `sudo touch /tmp/sample-logs/error.log`

```bash
sudo touch /tmp/sample-logs/error.log
```

**Output:**

```text
```

### 04. `sudo touch -t 202301010000 /tmp/sample-logs/old.log`

```bash
sudo touch -t 202301010000 /tmp/sample-logs/old.log
```

**Output:**

```text
```


---

## Finding .log files modified in the last 7 days

> **Timestamp:** `2026-06-15 21:53:06`

### 01. `find /var/log -name '*.log' -mtime -7 -type f 2>/dev/null`

```bash
find /var/log -name '*.log' -mtime -7 -type f 2>/dev/null
```

**Output:**

```text
/var/log/apt/term.log
/var/log/apt/history.log
/var/log/dpkg.log
/var/log/unattended-upgrades/unattended-upgrades-dpkg.log
/var/log/unattended-upgrades/unattended-upgrades.log
/var/log/auth.log
/var/log/nginx/error.log
/var/log/nginx/access.log
/var/log/kern.log
```

### 02. `find /tmp/sample-logs -name '*.log' -mtime -7 -type f`

```bash
find /tmp/sample-logs -name '*.log' -mtime -7 -type f
```

**Output:**

```text
/tmp/sample-logs/error.log
/tmp/sample-logs/app.log
```


---

## Archiving recent .log files into a dated tar.gz

> **Timestamp:** `2026-06-15 21:53:37`

### 01. `sudo mkdir -p /projects/devops/backups`

```bash
sudo mkdir -p /projects/devops/backups
```

**Output:**

```text
```

### 02. `find /var/log -name '*.log' -mtime -7 -type f 2>/dev/null | sudo tar -czvf /projects/devops/backups/logs-$(date +%Y%m%d).tar.gz -T -`

```bash
find /var/log -name '*.log' -mtime -7 -type f 2>/dev/null | sudo tar -czvf /projects/devops/backups/logs-$(date +%Y%m%d).tar.gz -T -
```

**Output:**

```text
tar: Removing leading `/' from member names
/var/log/apt/term.log
tar: Removing leading `/' from hard link targets
/var/log/apt/history.log
/var/log/dpkg.log
/var/log/unattended-upgrades/unattended-upgrades-dpkg.log
/var/log/unattended-upgrades/unattended-upgrades.log
/var/log/auth.log
/var/log/nginx/error.log
/var/log/nginx/access.log
/var/log/kern.log
```


---

## Verifying the log archive contents and size

> **Timestamp:** `2026-06-15 21:54:01`

### 01. `ls -lh /projects/devops/backups/logs-$(date +%Y%m%d).tar.gz`

```bash
ls -lh /projects/devops/backups/logs-$(date +%Y%m%d).tar.gz
```

**Output:**

```text
-rw-r--r-- 1 root root 100K Jun 15 21:53 /projects/devops/backups/logs-20260615.tar.gz
```

### 02. `sudo tar -tvf /projects/devops/backups/logs-$(date +%Y%m%d).tar.gz | head -20`

```bash
sudo tar -tvf /projects/devops/backups/logs-$(date +%Y%m%d).tar.gz | head -20
```

**Output:**

```text
-rw-r----- root/adm       2268 2026-06-15 17:52 var/log/apt/term.log
-rw-r--r-- root/root     27086 2026-06-15 17:52 var/log/apt/history.log
-rw-r--r-- root/root    372331 2026-06-15 17:52 var/log/dpkg.log
-rw-r--r-- root/root         0 2026-06-11 09:14 var/log/unattended-upgrades/unattended-upgrades-dpkg.log
-rw-r--r-- root/root      2412 2026-06-13 18:11 var/log/unattended-upgrades/unattended-upgrades.log
-rw-r----- syslog/adm    53048 2026-06-15 21:53 var/log/auth.log
-rw-r----- www-data/adm     76 2026-06-15 17:52 var/log/nginx/error.log
-rw-r----- www-data/adm     79 2026-06-15 18:01 var/log/nginx/access.log
-rw-r----- syslog/adm   291029 2026-06-15 21:49 var/log/kern.log
```


---

## Creating archive-logs.sh script and making it executable

> **Timestamp:** `2026-06-15 21:55:01`

### 01. `sudo chmod +x /projects/devops/scripts/archive-logs.sh`

```bash
sudo chmod +x /projects/devops/scripts/archive-logs.sh
```

**Output:**

```text
```

### 02. `ls -la /projects/devops/scripts/archive-logs.sh`

```bash
ls -la /projects/devops/scripts/archive-logs.sh
```

**Output:**

```text
-rwxr-xr-x 1 root root 662 Jun 15 21:54 /projects/devops/scripts/archive-logs.sh
```

