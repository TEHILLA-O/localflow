#!/usr/bin/env python3
"""Generate synthetic demo data SQL for LocalFlow."""

import random
from pathlib import Path

random.seed(42)

FIRST = ["Sarah", "James", "Emily", "Oliver", "Charlotte", "William", "Amelia", "George", "Jessica", "Thomas",
         "Sophie", "Daniel", "Hannah", "Matthew", "Lucy", "Benjamin", "Rebecca", "Henry", "Laura", "Jack",
         "Megan", "Samuel", "Chloe", "Joseph", "Grace", "Ryan", "Ellie", "Adam", "Katie", "Lewis",
         "Nicola", "Andrew", "Victoria", "Christopher", "Rachel", "David", "Helen", "Michael", "Claire", "Robert",
         "Anna", "Peter", "Fiona", "Richard", "Susan", "Mark", "Julie", "Paul", "Karen", "Simon"]
LAST = ["Williams", "Brown", "Taylor", "Davies", "Wilson", "Evans", "Thomas", "Roberts", "Johnson", "Walker",
        "Wright", "Thompson", "White", "Hughes", "Edwards", "Green", "Hall", "Lewis", "Harris", "Clarke",
        "Patel", "Khan", "Singh", "Cooper", "Morgan", "Bennett", "Brooks", "Kelly", "Sanders", "Price",
        "Murphy", "Cook", "Rogers", "Bailey", "Reed", "Howard", "Ward", "Cox", "Richardson", "Foster"]
STREETS = ["Abington Avenue", "Kettering Road", "Wellingborough Road", "Bedford Road", "St James Road",
           "Kingsthorpe Grove", "Booth Lane", "Harlestone Road", "East Hunsbury", "Duston Main Road"]
POSTCODES = ["NN1 3ER", "NN2 6BT", "NN3 3HQ", "NN4 8LA", "NN5 5PL", "NN6 9DF", "NN7 1QW", "NN8 4RT", "NN10 6YU", "NN12 2OP", "PE25 8XX"]
SERVICES = ["PLUMBING", "ELECTRICAL", "HEATING", "PROPERTY_MAINTENANCE"]
STATUSES = ["QUALIFIED", "BOOKED", "COMPLETED", "CONTACTED", "DORMANT", "OUTSIDE_SERVICE_AREA", "DUPLICATE", "MANUAL_REVIEW", "CANCELLED"]
DESCRIPTIONS = [
    "Kitchen tap dripping constantly, needs repair.",
    "Boiler making unusual noise and losing pressure.",
    "Power socket in bedroom not working.",
    "Annual landlord safety inspection required.",
    "Water pouring from pipe under sink — urgent.",
    "Install new light fittings in lounge.",
    "Radiator not heating in upstairs bedroom.",
    "Replace broken garden fence panel.",
    "Emergency — sparking from fuse box.",
    "Leak under bathroom basin, water isolated.",
]

lines = ["-- LocalFlow demo data (synthetic, fictional)", "BEGIN;", ""]

# Customers
lines.append("INSERT INTO customers (first_name, last_name, email, phone, postcode, address_line_1, city) VALUES")
cust_rows = []
for i in range(75):
    fn, ln = random.choice(FIRST), random.choice(LAST)
    email = f"{fn.lower()}.{ln.lower()}{i}@example.demo"
    phone = f"07{random.randint(100,999)}{random.randint(100000,999999):06d}"[:11]
    phone_fmt = f"{phone[:5]} {phone[5:]}"
    pc = random.choice(POSTCODES[:10])
    addr = f"{random.randint(1,120)} {random.choice(STREETS)}"
    cust_rows.append(f"  ('{fn}', '{ln}', '{email}', '{phone_fmt}', '{pc}', '{addr}', 'Northampton')")
lines.append(",\n".join(cust_rows) + ";")
lines.append("")

# Reset sequences after demo refs
lines.append("SELECT setval('lead_ref_seq', 200);")
lines.append("SELECT setval('booking_ref_seq', 100);")
lines.append("SELECT setval('job_ref_seq', 80);")
lines.append("")

# Leads - 120 leads
lines.append("-- Leads")
for i in range(1, 121):
    cid = ((i - 1) % 75) + 1
    svc = random.choice(SERVICES)
    pc = random.choice(POSTCODES)
    district = pc.split()[0]
    area = "PRIMARY" if district in ["NN1","NN2","NN3","NN4","NN5"] else ("EXTENDED" if district.startswith("NN") else "OUTSIDE")
    status = random.choice(STATUSES)
    if area == "OUTSIDE":
        status = "OUTSIDE_SERVICE_AREA"
    score = random.randint(20, 95) if status not in ("OUTSIDE_SERVICE_AREA", "DUPLICATE", "INVALID") else random.randint(0, 30)
    rating = "VERY_HIGH" if score >= 80 else "HIGH" if score >= 65 else "MEDIUM" if score >= 45 else "LOW"
    urg = random.choice(["NORMAL", "URGENT", "EMERGENCY"])
    desc = random.choice(DESCRIPTIONS).replace("'", "''")
    ref = f"LEAD-2026-{i:06d}"
    lines.append(f"""INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('{ref}', {cid}, 'WEB_FORM', '{svc}', '{desc}', '{urg}'::urgency_level, '{pc}', '{district}', '{area}'::service_area_class, {score}, '{rating}'::qualification_rating, '["Demo seed data"]'::jsonb, '{status}'::lead_status, true, NOW() - INTERVAL '{random.randint(1,60)} days', NOW() - INTERVAL '{random.randint(1,60)} days');""")

