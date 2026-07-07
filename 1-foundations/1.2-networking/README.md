#  Sub-Module 1.2: Networking Fundamentals

This subdirectory stores configurations, diagnostic reports, packet captures, firewall rule sets, and verification logs for all networking-focused tasks. These tasks validate foundational knowledge in routing, DNS resolution, packet analysis, SSH hardening, firewall management, and encrypted tunnelling — the bread-and-butter skill set for any DevOps or cloud engineer diagnosing real infrastructure.

All tasks were completed by **Martins Balogun** on an **Ubuntu 24.04 LTS** environment running inside **WSL2** on host machine `ELDAVED-GLOBAL`.

---

##  Task Checklist & Progress

| # | Task | Key Tools / Commands | Status | Folder |
| :-- | :-- | :-- | :---: | :---: |
| **01** | Document Your Machine's Full Network Configuration | `ip addr`, `ip route`, `ip link` | ✔ Completed | [View](./tasks/task-01-document-your-machines-full-network-configuration/) |
| **02** | Subnet a /24 Network into 4 Equal Subnets | Manual binary math, CIDR | ✔ Completed | [View](./tasks/task-02-subnet-a-24-network-into-4-equal-subnets/) |
| **03** | Query DNS Records for Three Domains | `dig`, `nslookup` | ✔ Completed | [View](./tasks/task-03-query-dns-records-for-three-domains/) |
| **04** | SSH Key-based Authentication Migration | `ssh-keygen`, `sshd_config`, `ssh` | ✔ Completed | [View](./tasks/task-04-ssh-server-key-based-authentication-migration/) |
| **05** | Set Up UFW — Allow SSH, HTTP, HTTPS | `ufw`, `nc` | ✔ Completed | [View](./tasks/task-05-set-up-ufw-allow-ssh-http/) |
| **06** | Trace a Full HTTPS Request with curl | `curl -v`, TLS inspection | ✔ Completed | [View](./tasks/task-06-trace-a-full-https-request-with-curl/) |
| **07** | Use tcpdump to Capture HTTP Traffic | `tcpdump`, `pcap` | ✔ Completed | [View](./tasks/task-07-use-tcpdump-to-capture-http-traffic/) |
| **08** | Use nmap to Scan Your Server | `nmap`, `-sV`, `-p-` | ✔ Completed | [View](./tasks/task-08-use-nmap-to-scan-your-server/) |
| **09** | Set Up an SSH Jump Host Config | `ProxyJump`, `~/.ssh/config`, `sshd` | ✔ Completed | [View](./tasks/task-09-set-up-an-ssh-jump-host/) |
| **10** | Configure iptables to Block a Specific IP | `iptables -A`, `-D`, `ping` | ✔ Completed | [View](./tasks/task-10-configure-iptables-to-block-a-specific/) |
| **11** | Use mtr to Diagnose a Network Path | `mtr -r`, `--report-wide` | ✔ Completed | [View](./tasks/task-11-use-mtr-to-diagnose-a-network/) |
| **12** | Set Up WireGuard VPN Between Two Servers | `wireguard`, `wg-quick`, `tcpdump` | ✔ Completed | [View](./tasks/task-12-set-up-wireguard-vpn-between-two/) |

---

##  Packages Installed

All packages below were installed during the completion of tasks in this sub-module. Each entry includes the exact install command used, a brief description of what the package does, and the task it was required for.

> [!NOTE]
> Some packages were already present in the Ubuntu 24.04 environment and were confirmed with `apt install` (which outputs "already the newest version"). They are still listed below as they form part of the task's documented setup.

---

### 1. `openssh-server` — SSH Server Daemon

```bash
sudo apt install openssh-server -y
```

**What it does:** Installs the OpenSSH server daemon (`sshd`), which allows the machine to accept inbound SSH connections. It manages host keys, authentication methods (password and public key), and the listening port (default: 22).

**Why installed:** Required in **Task 4** (SSH key-based auth migration) to run a local SSH server on WSL2, and again in **Task 9** (SSH jump host) to spin up a second `sshd` instance on port 2222 that simulated a private server behind a bastion.

