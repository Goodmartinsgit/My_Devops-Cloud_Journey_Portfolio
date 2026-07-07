# Task 1: Install Ubuntu 22.04 and Explore Your System

## Objective

Verify that the server is healthy and document its core resource profile —
OS distribution, kernel version, CPU, RAM, and disk layout — as a baseline
before any software is installed or configured.

<!-- LOG_OUTPUT -->


---

## Verifying OS Distribution and Kernel Version

> **Timestamp:** `2026-06-09 23:39:40`

### 01. `cat /etc/os-release`

```bash
cat /etc/os-release
```

**Output:**

```text
PRETTY_NAME="Ubuntu 24.04.4 LTS"
NAME="Ubuntu"
VERSION_ID="24.04"
VERSION="24.04.4 LTS (Noble Numbat)"
VERSION_CODENAME=noble
ID=ubuntu
ID_LIKE=debian
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
UBUNTU_CODENAME=noble
LOGO=ubuntu-logo
```

### 02. `lsb_release -a`

```bash
lsb_release -a
```

**Output:**

```text
Distributor ID:	Ubuntu
Description:	Ubuntu 24.04.4 LTS
Release:	24.04
Codename:	noble
```

### 03. `uname -a`

```bash
uname -a
```

**Output:**

```text
Linux ELDAVED-GLOBAL 6.6.114.1-microsoft-standard-WSL2 #1 SMP PREEMPT_DYNAMIC Mon Dec  1 20:46:23 UTC 2025 x86_64 x86_64 x86_64 GNU/Linux
```


---

## Auditing System Hardware & Resources

> **Timestamp:** `2026-06-09 23:39:53`

### 01. `free -h`

```bash
free -h
```

**Output:**

```text
               total        used        free      shared  buff/cache   available
Mem:           7.7Gi       602Mi       6.7Gi       4.6Mi       568Mi       7.1Gi
Swap:          2.0Gi          0B       2.0Gi
```

### 02. `df -h`

```bash
df -h
```

**Output:**

```text
Filesystem      Size  Used Avail Use% Mounted on
none            3.9G     0  3.9G   0% /usr/lib/modules/6.6.114.1-microsoft-standard-WSL2
none            3.9G  4.0K  3.9G   1% /mnt/wsl
drivers         477G  242G  235G  51% /usr/lib/wsl/drivers
/dev/sdd       1007G  1.4G  955G   1% /
none            3.9G   36K  3.9G   1% /mnt/wslg
none            3.9G     0  3.9G   0% /usr/lib/wsl/lib
rootfs          3.9G  2.8M  3.9G   1% /init
none            3.9G  512K  3.9G   1% /run
none            3.9G     0  3.9G   0% /run/lock
none            3.9G     0  3.9G   0% /run/shm
none            3.9G   80K  3.9G   1% /mnt/wslg/versions.txt
none            3.9G   80K  3.9G   1% /mnt/wslg/doc
C:\             477G  242G  235G  51% /mnt/c
tmpfs           787M   20K  787M   1% /run/user/1000
```

### 03. `nproc`

```bash
nproc
```

**Output:**

```text
8
```

### 04. `lscpu | grep 'Model name'`

```bash
lscpu | grep 'Model name'
```

**Output:**

```text
Model name:                              Intel(R) Core(TM) i7-7700HQ CPU @ 2.80GHz
```

### 05. `uptime`

```bash
uptime
```

**Output:**

```text
 23:40:01 up  2:07,  1 user,  load average: 3.98, 1.07, 0.36
```


---

## Verifying OS Distribution and Kernel Version

> **Timestamp:** `2026-06-10 23:57:48`

### 01. `cat /etc/os-release`

```bash
cat /etc/os-release
```

**Output:**

```text
NAME="Ubuntu"
VERSION="20.04.6 LTS (Focal Fossa)"
ID=ubuntu
ID_LIKE=debian
PRETTY_NAME="Ubuntu 20.04.6 LTS"
VERSION_ID="20.04"
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
VERSION_CODENAME=focal
UBUNTU_CODENAME=focal
```

### 02. `lsb_release -a`

```bash
lsb_release -a
```

**Output:**

```text
No LSB modules are available.
Distributor ID:	Ubuntu
Description:	Ubuntu 20.04.6 LTS
Release:	20.04
Codename:	focal
```

### 03. `uname -a`

```bash
uname -a
```

**Output:**

```text
Linux ELDAVED-GLOBAL 6.6.114.1-microsoft-standard-WSL2 #1 SMP PREEMPT_DYNAMIC Mon Dec  1 20:46:23 UTC 2025 x86_64 x86_64 x86_64 GNU/Linux
```


---

## Auditing System Hardware & Resources

> **Timestamp:** `2026-06-10 23:57:53`

### 01. `free -h`

```bash
free -h
```

**Output:**

```text
              total        used        free      shared  buff/cache   available
Mem:          7.7Gi       366Mi       6.8Gi       3.0Mi       532Mi       7.2Gi
Swap:         2.0Gi          0B       2.0Gi
```

### 02. `df -h`

```bash
df -h
```

**Output:**

