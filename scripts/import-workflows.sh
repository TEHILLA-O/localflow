#!/usr/bin/env bash
# Import LocalFlow workflows into running n8n container
set -euo pipefail
cd "$(dirname "$0")/.."

ORDER=(
  "02-lead-qualification.json"
  "03-service-area-check.json"
  "01-lead-intake.json"
  "04-booking-management.json"
  "05-appointment-reminders.json"
  "06-lead-follow-up.json"
  "07-job-completion-review.json"
  "08-error-handler.json"
  "09-daily-operations-brief.json"
  "10-weekly-business-report.json"
)

for f in "${ORDER[@]}"; do
  echo "Importing $f..."
  docker compose exec -T n8n n8n import:workflow --input="/import-workflows/$f"
done

echo "Done. Configure PostgreSQL + Mailpit SMTP credentials in n8n, then activate workflows."
