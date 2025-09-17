#!/bin/bash
set -e

# Update and install dependencies
apt-get update -y
apt-get install -y curl unzip git build-essential python3 python3-pip

# Install Node.js LTS (20.x)
curl -fsSL https://deb.nodesource.com/setup_20.x | bash -
apt-get install -y nodejs

# Install PM2 globally
npm install -g pm2

# Setup app directory
mkdir -p /var/www/strapi
cd /var/www/strapi

# Create Strapi project (SQLite by default)
npx create-strapi-app@latest my-project --quickstart --no-run

cd my-project

# Environment variables (.env)
cat > .env <<EOF
HOST=0.0.0.0
PORT=1337
NODE_ENV=production
DATABASE_CLIENT=sqlite
DATABASE_FILENAME=.tmp/data.db
EOF

# Install deps and build for production
npm install
npm run build

# Start Strapi with PM2
pm2 start "npm run start" --name strapi
pm2 startup systemd -u ubuntu --hp /home/ubuntu
pm2 save

echo "✅ Strapi deployed and running on port 1337"
