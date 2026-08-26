#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
mkdir -p backups
STAMP=$(date +%Y%m%d_%H%M%S)
FILE="backups/localflow_${STAMP}.sql"
docker compose exec -T postgres pg_dump -U "${POSTGRES_USER:-localflow}" "${POSTGRES_DB:-localflow}" > "$FILE"
echo "Backup written to $FILE"
