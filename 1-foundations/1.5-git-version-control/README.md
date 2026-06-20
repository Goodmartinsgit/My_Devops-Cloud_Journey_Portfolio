# 🐙 Sub-Module 1.5: Git & Version Control

This subdirectory will document version control practices, repository branching workflows, and git automation hooks.

---

## 📋 Task Checklist & Progress

- [ ] **Task 1: Create a GitHub Account with SSH Key Auth and Signed Commits (GPG)**
  * **Objective**: **Why it matters:** SSH keys replace password authentication — they're stronger, can be scoped, and work with automation. GPG-signed commits allow your teammates and GitHub to verify that a commit genuinely came from you, not someone who gained access to your account.
  * **Status**: ⏳ Planned
  * **Task Folder**: `[task-01-create-a-github-account-with-ssh/](./tasks/task-01-create-a-github-account-with-ssh/)`
- [ ] **Task 2: Initialise 'devops-cloud-journey' Repo and Set Up Branch Protection**
  * **Objective**: **Why it matters:** Branch protection rules are a critical safety mechanism on real projects. They prevent direct pushes to important branches, require code reviews, and ensure that automated tests pass before merging.
  * **Status**: ⏳ Planned
  * **Task Folder**: `[task-02-initialise-devops-cloud-journey-repo-and/](./tasks/task-02-initialise-devops-cloud-journey-repo-and/)`
- [ ] **Task 3: Practice All Branching Strategies — Gitflow Branches**
  * **Objective**: Complete the hands-on exercise detailed in the handbook.
  * **Status**: ⏳ Planned
  * **Task Folder**: `[task-03-practice-all-branching-strategies-gitflow-branches/](./tasks/task-03-practice-all-branching-strategies-gitflow-branches/)`
- [ ] **Task 4: GitLab Flow**
  * **Objective**: GitLab Flow adds environment branches to GitHub Flow, making it suitable for teams with separate staging and production environments.
  * **Status**: ⏳ Planned
  * **Task Folder**: `[task-04-gitlab-flow/](./tasks/task-04-gitlab-flow/)`
- [ ] **Task 5: Deliberately Create a 3-Way Merge Conflict and Resolve It Using vimdiff**
  * **Objective**: Complete the hands-on exercise detailed in the handbook.
  * **Status**: ⏳ Planned
  * **Task Folder**: `[task-05-deliberately-create-a-3-way-merge/](./tasks/task-05-deliberately-create-a-3-way-merge/)`
- [ ] **Task 6: Write a .gitignore Covering Python, Node, Go, .env Files, IDE Configs, OS Files**
  * **Objective**: cat > .gitignore << 'GITIGNORE'
  * **Status**: ⏳ Planned
  * **Task Folder**: `[task-06-write-a-gitignore-covering-python-node/](./tasks/task-06-write-a-gitignore-covering-python-node/)`
- [ ] **Task 7: Create a Pre-Commit Hook That Runs ShellCheck, Black Formatter, and Blocks TODO/FIXME**
  * **Objective**: Complete the hands-on exercise detailed in the handbook.
  * **Status**: ⏳ Planned
  * **Task Folder**: `[task-07-create-a-pre-commit-hook-that/](./tasks/task-07-create-a-pre-commit-hook-that/)`
- [ ] **Task 8: Use git bisect to Find Which Commit Introduced a Bug in a 20-Commit Test Repo**
  * **Objective**: Complete the hands-on exercise detailed in the handbook.
  * **Status**: ⏳ Planned
  * **Task Folder**: `[task-08-use-git-bisect-to-find-which/](./tasks/task-08-use-git-bisect-to-find-which/)`
- [ ] **Task 9: Set Up Semantic Versioning — Tag v1.0.0, v1.1.0, v2.0.0 with Signed Annotated Tags**
  * **Objective**: Complete the hands-on exercise detailed in the handbook.
  * **Status**: ⏳ Planned
  * **Task Folder**: `[task-09-set-up-semantic-versioning-tag-v100/](./tasks/task-09-set-up-semantic-versioning-tag-v100/)`
- [ ] **Task 10: Set Up a GitHub Repo with Branch Protection: Require PR Review, Status Checks, No Force-Push**
  * **Objective**: This task was covered in detail in Task 2. Refer to that section for the complete step-by-step guide. For this task, focus on adding a CI/CD status check using GitHub Actions so that the branch protection's "required status checks" requirement has something to enforce.
  * **Status**: ⏳ Planned
  * **Task Folder**: `[task-10-set-up-a-github-repo-with/](./tasks/task-10-set-up-a-github-repo-with/)`
- [ ] **Task 11: Write a Comprehensive CONTRIBUTING.md and README.md for Your Learning Repo**
  * **Objective**: Complete the hands-on exercise detailed in the handbook.
  * **Status**: ⏳ Planned
  * **Task Folder**: `[task-11-write-a-comprehensive-contributingmd-and-readmemd/](./tasks/task-11-write-a-comprehensive-contributingmd-and-readmemd/)`
- [ ] **Task 12: Use git reflog to Recover a 'Deleted' Branch and Restore Lost Commits**
  * **Objective**: Complete the hands-on exercise detailed in the handbook.
  * **Status**: ⏳ Planned
  * **Task Folder**: `[task-12-use-git-reflog-to-recover-a/](./tasks/task-12-use-git-reflog-to-recover-a/)`
- [ ] **Task 13: Configure a Local GitLab Instance Using Docker and Mirror Your GitHub Repo to It**
  * **Objective**: **Prerequisites:** Docker and Docker Compose installed on your machine.
  * **Status**: ⏳ Planned
  * **Task Folder**: `[task-13-configure-a-local-gitlab-instance-using/](./tasks/task-13-configure-a-local-gitlab-instance-using/)`

---

##  Key Topics Studied
* **Working Spaces**: Staging indexes, directories mapping, tracking logic, and git status codes.
* **Integrations**: Standard merge vs interactive rebase, cherry-pick commits, and git stash commands.
* **Collaboration & Policies**: Branch protection rules, pull requests reviews, and merge strategies (squash vs fast-forward).
* **Automation Hooks**: Executing shell logic on git lifecycle events (pre-commit, post-merge).

---
[⬅️ Back to Foundations Module](../README.md)
