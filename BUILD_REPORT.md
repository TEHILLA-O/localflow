# Build Status

Generated: 2026-08-26

## Environment

| Component | Version / Status |
|-----------|----------------|
| Docker | 27.5.1 |
| Docker Compose | v2.32.4 |
| n8n | 2.35.4 |
| PostgreSQL | 16-alpine |
| Python | 3.12.10 |
| Mailpit | latest (healthy) |

All Docker Compose services reported **healthy** after startup.

## Workflows Implemented

| File | Name | Import Status |
|------|------|---------------|
| 01-lead-intake.json | WF-01 Lead Intake | Imported |
| 02-lead-qualification.json | WF-02 Lead Qualification | Imported |
| 03-service-area-check.json | WF-03 Service Area Check | Imported |
| 04-booking-management.json | WF-04 Booking Management | Imported |
| 05-appointment-reminders.json | WF-05 Appointment Reminders | Imported |
| 06-lead-follow-up.json | WF-06 Lead Follow-Up | Imported |
| 07-job-completion-review.json | WF-07 Job Completion Review | Imported |
| 08-error-handler.json | WF-08 Error Handler | Imported |
| 09-daily-operations-brief.json | WF-09 Daily Operations Brief | Imported |
| 10-weekly-business-report.json | WF-10 Weekly Business Report | Imported |
| sub-validate-postcode.json | Sub: Validate Postcode | Available (optional) |

## Database

**Tables created:** customers, leads, bookings, jobs, communications, follow_ups, reviews, audit_events, workflow_runs, workflow_errors, reporting_snapshots, automation_config, service_definitions, technicians

## Demo Data (actual counts)

| Entity | Count |
|--------|-------|
| customers | 75 |
| leads | 120 |
| bookings | 45 |
| jobs | 35 |
| communications | 30 |
| workflow_runs (seed) | 50 |
| workflow_errors | 0 |

## Validation

```
python scripts/validate-workflows.py
Validated 10/10 required workflows
PASS — all workflow checks passed
```

## Test Results

| Check | Result |
|-------|--------|
| Docker Compose up | PASS |
| PostgreSQL init (schema + indexes + demo data) | PASS |
| Mailpit health | PASS |
| n8n health | PASS |
| Workflow JSON validation | PASS |
| n8n CLI import (10 workflows) | PASS |
| Demo script environment check | PASS |

## Demo Scenarios

| Scenario | Status | Notes |
|----------|--------|-------|
| A Normal lead | PENDING | Requires n8n credentials + workflow activation |
| B Emergency lead | PENDING | Logic in WF-01/WF-02; activate to test |
| C Outside service area | PENDING | WF-03 classification implemented |
| D Duplicate submission | PENDING | Fingerprint + SQL in WF-01 |
| E Invalid form | PENDING | Validation Code node returns 400 |
| F Follow-up recovery | DESIGNED | WF-06 scheduled workflow |
| G Cancelled appointment | DESIGNED | WF-05 status filter |
| H Workflow failure | DESIGNED | WF-08 error trigger |
| I Unsatisfied customer | DESIGNED | WF-07 review suppression |

Webhook E2E tests return 404 until workflows are **activated** and **PostgreSQL/SMTP credentials** are configured in n8n UI.

## Idempotency Tests

| Pattern | Implementation |
|---------|----------------|
| Communication dedup | `communications.idempotency_key` UNIQUE + ON CONFLICT |
| Follow-up dedup | `follow_ups.idempotency_key` UNIQUE |
| Reminder dedup | `reminder_*_sent_at IS NULL` guard in UPDATE |
| Duplicate leads | `content_fingerprint` + 48h window query |

Automated idempotency execution tests: **PENDING** credential setup in n8n.

## Error Handling Tests

WF-08 imported and compatible with n8n 2.35.4 error trigger. Live failure simulation: **PENDING** (set as error workflow in n8n settings after activation).

## Docker Status

```
localflow-postgres   healthy   5432
localflow-mailpit    healthy   8025, 1025
localflow-n8n        healthy   5678
```

## Known Limitations

1. n8n warns PostgreSQL 16 is outside officially supported range (compatibility mode only); Postgres 17 recommended for production.
2. Workflows import deactivated; user must configure credentials and activate.
3. Execute Workflow nodes reference workflows by name — import order matters (WF-02, WF-03 before WF-01).
4. AI enrichment and postcodes.io API are optional and disabled by default.
5. Demo sample JSON files in `demo/` are supplementary; primary seed is SQL.

## Production Recommendations

- Upgrade to PostgreSQL 17+
- Enable n8n authentication and HTTPS
- Configure WF-08 as global error workflow
- Replace Mailpit with production SMTP
- Automated encrypted backups with restoration testing
- Webhook HMAC validation and rate limiting
