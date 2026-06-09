# Task 4: Build a DevOps Project Directory Tree

## 🎯 Task Objective
Create a structured project space in `/projects/devops` with specific directory ownership and access restrictions for operational roles.

---

## 🛠️ Step-by-Step Implementation

1.  **Directory Architecture Creation**:
    ```bash
    sudo mkdir -p /projects/devops/{scripts,logs,configs,backups}
    ```

2.  **Verify Directory Skeleton**:
    ```bash
    find /projects/devops -type d
    # Or tree:
    tree /projects/devops
    ```

3.  **Adjust Ownership & Permissions**:
    Assign ownership to the `devops-user` user and group:
    ```bash
    sudo chown -R devops-user:devops-user /projects/devops
    sudo chmod 755 /projects/devops
    ```

4.  **Set Restrictive Subdirectory Permissions**:
    ```bash
    sudo chmod 700 /projects/devops/configs    # Only owner can read/write configs
    sudo chmod 775 /projects/devops/scripts    # Group-wide execution access
    ```

5.  **Populate Skeleton files**:
    ```bash
    touch /projects/devops/scripts/deploy.sh
    touch /projects/devops/logs/app.log
    touch /projects/devops/configs/app.conf
    touch /projects/devops/backups/.gitkeep
    ```

---

## 📝 Verification Logs

Confirm the directory structure permissions and ownership match the target configuration:
```bash
ls -la /projects/devops/
```

Run log utility:
```bash
../../../../utils/log-task.sh "ls -la /projects/devops/" "Directory permissions verification" "verification.log"
```

👉 **[verification.log](./verification.log)**
