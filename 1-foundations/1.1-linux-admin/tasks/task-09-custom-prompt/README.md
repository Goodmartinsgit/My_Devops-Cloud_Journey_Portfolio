# Task 9: Configure a Custom PS1 Prompt with Git Branch

## 🎯 Task Objective
Create a custom terminal prompt (`PS1`) showing username, hostname, current directory, and dynamic Git branch recognition. Persist this environment configuration across user shell sessions.

---

## 🛠️ Step-by-Step Implementation

1.  **Read Active Configuration**:
    Check what your current shell prompt is configured to:
    ```bash
    echo $PS1
    ```

2.  **Edit User Bash Resource**:
    Open the shell environment config script (`~/.bashrc`) and append the configuration.
    
    Add this script logic to `~/.bashrc`:
    ```bash
    # --- Custom Prompt Configuration ---

    # Function to get current git branch
    parse_git_branch() {
        git branch 2>/dev/null | sed -n '/\* /s///p'
    }

    # Function to display git branch in prompt (only if in a git repo)
    git_branch_prompt() {
        local branch
        branch=$(parse_git_branch)
        if [ -n "$branch" ]; then
            echo " (\033[33m${branch}\033[0m)"
        fi
    }

    # Set the prompt
    # Colors: 32=green, 34=blue, 31=red, 33=yellow, 36=cyan
    # \[ and \] around color codes tell bash not to count them in line length
    export PS1='\[\033[01;32m\]\u\[\033[00m\]@\[\033[01;36m\]\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]$(git_branch_prompt)\$ '
    ```

3.  **Apply Changes**:
    ```bash
    source ~/.bashrc
    ```

4.  **Harden System-Wide User Setup**:
    Add the configuration block to `/home/devops-user/.bashrc` as well, so it is loaded upon their logins:
    ```bash
    su - devops-user
    # Add block to ~/.bashrc
    source ~/.bashrc
    ```

---

## 📝 Verification Logs

1.  **Test Branch Tracking (Verification Scenario)**:
    ```bash
    mkdir -p /tmp/test-repo
    cd /tmp/test-repo
    git init
    # Verify prompt dynamically changes to: username@hostname:/tmp/test-repo (master)$

    git checkout -b feature/my-feature 2>/dev/null || true
    # Verify prompt updates to: username@hostname:/tmp/test-repo (feature/my-feature)$
    ```

Capture a terminal snapshot and paste or describe it here. Log prompt string to verification:
```bash
echo "Current PS1 config:"
echo $PS1
```

Log command:
```bash
../../../../utils/log-task.sh "echo \$PS1" "Checking custom PS1 environment variable" "verification.log"
```

👉 **[verification.log](./verification.log)**
