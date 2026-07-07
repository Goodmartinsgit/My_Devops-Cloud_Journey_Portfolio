# Task 10: Write a Disk Usage Report Script

## Objective

Build an administrative disk reporting script that compiles partition details, largest folders, massive logs, and inode consumption, keeping only the 7 most recent logs.

<!-- LOG_OUTPUT -->


---

## Making disk-report.sh executable and running it

> **Timestamp:** `2026-06-16 08:42:04`

### 01. `sudo chmod +x /projects/devops/scripts/disk-report.sh`

```bash
sudo chmod +x /projects/devops/scripts/disk-report.sh
```

**Output:**

```text
```

### 02. `sudo /projects/devops/scripts/disk-report.sh`

```bash
sudo /projects/devops/scripts/disk-report.sh
```

**Output:**

```text
Disk report saved to: /projects/devops/logs/disk-report-20260616_084206.log
==========================================
DISK USAGE REPORT
Generated: Tue Jun 16 08:42:06 WAT 2026
Server: ELDAVED-GLOBAL
==========================================

--- FILESYSTEM OVERVIEW ---
Filesystem     Type     Size  Used Avail Use% Mounted on
none           overlay  3.9G     0  3.9G   0% /usr/lib/modules/6.18.33.1-microsoft-standard-WSL2
drivers        9p       477G  249G  228G  53% /usr/lib/wsl/drivers
/dev/sdf       ext4    1007G  1.8G  954G   1% /
none           overlay  3.9G     0  3.9G   0% /usr/lib/wsl/lib
rootfs         rootfs   3.9G  2.8M  3.9G   1% /init
none           overlay  3.9G   80K  3.9G   1% /mnt/wslg/versions.txt
none           overlay  3.9G   80K  3.9G   1% /mnt/wslg/doc
C:\            9p       477G  249G  228G  53% /mnt/c

--- TOP 10 DIRECTORIES BY SIZE (excluding /mnt /proc /sys) ---
5.5G	/usr
669M	/var
4.4M	/etc
2.8M	/init
540K	/run
192K	/tmp
156K	/projects
116K	/home
44K	/root
16K	/lost+found

--- TOP 10 LARGEST FILES IN /var ---
70.0 MB	/var/lib/apt/lists/archive.ubuntu.com_ubuntu_dists_noble_universe_binary-amd64_Packages
52.8 MB	/var/cache/apt/pkgcache.bin
52.8 MB	/var/cache/apt/srcpkgcache.bin
33.0 MB	/var/cache/apt/archives/snapd_2.73+ubuntu24.04.2_amd64.deb
30.7 MB	/var/lib/apt/lists/archive.ubuntu.com_ubuntu_dists_noble_universe_i18n_Translation-en
29.2 MB	/var/cache/apt/archives/libllvm20_1%3a20.1.2-0ubuntu1~24.04.3_amd64.deb
16.7 MB	/var/cache/apt/archives/mesa-vulkan-drivers_25.2.8-0ubuntu0.24.04.2_amd64.deb
10.3 MB	/var/cache/apt/archives/mesa-libgallium_25.2.8-0ubuntu0.24.04.2_amd64.deb
9.9 MB	/var/lib/apt/lists/archive.ubuntu.com_ubuntu_dists_noble-updates_universe_binary-amd64_Packages
8.0 MB	/var/log/journal/bfaa50f45e2346f4a19d968db4fef51a/user-1001@4ca277b838514f4a943842b0f919134b-0000000000001aba-000653f886f9a142.journal

--- LOG DIRECTORY SIZES ---
196M	/var/log/journal
992K	/var/log/syslog
364K	/var/log/dpkg.log
292K	/var/log/kern.log
116K	/var/log/dmesg
116K	/var/log/bootstrap.log
68K	/var/log/auth.log
56K	/var/log/wtmp
56K	/var/log/apt
48K	/var/log/dmesg.0
28K	/var/log/dmesg.1.gz
20K	/var/log/alternatives.log
12K	/var/log/unattended-upgrades
12K	/var/log/nginx
12K	/var/log/dmesg.4.gz

--- INODE USAGE ---
Filesystem     Inodes IUsed IFree IUse% Mounted on
none             984K     5  984K    1% /usr/lib/modules/6.18.33.1-microsoft-standard-WSL2
none             984K    11  984K    1% /mnt/wsl
drivers           999 -976K  977K     - /usr/lib/wsl/drivers
/dev/sdf          64M   49K   64M    1% /
none             984K    23  984K    1% /mnt/wslg
none             984K     6  984K    1% /usr/lib/wsl/lib
rootfs           982K    12  982K    1% /init
none             984K   583  983K    1% /run
none             984K     2  984K    1% /run/lock
none             984K     1  984K    1% /run/shm
none             984K    53  984K    1% /mnt/wslg/versions.txt
none             984K    53  984K    1% /mnt/wslg/doc
C:\               999 -976K  977K     - /mnt/c

--- DISK HEALTH SUMMARY ---
Disk: /dev/sda
  Size: 356.9M
Disk: /dev/sdb
  Size: 159.5M
Disk: /dev/sdc
  Size:   2G
Disk: /dev/sdd
  Size: 143.8M
Disk: /dev/sde
  Size:   1T
Disk: /dev/sdf
  Size:   1T

Report complete.
Old reports cleaned up. Current reports: 2
```


