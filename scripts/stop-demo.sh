#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
docker compose down
echo "LocalFlow demo environment stopped."
