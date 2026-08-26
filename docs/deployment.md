# Deployment

## Local Development

```bash
docker compose up -d
```

Database initialises from `database/init/*.sql` on first run.

## Production Recommendations

### Infrastructure

- VPS or cloud VM with Docker
- Reverse proxy (Caddy, Traefik, nginx) with TLS
- Managed PostgreSQL or dedicated container with persistent volumes

### n8n

- Set strong `N8N_ENCRYPTION_KEY`
- Enable basic auth or SSO
- Configure error workflow (WF-08)
- Consider queue mode for high volume
- Set execution data retention policy

### PostgreSQL

- Automated daily backups (`scripts/backup-db.sh`)
- Test restoration monthly
- Encrypt backup storage
- Do not expose port 5432 publicly

### Email

Replace Mailpit with verified SMTP (SendGrid, Amazon SES, etc.). Update n8n SMTP credential only—workflow logic unchanged.

### Monitoring

- Docker health checks (included in compose)
- External uptime monitor on n8n `/healthz`
- Alert on `workflow_errors` count

## Backup Strategy

```bash
make backup
# or
bash scripts/backup-db.sh
```

Backups written to `backups/localflow_YYYYMMDD_HHMMSS.sql`.

Production: off-site encrypted storage, retention policy (e.g., 30 daily, 12 monthly).

## Scaling Considerations

Documented in README limitations. Local demo is single-instance. Future: n8n workers, read replicas, email throttling.

## CRM / Calendar Adapters

Database remains system of record. Future integrations sync via adapter workflows without rewriting core business logic.
