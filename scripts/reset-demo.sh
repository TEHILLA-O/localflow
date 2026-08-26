#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."

echo "Resetting demo business data (preserves Docker volumes)..."

docker compose exec -T postgres psql -U "${POSTGRES_USER:-localflow}" -d "${POSTGRES_DB:-localflow}" <<'SQL'
TRUNCATE audit_events, workflow_errors, workflow_runs, reporting_snapshots,
  reviews, follow_ups, communications, jobs, bookings, leads, customers RESTART IDENTITY CASCADE;
SQL

if [ -f database/init/003-demo-data.sql ]; then
  docker compose exec -T postgres psql -U "${POSTGRES_USER:-localflow}" -d "${POSTGRES_DB:-localflow}" < database/init/003-demo-data.sql
fi

echo "Demo data reset complete."
