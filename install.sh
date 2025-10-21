`bash

!/bin/bash

One-click installer for Nextcloud Starter Kit

echo "🚀 Installing Docker and Docker Compose..."
if [ -x "$(command -v apt)" ]; then
  sudo apt update
  sudo apt install -y docker.io docker-compose-plugin
elif [ -x "$(command -v yum)" ]; then
  sudo yum install -y docker docker-compose
fi

echo "📂 Setting up environment..."
cp .env.example .env

echo "▶️ Starting Nextcloud..."
docker compose up -d

echo "✅ Done! Open http://localhost:8080 in your browser."
`

(Make it executable: chmod +x install.sh)