lines.append("")
lines.append("-- Bookings (~45)")
booking_count = 0
for i in range(1, 46):
    lid = random.randint(1, 80)
    cid = ((lid - 1) % 75) + 1
    ref = f"BOOK-2026-{i:06d}"
    day_offset = random.randint(-14, 14)
    hour = random.choice([9, 10, 11, 14, 15, 16])
    status = random.choice(["BOOKED", "CONFIRMED", "COMPLETED", "CANCELLED"])
    tech = random.randint(1, 4)
    lines.append(f"""INSERT INTO bookings (booking_reference, lead_id, customer_id, start_at, end_at, service_type, technician_id, technician, status, confirmation_sent_at)
SELECT '{ref}', {lid}, {cid},
  (DATE_TRUNC('day', NOW()) + INTERVAL '{day_offset} days' + INTERVAL '{hour} hours'),
  (DATE_TRUNC('day', NOW()) + INTERVAL '{day_offset} days' + INTERVAL '{hour + 1} hours'),
  'PLUMBING', {tech}, (SELECT full_name FROM technicians WHERE id = {tech}), '{status}'::booking_status,
  CASE WHEN '{status}' != 'CANCELLED' THEN NOW() - INTERVAL '2 days' ELSE NULL END;""")
    booking_count += 1

lines.append("")
lines.append("-- Jobs (~35 completed)")
for i in range(1, 36):
    bid = random.randint(1, 45)
    ref = f"JOB-2026-{i:06d}"
    lines.append(f"""INSERT INTO jobs (job_reference, booking_id, lead_id, customer_id, status, started_at, completed_at, notes)
SELECT '{ref}', b.id, b.lead_id, b.customer_id, 'COMPLETED'::job_status,
  b.start_at, b.end_at, 'Demo completed job'
FROM bookings b WHERE b.id = {bid} LIMIT 1;""")

lines.append("")
lines.append("-- Communications sample")
lines.append("""INSERT INTO communications (customer_id, lead_id, channel, communication_type, recipient, subject, status, sent_at, idempotency_key)
SELECT customer_id, id, 'EMAIL', 'LEAD_ACKNOWLEDGEMENT', (SELECT email FROM customers c WHERE c.id = leads.customer_id), 'Enquiry received', 'SENT', created_at, 'demo-ack-' || id
FROM leads WHERE id <= 30;""")

lines.append("")
lines.append("-- Follow-ups sample")
lines.append("""INSERT INTO follow_ups (lead_id, follow_up_type, scheduled_for, sent_at, status, idempotency_key)
SELECT id, 'FOLLOW_UP_1', created_at + INTERVAL '2 hours', created_at + INTERVAL '2 hours', 'SENT', 'demo-fu1-' || id
FROM leads WHERE status IN ('CONTACTED','DORMANT') LIMIT 20;""")

lines.append("")
lines.append("-- Reviews sample")
lines.append("""INSERT INTO reviews (job_id, customer_id, request_sent_at, customer_satisfied, review_requested, review_status)
SELECT j.id, j.customer_id, j.completed_at + INTERVAL '1 day', true, true, 'REQUESTED'::review_status
FROM jobs j WHERE j.status = 'COMPLETED' LIMIT 25;""")

lines.append("")
lines.append("-- Audit events sample")
lines.append("""INSERT INTO audit_events (entity_type, entity_id, event_type, previous_state, new_state, workflow_name, metadata)
SELECT 'lead', id, 'STATUS_CHANGE', 'NEW', status::text, 'WF-01 Lead Intake', '{"demo": true}'::jsonb FROM leads LIMIT 15;""")

lines.append("")
lines.append("-- Workflow runs sample")
lines.append("""INSERT INTO workflow_runs (workflow_name, business_entity_type, business_entity_id, status, started_at, completed_at, duration_ms)
SELECT 'WF-01 Lead Intake', 'lead', id, 'SUCCESS', created_at, created_at + INTERVAL '3 seconds', 3000 FROM leads LIMIT 50;""")

lines.append("")
lines.append("COMMIT;")

out = Path(__file__).resolve().parent.parent / "database" / "init" / "003-demo-data.sql"
out.write_text("\n".join(lines), encoding="utf-8")
print(f"Generated {out} ({len(lines)} statements)")
