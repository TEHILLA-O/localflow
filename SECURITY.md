# Security

## Secret Management

Never commit:

- `.env` (gitignored)
- SMTP passwords, API keys, n8n encryption keys
- OAuth tokens, webhook secrets (use placeholders in `.env.example`)

Generate `N8N_ENCRYPTION_KEY` with at least 32 random characters for production.

## Demo vs Production

| Control | Demo | Production |
|---------|------|------------|
| n8n authentication | Optional | Required |
| Webhook HTTPS | HTTP localhost | TLS + auth |
| Database exposure | Port mapped for dev | Internal only |
| Email | Mailpit only | Verified SMTP domain |

## Webhook Security

WF-01 accepts optional `X-Webhook-Secret` header (document in configuration). Production should implement:

- HTTPS termination
- Shared secret or HMAC signature validation
- Rate limiting and replay protection

## Database Access

- Use least-privilege PostgreSQL roles
- Separate n8n system user from business application user in production
- Enable SSL for remote connections

## Credential Export

Workflow JSON uses credential **names** only (`LocalFlow PostgreSQL`, `LocalFlow Mailpit SMTP`). Users configure credentials manually after import.

## Logging

Avoid logging full customer PII in n8n execution data retention policies. Production should configure execution data pruning.

## GDPR / Privacy

This demo processes synthetic personal data to illustrate automation patterns.

**Data minimisation:** Only collect fields needed for service delivery.

**Lawful basis:** Demo assumes `consent_to_contact` checkbox; production requires organisation-specific legal basis documentation.

**Retention:** Document and implement retention periods for leads, communications, and audit logs.

**Access & deletion:** Production requires subject access request and erasure procedures.

**Encryption:** Recommend TLS in transit and encrypted backups at rest.

**Disclaimer:** This repository is **not** automatically GDPR-compliant. Production deployment requires organisation-specific review.

## Production Checklist

- [ ] Rotate all default passwords
- [ ] Enable n8n basic auth or SSO
- [ ] Restrict PostgreSQL network access
- [ ] Configure HTTPS reverse proxy
- [ ] Set webhook authentication
- [ ] Configure backup encryption
- [ ] Review execution data retention
- [ ] Document privacy policy and retention schedule
