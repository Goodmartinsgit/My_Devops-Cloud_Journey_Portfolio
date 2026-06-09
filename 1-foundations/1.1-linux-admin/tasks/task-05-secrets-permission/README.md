# Task 5: Create a Secrets File with Permission 600

## 🎯 Task Objective
Store sensitive credentials in a configurations file and lock it down so only the owner has read/write privileges (`-rw-------`). Test and verify that other users cannot access it.

---

## 🛠️ Step-by-Step Implementation

1.  **Directory Setup & Creation**:
    ```bash
    mkdir -p /projects/devops/secrets
    touch /projects/devops/secrets/db-credentials.conf
    ```

2.  **Add Sensitive Content**:
    Populate `/projects/devops/secrets/db-credentials.conf`:
    ```bash
    cat > /projects/devops/secrets/db-credentials.conf << 'EOF'
    DB_HOST=localhost
    DB_NAME=production
    DB_USER=appuser
    DB_PASSWORD=supersecretpassword123
    EOF
    ```

3.  **Harden Permissions**:
    ```bash
    chmod 600 /projects/devops/secrets/db-credentials.conf
    chown devops-user:devops-user /projects/devops/secrets/db-credentials.conf
    ```

---

## 📝 Verification Logs

1.  **Check Permissions Layout**:
    ```bash
    ls -la /projects/devops/secrets/db-credentials.conf
    # Expected: -rw------- 1 devops-user devops-user ... db-credentials.conf
    ```

2.  **Test Owner Read Privilege**:
    ```bash
    # As devops-user:
    cat /projects/devops/secrets/db-credentials.conf
    # Expected: Prints content successfully
    ```

3.  **Test Other User Access Restriction**:
    ```bash
    # As www-data user (web server runner):
    sudo -u www-data cat /projects/devops/secrets/db-credentials.conf
    # Expected: cat: /projects/devops/secrets/db-credentials.conf: Permission denied
    ```

Log the permission matrix:
```bash
../../../../utils/log-task.sh "ls -la /projects/devops/secrets/db-credentials.conf; sudo -u www-data cat /projects/devops/secrets/db-credentials.conf 2>&1" "Testing secrets isolation" "verification.log"
```

👉 **[verification.log](./verification.log)**
