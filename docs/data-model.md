# Data Model

## Entity Relationship Diagram

```mermaid
erDiagram
    CUSTOMERS ||--o{ LEADS : has
    CUSTOMERS ||--o{ BOOKINGS : has
    LEADS ||--o{ BOOKINGS : converts_to
    BOOKINGS ||--o| JOBS : becomes
    LEADS ||--o{ COMMUNICATIONS : receives
    LEADS ||--o{ FOLLOW_UPS : has
    JOBS ||--o| REVIEWS : has
    CUSTOMERS ||--o{ COMMUNICATIONS : receives

    CUSTOMERS {
        int id PK
        string email UK
        string postcode
        enum customer_status
    }

    LEADS {
        int id PK
        string lead_reference UK
        int customer_id FK
        enum status
        int qualification_score
        enum service_area
    }

    BOOKINGS {
        int id PK
        string booking_reference UK
        timestamptz start_at
        timestamptz end_at
        enum status
    }

    JOBS {
        int id PK
        string job_reference UK
        enum status
    }
```

## Tables

| Table | Purpose |
|-------|---------|
| `customers` | Contact and address records |
| `leads` | Enquiry pipeline with qualification |
| `bookings` | Scheduled appointments |
| `jobs` | Completed work units |
| `communications` | Email/SMS audit with idempotency |
| `follow_ups` | Scheduled nurture messages |
| `reviews` | Satisfaction and review requests |
| `audit_events` | State change trail |
| `workflow_runs` | Automation execution log |
| `workflow_errors` | Failure tracking |
| `reporting_snapshots` | Stored report metrics |
| `automation_config` | Runtime business settings |
| `service_definitions` | Supported service catalogue |
| `technicians` | Fictional staff for scheduling |

## Reference Formats

- Leads: `LEAD-YYYY-NNNNNN`
- Bookings: `BOOK-YYYY-NNNNNN`
- Jobs: `JOB-YYYY-NNNNNN`

Generated via PostgreSQL functions `generate_lead_reference()`, etc.

## Indexes

See `database/init/002-indexes.sql` for query optimisation on status, fingerprints, booking times, and reminder eligibility.
