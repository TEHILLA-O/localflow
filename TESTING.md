# Testing

## Levels

### 1. Business Logic

| Area | Method |
|------|--------|
| Postcode normalisation | Code node in WF-01 / unit tests |
| Phone normalisation | Code node in WF-01 |
| Qualification score | WF-02 deterministic weights |
| Duplicate fingerprint | WF-01 SQL + fingerprint hash |
| Booking overlap | WF-04 conflict query |
| Lead state transitions | PostgreSQL enum + workflow UPDATEs |

### 2. Workflow Integration

- `python scripts/validate-workflows.py` — JSON structure, names, secrets scan
- Import workflows into n8n and execute manual test runs
- Verify PostgreSQL records after form submission

### 3. End-to-End Demo

```bash
docker compose up -d
python scripts/run-case-study-demo.py
```

Scenarios documented in `demo/simulation-scenarios.md`.

## Idempotency Tests

| Test | Expected |
|------|----------|
| Re-run reminder workflow | No duplicate 24h email (`reminder_24h_sent_at` set) |
| Duplicate form submit | Same fingerprint → no new lead |
| Re-send acknowledgement | `idempotency_key` conflict → skip |
| Re-run weekly report | New snapshot row; metrics from DB |

## Error Handling Tests

Simulate failures in n8n (e.g., invalid SQL, SMTP down):

1. WF-08 records row in `workflow_errors`
2. Owner alert for `MANUAL_ACTION_REQUIRED`
3. No silent lead loss (dead-letter concept via error status)

## CI

GitHub Actions runs:

- Workflow JSON validation
- Python lint (`py_compile`)
- Secret pattern scan
- Docker Compose config validation
- Required file presence checks

## Manual n8n Testing Checklist

- [ ] Import all workflows
- [ ] Configure PostgreSQL + SMTP credentials
- [ ] Activate WF-02, WF-03, then WF-01
- [ ] Submit form → check Mailpit acknowledgement
- [ ] Submit duplicate → verify duplicate response
- [ ] POST booking webhook → verify conflict on overlap
- [ ] Set WF-08 as error workflow → trigger intentional failure
