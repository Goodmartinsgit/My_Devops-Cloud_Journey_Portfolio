# Task 1: Install Ubuntu 22.04 and Explore Your System

## 🎯 Task Objective
Verify that the server is healthy, understand its basic resource limits (CPU cores, RAM size, disk space layout), check the running kernel version, and confirm the OS distribution is Ubuntu 22.04 LTS (Jammy Jellyfish).

---

## 🛠️ Step-by-Step Implementation

1.  **OS Identification**:
    Verify the OS name, release version, and codename:
    ```bash
    cat /etc/os-release
    lsb_release -a
    uname -a
    ```

2.  **Resource Allocation Analysis**:
    Check the total and free RAM, disk partition sizes, CPU core count, and CPU model:
    ```bash
    free -h
    df -h
    nproc
    lscpu | grep "Model name"
    ```

3.  **System Uptime**:
    Check how long the system has been running since boot:
    ```bash
    uptime
    ```

---

## 📝 Verification Logs

Record your server's details here or run:
```bash
../../../../utils/log-task.sh "cat /etc/os-release; free -h; df -h; nproc; uptime" "Task 1 verification outputs" "verification.log"
```

Once logged, you can view the execution results in the sibling file:
👉 **[verification.log](./verification.log)**

### 📊 Captured System Specifications Summary:
*   **Operating System**: Ubuntu 22.04 LTS (Jammy Jellyfish)
*   **Kernel Version**: `[Fill in, e.g., 5.15.0-x-generic]`
*   **CPU Cores**: `[Fill in CPU cores, e.g., 2 cores]`
*   **CPU Model**: `[Fill in CPU Model Name]`
*   **Total RAM**: `[Fill in RAM size, e.g., 4.0 GiB]`
*   **Root Disk Size**: `[Fill in disk space, e.g., 40 GB]`
