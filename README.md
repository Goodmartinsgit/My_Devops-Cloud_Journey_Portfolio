# 🚀 DevOps & Cloud Engineering Portfolio

Welcome to my DevOps & Cloud Engineering portfolio! This repository serves as a comprehensive, structured record of my practical learning journey, documenting the hands-on engineering challenges I have solved following the DevOps curriculum.

Here, you will find production-grade scripts, server configuration files, infrastructure-as-code manifests, CI/CD pipeline configurations, and detailed verification logs demonstrating execution.

---

## 👤 Profile & Objective
* **Engineer**: [Your Name]
* **Target Role**: Cloud / DevOps Engineer / Site Reliability Engineer (SRE)
* **Objective**: To master system administration, cloud networking, containers, automation, infrastructure as code, CI/CD, and site reliability through rigorous, hands-on tasks that mirror real production scenarios.

---

## 📊 Learning Journey Dashboard
This dashboard tracks my completion progress across all modules of the DevOps curriculum.

| Module | Core Domain | Topics Covered | Progress | Status |
| :--- | :--- | :--- | :---: | :---: |
| **1** | [Foundations](./1-foundations/) | Linux Admin, Networking, Bash, Python, Git | `[████░░░░░░░░░░░░░░░░]` 20% | 🔄 In Progress |
| **2** | Cloud Engineering | AWS/GCP, IAM, VPCs, EC2, Cloud Database Services | `[░░░░░░░░░░░░░░░░░░░░]` 0% | ⏳ Planned |
| **3** | Containers & Orchestration | Docker, Containerizing Apps, Kubernetes, Helm | `[░░░░░░░░░░░░░░░░░░░░]` 0% | ⏳ Planned |
| **4** | Observability & Reliability | Prometheus, Grafana, ELK Stack, Log Rotation | `[░░░░░░░░░░░░░░░░░░░░]` 0% | ⏳ Planned |
| **5** | Security & Compliance | Linux Hardening, IAM Policies, Secrets, SSL/TLS | `[░░░░░░░░░░░░░░░░░░░░]` 0% | ⏳ Planned |
| **6** | Advanced Architecture | Terraform, Ansible, CI/CD Pipelines, GitOps | `[░░░░░░░░░░░░░░░░░░░░]` 0% | ⏳ Planned |
| **7** | Portfolio & Capstones | Real-world Capstone Projects & Deployments | `[░░░░░░░░░░░░░░░░░░░░]` 0% | ⏳ Planned |

---

## 🛠️ Tech Stack & Skills
A visual mapping of the tools, technologies, and skills developed and demonstrated in this repository.

```
┌────────────────────────────────────────────────────────────────────────┐
│                          DEVOP & CLOUD TOOLCHAIN                       │
├───────────────────┬───────────────────┬────────────────────────────────┤
│ Linux & OS        │ Scripting & Code  │ Networking & Services          │
│ • Ubuntu LTS      │ • Bash Shell      │ • DNS / Route53                │
│ • Systemd         │ • Python 3        │ • Nginx Web Server / Proxy     │
│ • Logrotate       │ • Regex & Grep    │ • SSH Tunneling / Security     │
├───────────────────┼───────────────────┼────────────────────────────────┤
│ Containers & K8s  │ Public Cloud      │ IaC & Automation               │
│ • Docker          │ • AWS Core (VPC)  │ • Terraform                    │
│ • Kubernetes      │ • IAM & Security  │ • Ansible                      │
├───────────────────┴───────────────────┴────────────────────────────────┤
│ CI/CD & Observability                                                  │
│ • GitHub Actions  • Prometheus  • Grafana                              │
└────────────────────────────────────────────────────────────────────────┘
```

---

## 📂 Repository Navigation

Explore the tasks and solutions organized by curriculum module:

### 📁 [Module 1: Foundations](./1-foundations/)
Deep dive into core system administration, scripting, and networking fundamentals.
*   **[1.1 Linux System Administration](./1-foundations/1.1-linux-admin/)**: Core kernel details, user management, file permissions (600 secrets), nginx management, cron/systemd automation, disk usage auditing, and log rotation configurations. *(12 Practical Tasks)*
*   **1.2 Networking Fundamentals** *(Upcoming)*
*   **1.3 Bash Scripting & Automation** *(Upcoming)*
*   **1.4 Python for DevOps & Cloud** *(Upcoming)*
*   **1.5 Git & Version Control** *(Upcoming)*

### 📁 Module 2: Cloud Engineering *(Upcoming)*
Practical application of AWS and Google Cloud core service architectures.

### 📁 Module 3: Containers & Orchestration *(Upcoming)*
Dockerization, Kubernetes deployments, configurations, and cluster architecture.

### 📁 Module 4: Observability & Reliability *(Upcoming)*
Establishing monitoring agents, alert pipelines, log aggregators, and system dashboard reporting.

---

## 📝 How I Record & Verify Tasks
To ensure absolute integrity and reproducibility, every task in this portfolio includes:
1.  **Objective**: Clear definition of the real-world scenario.
2.  **Implementation**: The code, configuration files, or command pipelines used.
3.  **Verification**: Verified outputs (`verification.log` or shell outputs) recorded directly from the server.

### Automated Task Logging Utility
To capture command executions and outputs directly from my Linux environment (VM/WSL/Cloud Server), I use the utility script located in `utils/log-task.sh`:

```bash
# Example: Running a command and logging its output to a task's verification log
./log-task.sh "uname -a" "Verifying kernel version" "1-foundations/1.1-linux-admin/tasks/task-01-explore-system/verification.log"
```

This ensures that all CLI outputs shown in this portfolio are **unaltered, live outputs** captured straight from the server command line.

---
*“In DevOps, if it isn't documented, automated, and version-controlled, it doesn't exist.”*
