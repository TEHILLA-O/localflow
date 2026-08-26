#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
docker compose up -d
echo "LocalFlow demo environment started."
echo "  n8n:     http://localhost:5678"
echo "  Mailpit: http://localhost:8025"
