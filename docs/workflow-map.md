# Workflow Map

## Primary Flow

```
WF-01 Lead Intake
    ↓ Execute Workflow
WF-03 Service Area Check
    ↓ Execute Workflow
WF-02 Lead Qualification
    ↓
Customer Acknowledgement + Owner Alert (if high priority)
```

## Booking Flow

```
WF-04 Booking Management (webhook: booking/create)
    ↓
Conflict Check → Create Booking → Confirmation Email
```

## Scheduled Systems

| Workflow | Schedule | Purpose |
|----------|----------|---------|
| WF-05 | */15 * * * * | 24h and 2h reminders |
| WF-06 | 0 * * * * | Lead follow-ups |
| WF-09 | 0 7 * * * | Daily operations brief |
| WF-10 | 0 8 * * 1 | Weekly business report |

## Shared / Cross-Cutting

**WF-08 Error Handler** — n8n error workflow; all workflows should delegate here.

## Input/Output Contracts

### WF-01 Lead Intake

**Input:** Form fields or JSON webhook body  
**Output:** `{ success, lead_reference, qualification_score, qualification_rating, service_area }`

### WF-03 Service Area Check

**Input:** `{ postcode, postcode_district, email, ... }`  
**Output:** `{ service_area: PRIMARY|EXTENDED|OUTSIDE, ... }`

### WF-02 Lead Qualification

**Input:** Lead + service area fields  
**Output:** `{ qualification_score, qualification_rating, qualification_reasons[], lead_status }`

### WF-04 Booking Management

**Input:** `{ lead_id, start_at, end_at, technician_id?, customer_email? }`  
**Output:** `{ success, booking_reference }` or `{ error: BOOKING_CONFLICT }`

### WF-07 Job Completion

**Input:** `{ job_id }` via webhook  
**Satisfaction webhook:** `{ job_id, satisfied: true|false }`