```text
Filesystem      Size  Used Avail Use% Mounted on
none            3.9G     0  3.9G   0% /usr/lib/modules/6.6.114.1-microsoft-standard-WSL2
none            3.9G  4.0K  3.9G   1% /mnt/wsl
drivers         477G  245G  233G  52% /usr/lib/wsl/drivers
/dev/sdd       1007G  3.4G  953G   1% /
none            3.9G   32K  3.9G   1% /mnt/wslg
none            3.9G     0  3.9G   0% /usr/lib/wsl/lib
rootfs          3.9G  2.8M  3.9G   1% /init
none            3.9G     0  3.9G   0% /dev
none            3.9G  852K  3.9G   1% /run
none            3.9G     0  3.9G   0% /run/lock
none            3.9G     0  3.9G   0% /run/shm
none            3.9G   80K  3.9G   1% /mnt/wslg/versions.txt
none            3.9G   80K  3.9G   1% /mnt/wslg/doc
C:\             477G  245G  233G  52% /mnt/c
snapfuse         64M   64M     0 100% /snap/core20/2769
snapfuse         64M   64M     0 100% /snap/core20/2866
snapfuse         92M   92M     0 100% /snap/lxd/38333
snapfuse         92M   92M     0 100% /snap/lxd/38688
snapfuse         49M   49M     0 100% /snap/snapd/26382
snapfuse         50M   50M     0 100% /snap/snapd/26865
tmpfs           787M  4.0K  787M   1% /run/user/1000
```

### 03. `nproc`

```bash
nproc
```

**Output:**

```text
8
```

### 04. `lscpu | grep 'Model name'`

```bash
lscpu | grep 'Model name'
```

**Output:**

```text
Model name:                              Intel(R) Core(TM) i7-7700HQ CPU @ 2.80GHz
```

### 05. `uptime`

```bash
uptime
```

**Output:**

```text
 23:57:58 up 5 min,  1 user,  load average: 0.17, 0.22, 0.13
```


---

## Verifying OS Distribution and Kernel Version

> **Timestamp:** `2026-06-10 23:57:58`

### 01. `cat /etc/os-release`

```bash
cat /etc/os-release
```

**Output:**

```text
NAME="Ubuntu"
VERSION="20.04.6 LTS (Focal Fossa)"
ID=ubuntu
ID_LIKE=debian
PRETTY_NAME="Ubuntu 20.04.6 LTS"
VERSION_ID="20.04"
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
VERSION_CODENAME=focal
UBUNTU_CODENAME=focal
```

### 02. `lsb_release -a`

```bash
lsb_release -a
```

**Output:**

```text
No LSB modules are available.
Distributor ID:	Ubuntu
Description:	Ubuntu 20.04.6 LTS
Release:	20.04
Codename:	focal
```

### 03. `uname -a`

```bash
uname -a
```

**Output:**

```text
Linux ELDAVED-GLOBAL 6.6.114.1-microsoft-standard-WSL2 #1 SMP PREEMPT_DYNAMIC Mon Dec  1 20:46:23 UTC 2025 x86_64 x86_64 x86_64 GNU/Linux
```


---

## Auditing System Hardware & Resources

> **Timestamp:** `2026-06-10 23:58:02`

### 01. `free -h`

```bash
free -h
```

**Output:**

```text
              total        used        free      shared  buff/cache   available
Mem:          7.7Gi       363Mi       6.8Gi       3.0Mi       533Mi       7.2Gi
Swap:         2.0Gi          0B       2.0Gi
```

### 02. `df -h`

```bash
df -h
```

**Output:**

```text
Filesystem      Size  Used Avail Use% Mounted on
none            3.9G     0  3.9G   0% /usr/lib/modules/6.6.114.1-microsoft-standard-WSL2
none            3.9G  4.0K  3.9G   1% /mnt/wsl
drivers         477G  245G  233G  52% /usr/lib/wsl/drivers
/dev/sdd       1007G  3.4G  953G   1% /
none            3.9G   32K  3.9G   1% /mnt/wslg
none            3.9G     0  3.9G   0% /usr/lib/wsl/lib
rootfs          3.9G  2.8M  3.9G   1% /init
none            3.9G     0  3.9G   0% /dev
none            3.9G  852K  3.9G   1% /run
none            3.9G     0  3.9G   0% /run/lock
none            3.9G     0  3.9G   0% /run/shm
none            3.9G   80K  3.9G   1% /mnt/wslg/versions.txt
none            3.9G   80K  3.9G   1% /mnt/wslg/doc
C:\             477G  245G  233G  52% /mnt/c
snapfuse         64M   64M     0 100% /snap/core20/2769
snapfuse         64M   64M     0 100% /snap/core20/2866
snapfuse         92M   92M     0 100% /snap/lxd/38333
snapfuse         92M   92M     0 100% /snap/lxd/38688
snapfuse         49M   49M     0 100% /snap/snapd/26382
snapfuse         50M   50M     0 100% /snap/snapd/26865
tmpfs           787M  4.0K  787M   1% /run/user/1000
```

### 03. `nproc`

```bash
nproc
```

**Output:**

```text
8
```

### 04. `lscpu | grep 'Model name'`

```bash
lscpu | grep 'Model name'
```

**Output:**

```text
Model name:                              Intel(R) Core(TM) i7-7700HQ CPU @ 2.80GHz
```

### 05. `uptime`

```bash
uptime
```

**Output:**

```text
 23:58:07 up 5 min,  1 user,  load average: 0.30, 0.25, 0.14
```

