# Demo simulation scenarios for LocalFlow

See `scripts/run-case-study-demo.py` for automated execution.

## Scenario A — Normal Lead
Valid NN3 plumbing enquiry → acknowledgement → booking → reminders → completion → review.

## Scenario B — Emergency Lead
Active leak keywords + EMERGENCY urgency → VERY_HIGH score → owner alert.

## Scenario C — Outside Service Area
Postcode PE25 8XX → OUTSIDE_SERVICE_AREA status → polite decline email.

## Scenario D — Duplicate Submission
Same fingerprint within 48h → EXACT_DUPLICATE → no new lead.

## Scenario E — Invalid Form
Missing email/phone → validation error → HTTP 400 → no lead record.

## Scenario F — Follow-Up Recovery
QUALIFIED lead without booking → FOLLOW_UP_1 after 2h → books → sequence stops.

## Scenario G — Cancelled Appointment
CANCELLED booking → reminder workflow skips.

## Scenario H — Workflow Failure
Simulated API/DB failure → WF-08 records error → owner alert if manual action required.

## Scenario I — Unsatisfied Customer
Job COMPLETED → satisfaction NO → review suppressed → service recovery alert.
