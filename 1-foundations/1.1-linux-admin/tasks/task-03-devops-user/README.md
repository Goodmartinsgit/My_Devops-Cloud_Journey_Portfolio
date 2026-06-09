# Task 3: Create a DevOps User with Passwordless Sudo

## 🎯 Task Objective
Create a dedicated `devops-user` administrative account, grant it passwordless sudo permissions via `etc/sudoers.d/`, and verify that it can perform root privileges without prompt.

---

## 🛠️ Step-by-Step Implementation

1.  **Create User & Assign Password**:
    ```bash
    sudo useradd -m -s /bin/bash -c "DevOps User" devops-user
    sudo passwd devops-user
    # Enter a secure password
    ```

2.  **Assign Groups**:
    Add `devops-user` to the `sudo` group:
    ```bash
    sudo usermod -aG sudo devops-user
    ```

3.  **Configure Passwordless Sudo Privilege**:
    Place a file in the `/etc/sudoers.d/` directory:
    ```bash
    echo "devops-user ALL=(ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/devops-user
    sudo chmod 440 /etc/sudoers.d/devops-user
    ```

4.  **Verification Steps**:
    Test sudo behavior:
    ```bash
    # Switch shell to devops-user
    su - devops-user

    # Attempt administrative actions without inputting password
    sudo whoami       # Expected Output: root (without prompting for password)
    sudo apt update   # Verification of package manager access
    id                # Shows active groups (sudo group should be present)
    ```

---

## 📝 Verification Logs

Run verification commands and log them:
```bash
# Verify user configuration in system database
grep devops-user /etc/passwd
id devops-user
groups devops-user
```

Append logs with:
```bash
../../../../utils/log-task.sh "grep devops-user /etc/passwd; id devops-user" "Verifying user creation" "verification.log"
```

👉 **[verification.log](./verification.log)**
