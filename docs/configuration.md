# Configuration

## Environment Variables

Copy `.env.example` to `.env`. Key variables:

| Variable | Purpose |
|----------|---------|
| `POSTGRES_*` | Database connection |
| `N8N_ENCRYPTION_KEY` | n8n credential encryption |
| `GENERIC_TIMEZONE` | Europe/London |
| `MAILPIT_SMTP_*` | Local email transport |
| `COMPANY_NAME` | Email templates |
| `OWNER_ALERT_EMAIL` | Priority/error alerts |
| `WEBHOOK_SECRET` | Optional webhook auth |
| `POSTCODE_API_ENABLED` | Optional postcodes.io lookup |
| `AI_ENRICHMENT_ENABLED` | Optional LLM classification (off by default) |

## PostgreSQL `automation_config`

Runtime business rules stored as JSON:

- `service_areas` — PRIMARY and EXTENDED postcode districts
- `qualification_weights` — scoring weights
- `follow_up_schedule` — hours/days between follow-ups
- `reminder_windows` — 24h and 2h offsets
- `working_hours` — booking validation (future)
- `owner_alert_email`, `review_url`

Update via SQL:

```sql
UPDATE automation_config
SET value = '{"primary": ["NN1","NN2","NN3","NN4","NN5"], "extended": ["NN6","NN7","NN8","NN9","NN10","NN11","NN12"]}'::jsonb
WHERE key = 'service_areas';
```

## n8n Credentials

After import, create:

1. **LocalFlow PostgreSQL** — Host: `postgres`, Port: `5432`, Database: `localflow`
2. **LocalFlow Mailpit SMTP** — Host: `mailpit`, Port: `1025`, Secure: false, No auth

## Webhook URLs

After activating workflows:

- Lead intake: `http://localhost:5678/webhook/lead-intake`
- Booking: `http://localhost:5678/webhook/booking/create`
- Job complete: `http://localhost:5678/webhook/job/complete`

Production: replace with HTTPS domain.
