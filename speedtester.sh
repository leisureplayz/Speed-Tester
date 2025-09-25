#!/bin/bash
# Simple Linux Speed Tester
# Made By: leisureplayz1.js
# Available in: Discord
# GitHub: https://github.com/leisureplayz/Speed-Tester/

# Display project info
echo "🚀 Linux Speed Tester"
echo "===================="
echo "Made By: leisureplayz1.js / Available in Discord"
echo "GitHub: https://github.com/leisureplayz/Speed-Tester/"
echo

# Ping test
echo "🔹 Testing Ping..."
PING=$(ping -c 4 google.com | tail -1 | awk -F'/' '{print $5}')
echo "📡 Ping: $PING ms"
echo

# Download speed test
echo "🔹 Testing Download Speed..."
DOWNLOAD=$(curl -o /dev/null -s -w '%{speed_download}' https://speed.cloudflare.com/__down?bytes=50000000)
DOWNLOAD_MBPS=$(echo "scale=2; $DOWNLOAD/1024/1024" | bc)
echo "⬇️  Download: $DOWNLOAD_MBPS Mbps"
echo

# Upload speed test
echo "🔹 Testing Upload Speed..."
UPLOAD=$(curl -s -o /dev/null -w '%{speed_upload}' -X POST --data-binary @/dev/zero https://speed.cloudflare.com/__up -H "Content-Length:10000000" --max-time 20)
UPLOAD_MBPS=$(echo "scale=2; $UPLOAD/1024/1024" | bc)
echo "⬆️  Upload: $UPLOAD_MBPS Mbps"
echo

echo "✅ Test Completed!"
echo "Thanks for using Linux Speed Tester!"
