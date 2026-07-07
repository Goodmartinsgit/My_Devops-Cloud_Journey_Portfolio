#  Sub-Module 1.1: Linux System Administration

This subdirectory contains my solutions, script files, and verification logs for the 12 practical tasks in the **Linux System Administration** chapter. These tasks cover OS exploration, filesystem hierarchy, user privileges, file security, systemd services, shell scripting, log archives, custom shells, disk reporting, log rotation, and systemd automation.

---

##  Task Index & Completion Status

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

##  Packages Installed

The table below lists every package explicitly installed via `apt` during the completion of these tasks, followed by the key built-in system tools that were central to the work.

> [!NOTE]
> Ubuntu 24.04 LTS ships with a rich base of sysadmin utilities. Only **one package** — `nginx` — required an explicit `apt install` across all 12 tasks. All other tools (`git`, `tar`, `awk`, `logrotate`, `systemd`, etc.) are bundled with the distribution and required no separate installation.

---

### 1. `nginx` — High-Performance Web Server

```bash
sudo apt install -y nginx
```

**What it does:** Nginx is an event-driven, non-blocking HTTP server and reverse proxy. It handles static file serving, load balancing, and TLS termination. On Ubuntu, installing it automatically creates and enables a systemd service unit (`nginx.service`).

**Why installed:** Required in **Task 6** (Install & Manage Nginx Systemd Service) to practise the full lifecycle of systemd service management — install, start, stop, reload, restart, enable on boot — and to validate HTTP responses with `curl http://localhost`.

---

##  Built-in System Tools Used

These tools are pre-installed on Ubuntu 24.04 and required no explicit installation. They were nonetheless central to completing the tasks and are documented here for full transparency.

---

### `git` — Version Control System

**Tasks used in:** Task 9 (Custom PS1 Prompt with Git Branch)

**What it does:** A distributed version control system. The `git branch` command was used inside a custom `parse_git_branch()` shell function embedded in `~/.bashrc` to dynamically display the active branch name in the terminal prompt.

**Why relevant:** The custom PS1 prompt required `git` to be available in `$PATH` to call `git branch 2>/dev/null` and extract the current branch via `sed`. The task confirmed the prompt works correctly inside an initialised git repository.

---

### `tar` — Tape Archive Utility

**Tasks used in:** Task 8 (Find & Archive Recent Log Files), Task 12 (Custom Systemd Backup Service)

**What it does:** Creates and extracts compressed archive files. The flags `tar -czvf` create a gzip-compressed tarball from a list of files; `tar -tzvf` lists the contents without extracting.

**Why relevant:** Task 8 used `find` to locate log files modified in the last 7 days and piped them into `tar -czvf` to produce a timestamped archive. Task 12's `system-backup.sh` script used `tar` to archive `/etc` and the project scripts directory into `/projects/devops/backups/`.

---

### `find` — Filesystem Search Utility

**Tasks used in:** Task 8 (Archive Logs), Task 10 (Disk Usage Report)

**What it does:** Traverses directory trees and locates files matching criteria such as modification time (`-mtime`), file type (`-type f`), size (`-size`), and name patterns (`-name`).

**Why relevant:** Task 8 used `find /var/log -mtime -7 -type f` to locate recently modified log files for archiving. Task 10's disk report script used `find` to identify the top 10 largest files on the filesystem by size.

---

### `awk` — Text Processing Language

**Tasks used in:** Task 10 (Disk Usage Report Script)

**What it does:** A pattern-scanning and text-processing tool. It processes structured columnar output line by line, applying field extraction, arithmetic, and formatted printing.

**Why relevant:** The disk report script used `awk '{print $1, $6}'` to extract filesystem usage and mount point columns from `df -h` output, and `awk '{print $5, $1}'` patterns to isolate usage percentages for reporting.

---

### `df` & `du` — Disk Usage Utilities

**Tasks used in:** Task 1 (System Exploration), Task 10 (Disk Usage Report)

