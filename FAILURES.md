# Failure modes, fixes, and results

Honest engineering notes for this project. Nothing here is invented for polish.

## What can go wrong

- **Duplicate leads, double bookings, forgotten reminders.** Manual ops failure modes the platform targets. Mitigation: dedupe on intake, booking conflict detection, idempotent reminder keys, scheduled follow-ups (WF-01..WF-07).
- **Transient network / SMTP / postcode API failures mid-workflow.** Impact: partial success (booking saved, email not sent). Mitigation: WF-08 error classification, bounded retries, postcode regex fallback when the API is down (`docs/failure-handling.md`).
- **Credential or webhook abuse on a public intake URL.** Impact: spam or forged leads. Mitigation: demo uses local Mailpit; production checklist requires TLS, shared secret/HMAC, rate limits (`SECURITY.md`).
- **Infinite retry loops.** Mitigation: max 3 retries for retryable classes; validation and business-rule errors are non-retryable.

## What went wrong

**No recorded production incident in this repo yet.** This is a fictional Northampton Home Services case study. Documented unfinished verification:

1. Automated idempotency execution tests: **PENDING** credential setup in n8n (`BUILD_REPORT.md`).
2. Live WF-08 failure simulation: **PENDING** (must set WF-08 as the global error workflow after activation).
3. Seeded `workflow_errors` count is **0** after demo data load; error path is designed but not exercised live in the build report.

## How it was resolved

1. Schema already enforces `communications.idempotency_key` and `follow_ups.idempotency_key` UNIQUE + ON CONFLICT; live tests wait on n8n credentials.
2. WF-08 is imported and compatible with n8n 2.35.4; activation steps are in README / build report.
3. Failure taxonomy and partial-success rules are written in `docs/failure-handling.md` (do not roll back a booking when only email fails).

## Results

From `BUILD_REPORT.md` (2026-08-26):

- Docker Compose services healthy; **10/10** required workflows validated (`PASS`).
- Demo data: 75 customers, 120 leads, 45 bookings, 35 jobs, 30 communications, 50 seeded workflow_runs.
- Successful local demo: import workflows, seed DB, submit a form/webhook lead, watch Mailpit for confirmation and owner alerts.
