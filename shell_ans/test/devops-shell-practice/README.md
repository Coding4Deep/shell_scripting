# DevOps Shell Scripting – 50 Advanced Tasks (with Solutions)

This pack contains **50 production-grade Bash scripts** mapped to common DevOps scenarios.
Each file is executable (`chmod +x *.sh`) and includes usage notes at the top.

## How to use
```bash
cd devops-shell-practice
./01_top_largest_files.sh . 10
./10_ssl_expiry_check.sh domains.txt 10
# etc.
```

## Practice Sets
- **Set A — Files & Logs (01–05)**
- **Set B — Monitoring & Automation (06–10)**
- **Set C — Networking & Security (11–15)**
- **Set D — Backup & Recovery (16–20)**
- **Set E — CI/CD & Deployments (21–25)**
- **Set F — Performance & Debugging (26–30)**
- **Set G — Data Processing (31–35)**
- **Set H — DevOps Tooling (36–40)**
- **Set I — Logic & Reliability (41–45)**
- **Set J — Misc/Production Patterns (46–50)**

> Some scripts rely on external tooling if available (`jq`, `aws`, `kubectl`, `helm`, `terraform`, `trivy`, `inotifywait`). When those tools aren't installed, the scripts either degrade gracefully or print a clear message.

Good luck, and happy scripting! 🔧
