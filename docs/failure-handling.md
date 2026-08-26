# Failure Handling

## Error Classification

| Type | Examples | Retryable |
|------|----------|-----------|
| TRANSIENT_NETWORK | Timeout, ECONNRESET | Yes (bounded) |
| EXTERNAL_API | HTTP 500, postcodes.io down | Yes (fallback first) |
| VALIDATION | Invalid email, malformed postcode | No |
| DATABASE | Constraint violation | Investigate |
| AUTHENTICATION | Bad credentials | No |
| BUSINESS_RULE | Booking conflict | No |
| UNKNOWN | Unclassified | Case-by-case |

## Retry Rules

- Maximum 3 retries for retryable errors
- Exponential backoff recommended in production (n8n retry settings)
- Never infinite loops

## Partial Success

Example: booking created, confirmation email failed.

```
Booking: SUCCESS
Confirmation: FAILED
Communication retry: PENDING (record in communications table)
```

Do not roll back booking on email failure.

## Dead Letter / Manual Review

Non-recoverable failures create `workflow_errors` row with status `MANUAL_ACTION_REQUIRED`:

```
Lead: LEAD-2026-000281
Workflow: Lead Intake
Failed Stage: Postcode Validation
Reason: Malformed payload
Status: MANUAL_ACTION_REQUIRED
```

Owner receives Mailpit alert.

## Postcode API Fallback

If `POSTCODE_API_ENABLED=true` and API unavailable:

1. Log fallback usage
2. Use deterministic regex validation in Code node
3. Continue workflow (do not fail entire intake)

## Notification Failures

SMTP errors classified as TRANSIENT_NETWORK where appropriate. Idempotency keys allow safe retry without duplicate customer emails.

## Database Failures

Constraint violations (e.g., duplicate reference) → DATABASE, non-retryable, manual investigation.

## Examples

### Transient timeout

```
error_type: TRANSIENT_NETWORK
status: RETRYING
retry_count: 1
```

### Invalid email

```
error_type: VALIDATION
status: MANUAL_ACTION_REQUIRED
retryable: false
```

### Booking conflict

Handled in WF-04 business logic (HTTP 409), not WF-08.
