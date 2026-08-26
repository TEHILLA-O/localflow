# Screenshots (Portfolio Guide)

Automated screenshot generation is not included. Capture these manually after running the demo:

## Recommended Captures

1. **Docker services running** — `docker compose ps` showing healthy postgres, mailpit, n8n
2. **Workflow overview** — n8n canvas showing all LocalFlow workflows
3. **WF-01 Lead Intake** — full canvas with sticky notes
4. **WF-02 Qualification** — scoring Code node
5. **Emergency branch** — WF-01 owner alert path
6. **WF-04 Booking** — conflict detection nodes
7. **WF-05 Reminders** — schedule trigger + idempotent updates
8. **WF-08 Error Handler** — classification flow
9. **n8n execution history** — successful lead intake run
10. **Mailpit** — customer acknowledgement email
11. **Daily report email** — WF-09 output in Mailpit
12. **PostgreSQL** — `SELECT * FROM leads ORDER BY id DESC LIMIT 5`

## Commands for Database Screenshot

```sql
SELECT lead_reference, status, qualification_score, qualification_rating, service_area
FROM leads ORDER BY created_at DESC LIMIT 10;
```

## Demo Recording Flow

See README portfolio demo flow (20 steps). Record at 1080p with Mailpit and n8n side-by-side.