---

### 2. `ufw` — Uncomplicated Firewall

```bash
sudo apt install ufw -y
```

**What it does:** A frontend to `iptables` that simplifies firewall rule management. It provides human-readable commands to allow or deny traffic on specific ports and protocols, and persists rules across reboots.

**Why installed:** Required in **Task 5** to configure a host firewall that allows only SSH (22), HTTP (80), and HTTPS (443) while denying everything else. The firewall state was then verified using `nmap` in **Task 8**.

---

### 3. `tcpdump` — Command-line Packet Analyser

```bash
sudo apt install tcpdump -y
```

**What it does:** A network packet capture tool that inspects live traffic on a specified network interface. It can filter by protocol, port, or host, and output packets in human-readable or binary (`.pcap`) format for offline analysis.

**Why installed:** Required in **Task 7** to capture raw HTTP traffic on port 80 in real time while a `curl` request was made, and again in **Task 12** to attempt capture of WireGuard's encrypted UDP packets on the loopback interface.

---

### 4. `nmap` — Network Mapper / Port Scanner

```bash
sudo apt install nmap -y
```

**What it does:** A network scanning tool that discovers open ports, running services, OS fingerprinting, and version detection on a target host. It supports a range of scan types from basic TCP connects to stealthy SYN scans.

**Why installed:** Required in **Task 8** to scan localhost and identify all open ports and the services running on them (SSH on 22, nginx on 80). Cross-referenced against the UFW rules set in **Task 5** to confirm port 443 and 8080 were correctly closed.

---

### 5. `mtr` — My Traceroute (Network Diagnostic)

```bash
sudo apt install mtr -y
```

**What it does:** Combines the functionality of `traceroute` and `ping` into a single diagnostic tool. It sends packets to each hop along a network path and continuously measures round-trip latency and packet loss at each hop, making it far more useful than a one-shot traceroute for diagnosing intermittent issues.

**Why installed:** Required in **Task 11** to run a per-hop packet loss and latency report to both `8.8.8.8` and `google.com`, identifying hops with 100% loss (ICMP-filtered internal routers) versus genuine packet drop.

---

### 6. `wireguard` — WireGuard VPN Kernel Module & Tools

```bash
sudo apt install wireguard -y
```

**What it does:** Installs the WireGuard kernel module and the `wg` / `wg-quick` userspace utilities. WireGuard is a modern, high-performance VPN protocol built directly into the Linux kernel (5.6+). It uses Curve25519 for key exchange, ChaCha20-Poly1305 for encryption, and creates encrypted point-to-point tunnels between peers using UDP.

**Why installed:** Required in **Task 12** to set up a simulated two-peer WireGuard VPN tunnel (`wg0` ↔ `wg1`) entirely on localhost, generate key pairs, configure peer endpoints, bring up both interfaces with `wg-quick`, verify the tunnel with a cross-peer `ping`, and confirm encrypted traffic via `tcpdump`.

---

##  Key Topics Studied

* **Network Layers**: OSI 7-Layer Model vs. TCP/IP 4-Layer Model.
* **IP Protocol Suite**: IPv4 subnet architecture, CIDR notation, private address blocks (RFC 1918), and IPv6 addressing.
* **DNS Resolution**: Recursive vs. authoritative resolvers; querying A, MX, TXT, and NS records with `dig` and `nslookup`.
* **SSH Hardening**: Key generation (ED25519), authorized_keys configuration, disabling password auth, `ProxyJump` bastion access patterns.
* **Firewall Management**: UFW for application-layer rules; raw `iptables` for per-IP blocking at the kernel level.
* **Packet Analysis**: Live capture with `tcpdump`; port and service enumeration with `nmap`.
* **Network Diagnostics**: Per-hop loss/latency diagnosis with `mtr`; HTTP timing breakdown with `curl`.
* **Encrypted Tunnelling**: WireGuard VPN key exchange, peer configuration, and verifying encrypted traffic.

---

[ Back to Foundations Module](../README.md)
