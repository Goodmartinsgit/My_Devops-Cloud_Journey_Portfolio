# 🐧 Sub-Module 1.1: Linux System Administration

This subdirectory contains my solutions, script files, and verification logs for the 12 practical tasks in the **Linux System Administration** chapter. These tasks cover OS exploration, filesystem hierarchy, user privileges, file security, systemd services, shell scripting, log archives, custom shells, disk reporting, log rotation, and systemd automation.

---

## 📋 Task Index & Completion Status

| Task | Objective | Key Tools / Commands | Status | Links |
| :--- | :--- | :--- | :---: | :---: |
| **01** | Install Ubuntu & Explore System Resources | `uname`, `free`, `df`, `nproc`, `uptime` | [x] Completed | [View Folder](./tasks/task-01-explore-system/) |
| **02** | Navigate & Audit the Entire Filesystem | `/etc`, `/var/log`, `/proc`, `/sys` | [x] Completed | [View Folder](./tasks/task-02-filesystem-audit/) |
| **03** | Create DevOps User with Passwordless Sudo | `useradd`, `passwd`, `sudoers.d` | [x] Completed | [View Folder](./tasks/task-03-devops-user/) |
| **04** | Build a DevOps Project Directory Tree | `mkdir -p`, `chown`, `chmod` | [x] Completed | [View Folder](./tasks/task-04-directory-tree/) |
| **05** | Create Secure Secrets File (Permission 600) | `chmod 600`, `chown`, `sudo -u` | [x] Completed | [View Folder](./tasks/task-05-secrets-permission/) |
| **06** | Install & Manage Nginx Systemd Service | `apt`, `systemctl`, `journalctl`, `curl` | [x] Completed | [View Folder](./tasks/task-06-nginx-service/) |
| **07** | Write Script to Create/Delete Files | `seq`, `for loop`, standard redirection | [x] Completed | [View Folder](./tasks/task-07-file-management/) |
| **08** | Find & Archive Recent Log Files | `find`, `-mtime`, `tar -czvf` | [x] Completed | [View Folder](./tasks/task-08-archive-logs/) |
| **09** | Configure Custom PS1 Prompt with Git Branch | `~/.bashrc`, shell function, ANSI colors | [x] Completed | [View Folder](./tasks/task-09-custom-prompt/) |
| **10** | Write Disk Usage Report Script | `df`, `du`, `find`, `sort`, `awk` | [x] Completed | [View Folder](./tasks/task-10-disk-report/) |
| **11** | Configure Logrotate for Custom App Log | `/etc/logrotate.d/myapp`, `logrotate` | [x] Completed | [View Folder](./tasks/task-11-logrotate-custom/) |
| **12** | Custom Systemd Service for Backup Script | `system-backup.service`, `system-backup.timer` | [x] Completed | [View Folder](./tasks/task-12-backup-service/) |

---

## 🚀 How to Run These Tasks

All these tasks were executed on an **Ubuntu 24.04 LTS** server inside a WSL2 environment.

1.  **Helper Script**: To log commands run during the verification steps, run the helper utility:
    ```bash
    ../../utils/log-task.sh "uptime" "Checking uptime for verification" "./tasks/task-01-explore-system/verification.log"
    ```
2.  **Validation**: Read the individual `README.md` files in each task folder to understand the requirements, configuration changes made, and scripts written.

---
[⬅️ Back to Foundations Module](../README.md)
