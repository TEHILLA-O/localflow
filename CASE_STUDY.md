# LocalFlow

## Executive Summary

LocalFlow is a self-hosted automation platform built for **Northampton Home Services Ltd**, a fictional UK local trades business. It replaces a manual enquiry-handling process with ten orchestrated n8n workflows backed by PostgreSQL, demonstrating production-style patterns: validation, deduplication, state machines, idempotent communications, error recovery, and operational reporting.

This case study does **not** claim real business impact metrics. Measurable engineering outcomes include workflow count, database entity volumes, validation pass rates, and demonstrated idempotency patterns.

## Business Problem

Manual enquiry handling creates operational risk: missed leads, inconsistent qualification, duplicate records, forgotten follow-ups, double bookings, and no central error monitoring.

## Why Automation

Automation provides consistent validation, immediate acknowledgement, explainable scoring, scheduled reminders, and database-backed audit trails—freeing staff to focus on customer-facing work.

## Objectives

1. End-to-end lead lifecycle automation
2. Configurable business rules without code changes
3. Safe local demo (Mailpit, synthetic data)
4. Production-ready patterns (idempotency, error handler, reporting)

## System Architecture

Docker Compose runs n8n, PostgreSQL, and Mailpit. Business data lives in PostgreSQL; n8n orchestrates workflows and external communication via SMTP.

## Workflow Architecture

- **Intake path:** WF-01 → WF-03 → WF-02 → communications
- **Booking path:** WF-04 with conflict checks
- **Scheduled:** WF-05 (reminders), WF-06 (follow-ups), WF-09 (daily), WF-10 (weekly)
- **Completion:** WF-07 (review / recovery)
- **Cross-cutting:** WF-08 (errors)

## Lead Intake

Dual triggers (Form + Webhook). Normalises UK phone/postcode, validates consent, detects duplicates via fingerprint, creates customer + lead records, calls sub-workflows.

## Validation

Required fields, email regex, UK mobile format (`07xxxxxxxxx`), UK postcode format, consent flag. Invalid submissions return HTTP 400 without corrupt records.

## Service Area Logic

PRIMARY: NN1–NN5 | EXTENDED: NN6–NN12 | OUTSIDE: all other districts. Config stored in `automation_config`.

## Qualification Model

Weighted deterministic scoring with bounded 0–100 result and JSON reasons array. Human review for extended-area low scores and unsupported services.

## Lead State Machine

Documented transitions enforced in workflow UPDATE statements. Terminal states: CLOSED, DORMANT, OUTSIDE_SERVICE_AREA, DUPLICATE, INVALID, CANCELLED, FAILED.

## Duplicate Prevention

Fingerprint = normalised email + phone + postcode + service + description prefix. 48-hour window for likely duplicates. Existing lead reference returned; no duplicate row created.

## Booking Automation

Overlap query: `start_at < requested_end AND end_at > requested_start`. Conflict returns HTTP 409. Confirmation email with idempotency key.

## Reminder Automation

Schedule every 15 minutes. 24h and 2h windows. Updates `reminder_*_sent_at` only when NULL. Cancelled bookings excluded by status filter.

## Follow-Up Automation

Hourly check for QUALIFIED/CONTACTED leads without FOLLOW_UP_1. Stops when status becomes BOOKED, CANCELLED, etc.

## Review Automation

Satisfied customers receive review request (placeholder URL). Dissatisfied customers trigger service recovery alert; public review suppressed.

## Error Handling

WF-08 classifies errors (TRANSIENT_NETWORK, VALIDATION, DATABASE, etc.), logs to `workflow_errors`, alerts owner for manual action cases.

## Idempotency

- Communications: unique `idempotency_key`
- Follow-ups: unique `idempotency_key`
- Reminders: timestamp guards on booking rows
- Reports: snapshots stored with period boundaries

## Data Model

12+ business tables including customers, leads, bookings, jobs, communications, follow_ups, reviews, audit_events, workflow_runs, workflow_errors, reporting_snapshots, automation_config.

## Auditability

`audit_events` records entity type, previous/new state, workflow name, and metadata JSON.

## Reporting

WF-09 and WF-10 aggregate live SQL metrics—no hard-coded fake numbers. Division-by-zero handled in weekly conversion rates.

## Security

Secrets in `.env` only. Webhook secret optional. Production requires HTTPS, auth, and credential rotation. See SECURITY.md.

## Privacy Considerations

Synthetic demo data. GDPR notes documented. Production requires organisation-specific legal review.

## Testing Strategy

Three levels: business logic (scripts/unit), workflow JSON validation, E2E via demo script + n8n execution.

## Failure Scenarios

Documented in docs/failure-handling.md. Safe partial success: booking created even if confirmation email fails (retry via communication record).

## Demo Results

Engineering observations (run `scripts/run-case-study-demo.py` after Docker up):

- 10 workflows validated PASS
- Demo seed: ~75 customers, ~120 leads, ~45 bookings, ~35 jobs
- 9 documented simulation scenarios
- Idempotency keys prevent duplicate acknowledgement emails on conflict

## Engineering Decisions

PostgreSQL as system of record; sub-workflows for reusable logic; Mailpit for safe email; deterministic scoring over mandatory AI.

## Tradeoffs

Manual n8n import vs API automation; database calendar vs Google Calendar; simplified follow-up sequence vs full multi-step state machine in v1.

## Production Improvements

Google Calendar, SMS/WhatsApp adapters, CRM sync, n8n queue mode, encrypted backups, webhook signatures, rate limiting.

## Skills Demonstrated

n8n architecture · workflow orchestration · PostgreSQL · Docker · business process design · error recovery · idempotency · reporting · technical documentation
