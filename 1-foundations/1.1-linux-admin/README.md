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

## 📚 Key Topics Studied
* **OS Exploration & Resource Auditing**: Verifying distribution, checking kernel versions, CPU architecture, RAM allocations, and disk layouts.
* **Filesystem & Permission Audits**: Auditing `/etc`, `/var/log`, `/proc`, `/sys`, creating new users, configuring passwordless sudoers rules, and setting secure file permissions.
* **Service Administration**: Managing systemd services (Nginx), auditing status, logs, and processes with `systemctl` and `journalctl`.
* **Shell Customization & Automation**: Writing bash cron scripts, configuring custom PS1 prompts with Git branch status, custom logrotate configurations, and custom systemd timers.

---

## 🚀 How I Verified These Tasks myself

All 12 tasks were successfully executed and verified by me (**Martins Balogun**) on an **Ubuntu 24.04 LTS** environment running inside **WSL2** (on my Windows host machine `ELDAVED-GLOBAL`).

1.  **Command Logging**: I utilized the custom helper utility `utils/log-task.sh` to capture command executions and append real outputs directly into each task's `verification.log` file:
    ```bash
    ../../utils/log-task.sh "uptime" "Checking uptime for verification" "./tasks/task-01-explore-system/verification.log"
    ```
2.  **Reviewing Solutions**: Navigate to each individual task folder to view the exact scripts, configurations, and verification logs showing my outputs.

---
[⬅️ Back to Foundations Module](../README.md)

