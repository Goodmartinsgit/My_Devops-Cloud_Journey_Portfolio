# Task 6: Install and Manage Nginx as a Systemd Service

## 🎯 Task Objective
Install the Nginx web server packages, understand systemd lifecycle actions (start, stop, reload, restart, enable), inspect journals, and verify connection.

---

## 🛠️ Step-by-Step Implementation

1.  **Installation**:
    ```bash
    sudo apt update
    sudo apt install -y nginx
    ```

2.  **Service Diagnostics**:
    ```bash
    sudo systemctl status nginx
    ```

3.  **Perform Lifecycle Operations**:
    ```bash
    sudo systemctl stop nginx
    sudo systemctl status nginx      # Confirm active state changed to inactive (dead)

    sudo systemctl start nginx
    sudo systemctl status nginx      # Confirm active (running)

    sudo systemctl reload nginx      # Soft-reload configuration (no client disruption)
    sudo systemctl restart nginx     # Hard-restart process
    ```

4.  **Boot Behavior Configuration**:
    Ensure the web server automatically starts when the system boots:
    ```bash
    sudo systemctl enable nginx
    sudo systemctl is-enabled nginx  # Expected: enabled
    ```

5.  **Log Auditing**:
    Audit logs for the service:
    ```bash
    sudo journalctl -u nginx -n 50
    ```

6.  **Configuration Syntax Check**:
    ```bash
    sudo nginx -t
    # Expected: syntax is ok, test is successful
    ```

---

## 📝 Verification Logs

Record your web server connection output:
```bash
curl -I http://localhost
```

Log it:
```bash
../../../../utils/log-task.sh "sudo systemctl status nginx; curl -I http://localhost" "Nginx Status & Connection Test" "verification.log"
```

👉 **[verification.log](./verification.log)**
