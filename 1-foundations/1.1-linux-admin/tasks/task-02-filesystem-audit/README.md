# Task 2: Navigate the Entire Linux Filesystem

## 🎯 Task Objective
Perform an audit of a newly provisioned server's filesystem layout to discover running configurations, log files, installed program suites, and active devices.

---

## 🛠️ Step-by-Step Implementation

1.  **Lay of the Land (Root)**:
    Start at the filesystem root and observe top-level directories:
    ```bash
    ls -la /
    ```

2.  **Inspect Key Directories**:
    Run the following discovery commands:
    ```bash
    ls /etc | head -30          # System configuration files
    ls /var/log                 # Service execution logs
    ls /home                    # Active user home folders
    ls /usr/bin | head -20      # Core executable files
    ls /opt                     # Third-party software installs
    cat /proc/cpuinfo           # Kernel virtual memory CPU mapping
    cat /proc/meminfo | head -10 # Kernel memory stats
    ls /dev | head -20          # System device files
    ```

---

## ✍️ Server Filesystem Audit Report

Create a written summary of what each directory contains on your server. Fill in the findings below:

*   **`/etc` Findings**:
    *   *Which Web Server is configured here?* (Check if there is an `/etc/nginx` or `/etc/apache2` or `/etc/httpd` directory)
    *   *User Auth config file*: `/etc/passwd` and `/etc/shadow`
*   **`/var/log` Findings**:
    *   *Syslog file*: `/var/log/syslog` or `/var/log/messages`
    *   *Security logs*: `/var/log/auth.log` or `/var/log/secure`
    *   *What other service logs exist?*: `[e.g., nginx/, dpkg.log]`
*   **`/usr/bin` Findings**:
    *   *Key programs installed*: `[e.g., python3, git, curl, zip]`
*   **`/opt` Findings**:
    *   *Third party suites found*: `[e.g., none, aws-cli]`

---

## 📝 Verification Logs

Record your terminal exploration by running:
```bash
../../../../utils/log-task.sh "ls -la /; ls /var/log" "Task 2 Filesystem Audit" "verification.log"
```

👉 **[verification.log](./verification.log)**
