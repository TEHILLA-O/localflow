# Architecture

## System Context

LocalFlow serves a fictional local trades business receiving web/form enquiries. External actors: customers (forms/webhooks), business owner (Mailpit alerts/reports), operators (n8n UI, PostgreSQL).

```mermaid
C4Context
    title LocalFlow System Context
    Person(customer, "Customer", "Submits service enquiry")
    Person(owner, "Business Owner", "Receives alerts and reports")
    System(localflow, "LocalFlow", "n8n automation platform")
    System_Ext(mailpit, "Mailpit", "Local SMTP inbox")
    Rel(customer, localflow, "Form / Webhook")
    Rel(localflow, mailpit, "SMTP")
    Rel(localflow, owner, "Email via Mailpit")
```

## Component Diagram

```mermaid
flowchart TB
    subgraph Docker Compose
        N8N[n8n]
        PG[(PostgreSQL)]
        MP[Mailpit]
    end
    N8N --> PG
    N8N --> MP
    WH[Webhooks / Forms] --> N8N
```

## Workflow Relationships

```mermaid
flowchart TD
    W1[WF-01 Lead Intake] --> W3[WF-03 Service Area]
    W1 --> W2[WF-02 Qualification]
    W1 --> W4[WF-04 Booking]
    W4 --> W5[WF-05 Reminders]
    W4 --> W7[WF-07 Completion]
    W6[WF-06 Follow-Up] --> PG[(PostgreSQL)]
    W9[WF-09 Daily Brief] --> PG
    W10[WF-10 Weekly Report] --> PG
    ERR[WF-08 Error Handler] --> PG
```

## Lead Lifecycle

See README state machine. Transitions enforced in SQL UPDATE nodes.

## Database Design

PostgreSQL holds all business entities. n8n uses separate schema tables managed by n8n itself on the same database instance (self-hosted pattern).

See [data-model.md](data-model.md) for ER diagram.

## Communication Layer

Demo: SMTP → Mailpit. Production adapters documented for email/SMS/WhatsApp. Business logic passes recipient + template type; transport is swappable.

## Error Architecture

Any workflow can delegate failures to WF-08 via n8n error workflow setting. Errors classified, persisted, optionally retried (bounded), escalated to owner.

## Docker Architecture

Three services on `localflow` bridge network. Health checks gate n8n startup on postgres + mailpit readiness. Init SQL mounted to `/docker-entrypoint-initdb.d`.

## Production Deployment Model

- Reverse proxy (TLS termination)
- Secrets manager for `.env`
- Dedicated PostgreSQL with backups
- n8n queue mode for scale
- Webhook authentication + rate limits

## Security Boundaries

| Boundary | Demo | Production |
|----------|------|------------|
| n8n UI | Open | Basic auth / SSO |
| Webhooks | Optional secret | HMAC + HTTPS |
| Database | Docker internal | Private network |
| Email | Mailpit | Real SMTP provider |