---

## Verifying disk report output and log file

> **Timestamp:** `2026-06-16 08:43:23`

### 01. `ls -la /projects/devops/logs/disk-report-*.log`

```bash
ls -la /projects/devops/logs/disk-report-*.log
```

**Output:**

```text
-rw-r--r-- 1 root root  802 Jun 16 08:25 /projects/devops/logs/disk-report-20260616_082553.log
-rw-r--r-- 1 root root 3173 Jun 16 08:42 /projects/devops/logs/disk-report-20260616_084206.log
```

### 02. `sudo cat /projects/devops/logs/disk-report-*.log | head -30`

```bash
sudo cat /projects/devops/logs/disk-report-*.log | head -30
```

**Output:**

```text
==========================================
DISK USAGE REPORT
Generated: Tue Jun 16 08:25:53 WAT 2026
Server: ELDAVED-GLOBAL
==========================================

--- FILESYSTEM OVERVIEW ---
Filesystem     Type     Size  Used Avail Use% Mounted on
none           overlay  3.9G     0  3.9G   0% /usr/lib/modules/6.18.33.1-microsoft-standard-WSL2
drivers        9p       477G  249G  228G  53% /usr/lib/wsl/drivers
/dev/sdf       ext4    1007G  1.8G  954G   1% /
none           overlay  3.9G     0  3.9G   0% /usr/lib/wsl/lib
rootfs         rootfs   3.9G  2.8M  3.9G   1% /init
none           overlay  3.9G   80K  3.9G   1% /mnt/wslg/versions.txt
none           overlay  3.9G   80K  3.9G   1% /mnt/wslg/doc
C:\            9p       477G  249G  228G  53% /mnt/c

--- TOP 10 DIRECTORIES BY SIZE (/) ---
==========================================
DISK USAGE REPORT
Generated: Tue Jun 16 08:42:06 WAT 2026
Server: ELDAVED-GLOBAL
==========================================

--- FILESYSTEM OVERVIEW ---
Filesystem     Type     Size  Used Avail Use% Mounted on
none           overlay  3.9G     0  3.9G   0% /usr/lib/modules/6.18.33.1-microsoft-standard-WSL2
drivers        9p       477G  249G  228G  53% /usr/lib/wsl/drivers
/dev/sdf       ext4    1007G  1.8G  954G   1% /
none           overlay  3.9G     0  3.9G   0% /usr/lib/wsl/lib
```