**What they do:** `df -h` reports filesystem-level disk usage (total, used, available per mount point). `du -sh` summarises disk usage per directory subtree in a human-readable format.

**Why relevant:** Task 1 used `df -h` as part of the initial system baseline audit. Task 10's `disk-report.sh` script combined both `df` and `du` outputs into a structured HTML/text report showing which filesystems and directories consume the most space.

---

### `useradd` / `passwd` / `usermod` — User Account Management

**Tasks used in:** Task 3 (Create DevOps User with Passwordless Sudo)

**What they do:** `useradd` creates new user accounts; `passwd` sets or changes passwords; `usermod` modifies existing account attributes (e.g., adding a user to a group with `-aG`).

**Why relevant:** Task 3 created the `devops-user` system account with a home directory, set a password, and added it to the `sudo` group. A custom sudoers rule was written to `/etc/sudoers.d/devops-user` granting passwordless sudo privileges.

---

### `chmod` / `chown` — File Permission Tools

**Tasks used in:** Tasks 3, 4, 5

**What they do:** `chmod` changes file or directory permission bits (read/write/execute for owner, group, others). `chown` changes the owning user and group of a file or directory.

**Why relevant:** Task 4 set ownership of the project directory tree to `devops-user:devops-user` using `chown -R`. Task 5 created a secrets file and locked it down to owner-only read/write (`chmod 600`) to prevent any other user from reading credentials.

---

### `systemctl` / `journalctl` — Systemd Service Management

**Tasks used in:** Tasks 6, 12

**What they do:** `systemctl` controls the systemd init system — starting, stopping, enabling, disabling, and querying service units. `journalctl` queries the systemd journal log for service output, errors, and timestamps.

**Why relevant:** Task 6 used both to manage the nginx service lifecycle (start/stop/reload/restart/enable). Task 12 used `systemctl daemon-reload`, `enable`, `start`, and `list-timers` to register and activate the `system-backup.service` and `system-backup.timer` units, and `journalctl -u system-backup` to verify execution.

---

### `logrotate` — Log Rotation Manager

**Tasks used in:** Task 11 (Configure Logrotate for Custom App Log)

**What it does:** Automatically rotates, compresses, deletes, and mails application log files based on a policy defined in `/etc/logrotate.d/`. Policies control rotation frequency (`daily`, `weekly`), the number of archives to retain (`rotate 14`), compression (`compress`, `delaycompress`), and post-rotation scripts.

**Why relevant:** Task 11 wrote a custom policy to `/etc/logrotate.d/myapp`, then used `logrotate --debug` to test it in dry-run mode and `logrotate --force` to trigger an actual rotation, verifying that `app.log.1` was produced.

---

##  How I Verified These Tasks

All 12 tasks were successfully executed and verified by me (**Martins Balogun**) on an **Ubuntu 24.04 LTS** environment running inside **WSL2** (on my Windows host machine `ELDAVED-GLOBAL`).

1.  **Command Logging**: I utilized the custom helper utility `utils/log-task.sh` to capture command executions and append real outputs directly into each task's `verification.log` file:
    ```bash
    ../../utils/log-task.sh "uptime" "Checking uptime for verification" "./tasks/task-01-explore-system/verification.log"
    ```
2.  **Reviewing Solutions**: Navigate to each individual task folder to view the exact scripts, configurations, and verification logs showing my outputs.

---

## Key Topics Studied
* **OS Exploration & Resource Auditing**: Verifying distribution, checking kernel versions, CPU architecture, RAM allocations, and disk layouts.
* **Filesystem & Permission Audits**: Auditing `/etc`, `/var/log`, `/proc`, `/sys`, creating new users, configuring passwordless sudoers rules, and setting secure file permissions.
* **Service Administration**: Managing systemd services (Nginx), auditing status, logs, and processes with `systemctl` and `journalctl`.
* **Shell Customization & Automation**: Writing bash cron scripts, configuring custom PS1 prompts with Git branch status, custom logrotate configurations, and custom systemd timers.

---

[ Back to Foundations Module](../README.md)

