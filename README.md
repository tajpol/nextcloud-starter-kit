Nextcloud Starter Kit 🚀

A beginner-friendly, self-hosted cloud setup using Nextcloud.  
This repo provides a Docker Compose bundle you can run locally or on a server, with optional HTTPS support.


✨ Features
- Nextcloud (latest)
- MariaDB database
- Redis cache for performance
- Optional HTTPS with Caddy
- Beginner-friendly .env configuration
- One-click install script (install.sh)


🖥 Requirements
- Docker + Docker Compose
- At least 2 GB RAM recommended
- Linux, macOS, or Windows (with Docker Desktop)


🚀 Quick Start

Clone this repo and run the installer:

`bash
git clone https://github.com/tajpol/nextcloud-starter-kit.git
cd nextcloud-starter-kit
chmod +x install.sh
./install.sh
`

Then open http://localhost:8080 in your browser.


⚙️ Environment Variables

Copy .env.example to .env and edit values:

`bash
cp .env.example .env
`

- MYSQLROOTPASSWORD → Root password for MariaDB (database admin)
- MYSQL_PASSWORD → Password for the Nextcloud database user

> 🔑 Use strong, unique passwords here.


🌍 Going Public

Want to make your cloud accessible from the internet?

1. Domain name: Buy one or use free DuckDNS.
2. Router setup: Forward ports 80 and 443 to your server.
3. Enable HTTPS: Update the Caddyfile with your domain:
   `caddy
   yourdomain.example {
       reverse_proxy nextcloud:80
       header {
           Strict-Transport-Security "max-age=31536000; includeSubDomains; preload"
       }
   }
   `
4. Restart with:
   `bash
   docker compose up -d
   `

Caddy will automatically fetch and renew free TLS certificates from Let’s Encrypt.


🛠 Troubleshooting

See docs/troubleshooting.md for common issues.

Quick tips:
- Check containers: docker ps
- View logs: docker logs nextcloud-starter-kit-nextcloud-1
- Ensure Docker Desktop is running (Windows/Mac)


📚 Next Steps
- Add apps from the Nextcloud App Store (Calendar, Contacts, Office, Talk).
- Try Collabora or OnlyOffice for document editing.
- Use DuckDNS for a free domain.
- Customize theming for your brand: Nextcloud Theming Docs.


⚖️ License
- Config files in this repo: MIT License
- Nextcloud itself: AGPLv3 (details)
- Attribution: Based on the Nextcloud project


💡 Credits
Created by @tajpol — inspired by the open-source community.


☕ Support My Work
If you find this project helpful, you can support me here:  
👉 https://ko-fi.com/tajpollard
`

Want to support through crypto? Copy the address below to send Ethereum ⛽⚡

0x170888ED30245b966C9eE761F1fC343Ff4d4243C

