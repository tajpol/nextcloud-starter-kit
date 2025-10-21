🛠 Troubleshooting Guide

This guide covers common issues you might run into when setting up or running the Nextcloud Starter Kit.


🚫 Docker Desktop not running (Windows/Mac)
- Symptom: You run docker compose up -d and get errors like Cannot connect to the Docker daemon.
- Fix: Make sure Docker Desktop is installed and running.  
  - On Windows: Look for the whale icon in the system tray.  
  - On macOS: Look for the whale icon in the menu bar.  
- Restart Docker Desktop if needed.


🔌 Port 8080 already in use
- Symptom: You see an error like Bind for 0.0.0.0:8080 failed: port is already allocated.
- Fix: Change the port mapping in docker-compose.yml:
  `yaml
  ports:
    - "9090:80"
  `
  Then access Nextcloud at http://localhost:9090.


📦 Checking if containers are running
- Run:
  `bash
  docker ps
  `
- You should see containers for nextcloud, db, and redis.  
- If one is missing, check logs (see below).


📜 Viewing logs
- To see logs for the Nextcloud container:
  `bash
  docker logs nextcloud-starter-kit-nextcloud-1
  `
- Replace the container name if yours is different (docker ps will show the exact name).


🔑 Database password mismatch
- Symptom: Nextcloud setup fails with database connection errors.
- Fix: Make sure the values in .env match between the db and nextcloud services:
  - MYSQL_PASSWORD in .env
  - MYSQL_PASSWORD in docker-compose.yml (environment section for nextcloud)


🌍 HTTPS not working
- Symptom: You set up a domain but HTTPS fails.
- Checklist:
  1. Your domain points to your server’s public IP (check with ping yourdomain.com).
  2. Ports 80 and 443 are open and forwarded to your server.
  3. Your Caddyfile has the correct domain name.
- Restart the stack after changes:
  `bash
  docker compose up -d
  `

🐢 Performance feels slow
- Make sure your server has at least 2 GB RAM.
- Redis is already included for caching — confirm it’s running with docker ps.
- Avoid running heavy apps (like Collabora/OnlyOffice) on very small servers.


❓ Still stuck?
- Check the Nextcloud documentation.
- Search the Nextcloud forums.
- Or open an issue in this repo if you think it’s a bug in the Starter Kit setup.
`

---

👉 Drop this into docs/troubleshooting.md in your repo, commit, and push. It’ll automatically link from your README.  

Would you like me to also draft a Next Steps / Enhancements guide (docs/next-steps.md) that shows people how to add Collabora, DuckDNS, or theming once they’ve got the basics running? That could make your repo feel like a mini‑playbook for growing their cloud.
