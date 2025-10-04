

# 🔥 50 Advanced Shell Scripting Questions for DevOps Interviews

### **File & Log Management**

1. Write a script to find the **top 10 largest files** in a directory tree (ignoring symlinks).
2. Create a script that monitors a **log file in real-time** and sends an alert if a specific keyword (e.g., “ERROR” or “CRITICAL”) appears more than 5 times in 1 minute.
3. Write a script to **rotate logs** when size exceeds 100MB, compress old logs, and keep only the last 7 days.
4. Parse an Apache/Nginx log file and find the **IP addresses with the most requests**.
5. Create a script to detect and delete **duplicate files** in a directory tree by checksum comparison.

---

### **System Monitoring & Automation**

6. Write a script to **check disk usage** across multiple servers and send an email if usage > 80%.
7. Create a script to monitor **CPU load average** and auto-kill processes consuming more than 90% CPU.
8. Write a script to monitor **memory usage** and clear cache if free memory < 500MB.
9. Build a script to check if a **service (e.g., nginx, docker)** is running; if not, restart it and log the event.
10. Write a script to check the **SSL certificate expiry date** of a list of websites and send alerts for <10 days remaining.

---

### **Networking & Security**

11. Write a script to extract **all active IP connections** (netstat/ss) and detect if any blacklisted IPs are connected.
12. Create a script that tests **port availability** for a list of servers and outputs only failed ones.
13. Write a script that checks whether a list of URLs returns **HTTP 200 OK** or not.
14. Automate a script to block IPs with more than **100 failed SSH login attempts** in the last hour.
15. Write a script that generates a **random strong password** with length and complexity constraints.

---

### **Backup & Recovery**

16. Write a script to **backup a directory** to a remote server using `rsync`, with incremental backups and retention policy.
17. Create a script that automatically **restores the latest backup** from a backup server.
18. Write a script to perform **MySQL/PostgreSQL database backup**, compress it, and upload it to S3.
19. Write a script that checks if a backup completed successfully and verifies file integrity with checksum.
20. Automate daily backups but **skip unchanged files** for efficiency.

---

### **CI/CD & Deployment**

21. Write a script to **deploy an application** (pull code, build, restart services) in zero-downtime fashion.
22. Automate a script to roll back to the **previous version** if the new deployment fails health checks.
23. Create a script to monitor a **Git repository** and automatically pull & redeploy when changes are pushed.
24. Write a script to validate **YAML/JSON configuration files** before deployment.
25. Create a script to generate a **build artifact** (tar.gz/zip) with version tagging based on Git commit hash.

---

### **Performance & Debugging**

26. Write a script that finds the **top 10 memory-consuming processes** and logs their command names.
27. Create a script to measure **time taken by each step** in a deployment pipeline.
28. Write a script to monitor **network bandwidth usage per process**.
29. Create a script that detects **zombie processes** and cleans them up.
30. Write a script to find which files are being **read/written most frequently** by processes (`lsof`, `iotop`).

---

### **Data Processing & Automation**

31. Write a script to split a **huge CSV file (10GB+)** into smaller chunks without breaking rows.
32. Create a script to merge multiple CSV files and remove duplicates.
33. Write a script to read a CSV file and output **JSON format**.
34. Create a script to **mask sensitive fields** (like passwords, API keys) in a config file before sharing.
35. Write a script that checks **consistency of key-value pairs** across multiple config files.

---

### **DevOps Tooling**

36. Write a script to check if all required **Docker containers are running**, restart missing ones.
37. Create a script to monitor Kubernetes pods and restart if a pod is in **CrashLoopBackOff**.
38. Write a script to check Helm charts for outdated dependencies.
39. Automate Terraform plan & apply with logging and rollback on error.
40. Write a script that scans Docker images for **vulnerabilities** using `trivy` and generates a report.

---

### **Scripting Logic Challenges**

41. Write a script to find the **nth Fibonacci number** using recursion and memoization.
42. Create a script to detect **palindrome strings** from a file input.
43. Write a script to implement a **retry mechanism** with exponential backoff for failed commands.
44. Create a script to **simulate a job scheduler** (run multiple jobs in parallel with max concurrency limit).
45. Write a script that implements a **rate limiter** (e.g., allow only 100 requests/min).

---

### **Misc & Production-Grade Scenarios**

46. Write a script that parses a JSON file without `jq` (using pure shell/awk/sed).
47. Create a script that monitors a directory for **file changes in real-time** and logs them.
48. Write a script that validates if all environment variables required for an app are set, else exits with error.
49. Write a script that can be safely **executed on multiple servers in parallel** using `ssh` and collects results.
50. Build a script that **self-heals itself**: if it crashes midway, it resumes from the last checkpoint.

---
