# 🌐 Sub-Module 1.2: Networking Fundamentals

This subdirectory will store configurations, diagnostic reports, and logs for networking-focused tasks, validating foundational routing, DNS, and server connection concepts.

---

## 📋 Task Checklist & Progress

- [x] **Task 1: Document Your Machine's Full Network Configuration**
  * **Objective**: Identify your machine's IP address, subnet, gateway, DNS servers, and MAC address. This mirrors the first thing you do when debugging a network issue on a server.
  * **Status**: ✔ Completed
  * **Task Folder**: `[task-01-document-your-machines-full-network-configuration/](./tasks/task-01-document-your-machines-full-network-configuration/)`
- [ ] **Task 2: Subnet a /24 Network into 4 Equal Subnets**
  * **Objective**: Manually calculate subnet details for `10.10.10.0/24` divided into 4 equal subnets. Calculate broadcast, network, and host range for each.
  * **Status**: ⏳ Planned
  * **Task Folder**: `[task-02-subnet-a-24-network-into-4/](./tasks/task-02-subnet-a-24-network-into-4/)`
- [ ] **Task 3: Query DNS Records for Three Domains**
  * **Objective**: Use `dig` and `nslookup` to query A, MX, TXT, and NS records for three domains. Learn to read the output.
  * **Status**: ⏳ Planned
  * **Task Folder**: `[task-03-query-dns-records-for-three-domains/](./tasks/task-03-query-dns-records-for-three-domains/)`
- [ ] **Task 4: SSH Server Key-based Authentication Migration**
  * **Objective**: SSH into your server with password auth, then migrate to ED25519 key-based auth, disable password auth.
  * **Status**: ⏳ Planned
  * **Task Folder**: `[task-04-ssh-server-key-based-authentication-migration/](./tasks/task-04-ssh-server-key-based-authentication-migration/)`
- [ ] **Task 5: Set Up UFW — Allow SSH, HTTP, HTTPS — Test Each Rule**
  * **Objective**: Allow SSH (22), HTTP (80), HTTPS (443) — block everything else — test each rule.
  * **Status**: ⏳ Planned
  * **Task Folder**: `[task-05-set-up-ufw-allow-ssh-http/](./tasks/task-05-set-up-ufw-allow-ssh-http/)`
- [ ] **Task 6: Trace a Full HTTPS Request with curl**
  * **Objective**: Use `curl` with verbose output to observe the complete HTTP request/response cycle, including all headers.
  * **Status**: ⏳ Planned
  * **Task Folder**: `[task-06-trace-a-full-https-request-with-curl/](./tasks/task-06-trace-a-full-https-request-with-curl/)`
- [ ] **Task 7: Use tcpdump to Capture HTTP Traffic**
  * **Objective**: Capture HTTP traffic on port 80 — analyse the output.
  * **Status**: ⏳ Planned
  * **Task Folder**: `[task-07-use-tcpdump-to-capture-http-traffic/](./tasks/task-07-use-tcpdump-to-capture-http-traffic/)`
- [ ] **Task 8: Use nmap to Scan Your Server**
  * **Objective**: Use nmap to scan your server — identify all open ports and their services.
  * **Status**: ⏳ Planned
  * **Task Folder**: `[task-08-use-nmap-to-scan-your-server/](./tasks/task-08-use-nmap-to-scan-your-server/)`
- [ ] **Task 9: Set Up an SSH Jump Host Config**
  * **Objective**: Set up an SSH jump host config so you can access a private server via a bastion.
  * **Status**: ⏳ Planned
  * **Task Folder**: `[task-09-set-up-an-ssh-jump-host/](./tasks/task-09-set-up-an-ssh-jump-host/)`
- [ ] **Task 10: Configure iptables to Block a Specific IP**
  * **Objective**: Configure iptables to block a specific IP, verify the block, then remove the rule.
  * **Status**: ⏳ Planned
  * **Task Folder**: `[task-10-configure-iptables-to-block-a-specific/](./tasks/task-10-configure-iptables-to-block-a-specific/)`
- [ ] **Task 11: Use mtr to Diagnose a Network Path**
  * **Objective**: Use mtr to diagnose a network path — identify any packet loss hops.
  * **Status**: ⏳ Planned
  * **Task Folder**: `[task-11-use-mtr-to-diagnose-a-network/](./tasks/task-11-use-mtr-to-diagnose-a-network/)`
- [ ] **Task 12: Set Up WireGuard VPN Between Two Servers**
  * **Objective**: Set up WireGuard VPN between two servers and verify encrypted traffic.
  * **Status**: ⏳ Planned
  * **Task Folder**: `[task-12-set-up-wireguard-vpn-between-two/](./tasks/task-12-set-up-wireguard-vpn-between-two/)`

---

##  Key Topics Studied
* **Network Layers**: OSI 7-Layer Model vs. TCP/IP 4-Layer Model.
* **IP Protocol Suite**: IPv4 subnet architecture, CIDR, private address blocks (RFC 1918), and IPv6 expansion.
* **Core Internet Utilities**: Domain Name Systems (recursive vs authoritative), NAT rules, and common TCP/UDP ports.
* **Network Security & Routing**: Local firewalls, SSH keys, default gateways, and load balancer models.

---
[⬅️ Back to Foundations Module](../README.md)
