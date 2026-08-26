#!/usr/bin/env python3
"""Generate n8n workflow JSON files for LocalFlow case study."""

import json
import uuid
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
WORKFLOWS_DIR = ROOT / "workflows"


def node_id():
    return str(uuid.uuid4())


def pos(x, y):
    return [x, y]


def sticky(content, x, y, w=300, h=120):
    return {
        "parameters": {"content": content, "width": w, "height": h},
        "id": node_id(),
        "name": content.split("\n")[0][:40],
        "type": "n8n-nodes-base.stickyNote",
        "typeVersion": 1,
        "position": pos(x, y),
    }


def code_node(name, js, x, y):
    return {
        "parameters": {"jsCode": js},
        "id": node_id(),
        "name": name,
        "type": "n8n-nodes-base.code",
        "typeVersion": 2,
        "position": pos(x, y),
    }


def postgres_node(name, query, x, y, op="executeQuery"):
    return {
        "parameters": {
            "operation": op,
            "query": query,
            "options": {},
        },
        "id": node_id(),
        "name": name,
        "type": "n8n-nodes-base.postgres",
        "typeVersion": 2.5,
        "position": pos(x, y),
        "credentials": {"postgres": {"id": "LOCALFLOW_POSTGRES", "name": "LocalFlow PostgreSQL"}},
    }


def email_node(name, subject_expr, body_expr, x, y, to_expr="={{ $json.recipient || $json.email }}"):
    return {
        "parameters": {
            "fromEmail": "office@northamptonhomeservices.demo",
            "toEmail": to_expr,
            "subject": subject_expr,
            "emailFormat": "text",
            "text": body_expr,
            "options": {},
        },
        "id": node_id(),
        "name": name,
        "type": "n8n-nodes-base.emailSend",
        "typeVersion": 2.1,
        "position": pos(x, y),
        "credentials": {"smtp": {"id": "LOCALFLOW_MAILPIT", "name": "LocalFlow Mailpit SMTP"}},
    }


def if_node(name, condition_left, condition_right, x, y):
    return {
        "parameters": {
            "conditions": {
                "options": {"caseSensitive": True, "leftValue": "", "typeValidation": "strict"},
                "conditions": [
                    {
                        "id": node_id(),
                        "leftValue": condition_left,
                        "rightValue": condition_right,
                        "operator": {"type": "boolean", "operation": "true", "singleValue": True},
                    }
                ],
                "combinator": "and",
            },
            "options": {},
        },
        "id": node_id(),
        "name": name,
        "type": "n8n-nodes-base.if",
        "typeVersion": 2.2,
        "position": pos(x, y),
    }


def execute_workflow_node(name, workflow_name, x, y):
    return {
        "parameters": {
            "workflowId": {"__rl": True, "mode": "name", "value": workflow_name},
            "options": {},
        },
        "id": node_id(),
        "name": name,
        "type": "n8n-nodes-base.executeWorkflow",
        "typeVersion": 1.2,
        "position": pos(x, y),
    }


def webhook_node(name, path, x, y, method="POST"):
    return {
        "parameters": {
            "httpMethod": method,
            "path": path,
            "responseMode": "responseNode",
            "options": {},
        },
        "id": node_id(),
        "name": name,
        "type": "n8n-nodes-base.webhook",
        "typeVersion": 2,
        "position": pos(x, y),
        "webhookId": node_id(),
    }


def form_trigger_node(name, x, y):
    return {
        "parameters": {
            "formTitle": "Northampton Home Services — Service Enquiry",
            "formDescription": "Request plumbing, electrical, heating or property maintenance in Northampton.",
            "formFields": {
                "values": [
                    {"fieldLabel": "First Name", "fieldType": "text", "requiredField": True},
                    {"fieldLabel": "Last Name", "fieldType": "text", "requiredField": True},
                    {"fieldLabel": "Email", "fieldType": "email", "requiredField": True},
                    {"fieldLabel": "Phone", "fieldType": "text", "requiredField": True},
                    {"fieldLabel": "Postcode", "fieldType": "text", "requiredField": True},
                    {
                        "fieldLabel": "Service Required",
                        "fieldType": "dropdown",
                        "requiredField": True,
                        "fieldOptions": {
                            "values": [
                                {"option": "PLUMBING"},
                                {"option": "ELECTRICAL"},
                                {"option": "HEATING"},
                                {"option": "PROPERTY_MAINTENANCE"},
                            ]
                        },
                    },
                    {"fieldLabel": "Description", "fieldType": "textarea", "requiredField": True},
                    {"fieldLabel": "Preferred Date", "fieldType": "date"},
                    {"fieldLabel": "Preferred Time", "fieldType": "text"},
                    {
                        "fieldLabel": "Urgency",
                        "fieldType": "dropdown",
                        "fieldOptions": {
                            "values": [
                                {"option": "NORMAL"},
                                {"option": "URGENT"},
                                {"option": "EMERGENCY"},
                            ]
                        },
                    },
                    {"fieldLabel": "Consent To Contact", "fieldType": "checkbox", "requiredField": True},
                ]
            },
            "options": {},
        },
        "id": node_id(),
        "name": name,
        "type": "n8n-nodes-base.formTrigger",
        "typeVersion": 2.2,
        "position": pos(x, y),
        "webhookId": node_id(),
    }


def schedule_node(name, cron, x, y):
    return {
        "parameters": {"rule": {"interval": [{"field": "cronExpression", "expression": cron}]}},
        "id": node_id(),
        "name": name,
        "type": "n8n-nodes-base.scheduleTrigger",
        "typeVersion": 1.2,
        "position": pos(x, y),
    }


def respond_node(name, x, y, body_expr="={{ $json }}"):
    return {
        "parameters": {
            "respondWith": "json",
            "responseBody": body_expr,
            "options": {"responseCode": "={{ $json.http_status || 200 }}"},
        },
        "id": node_id(),
        "name": name,
        "type": "n8n-nodes-base.respondToWebhook",
        "typeVersion": 1.1,
        "position": pos(x, y),
    }


def error_trigger_node(name, x, y):
    return {
        "parameters": {},
        "id": node_id(),
        "name": name,
        "type": "n8n-nodes-base.errorTrigger",
        "typeVersion": 1,
        "position": pos(x, y),
    }


def build_connections(pairs):
    """pairs: list of (from_name, to_name) or (from_name, to_name, output_index)."""
    conn = {}
    for item in pairs:
        src, dst = item[0], item[1]
        idx = item[2] if len(item) > 2 else 0
        conn.setdefault(src, {"main": []})
        while len(conn[src]["main"]) <= idx:
            conn[src]["main"].append([])
        conn[src]["main"][idx].append({"node": dst, "type": "main", "index": 0})
    return conn


def save_workflow(filename, name, nodes, connections, settings=None):
    wf = {
        "id": node_id(),
        "name": name,
        "nodes": nodes,
        "connections": connections,
        "active": False,
        "settings": settings or {"executionOrder": "v1"},
        "versionId": node_id(),
        "meta": {"instanceId": "localflow-case-study"},
        "tags": [],
    }
    path = WORKFLOWS_DIR / filename
    path.write_text(json.dumps(wf, indent=2), encoding="utf-8")
    print(f"Generated {path.name}")


# Shared JS snippets
NORMALIZE_JS = r"""
const input = $input.first().json.body || $input.first().json;
const errors = [];

function normEmail(e) {
  if (!e || typeof e !== 'string') return null;
  const v = e.trim().toLowerCase();
  return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(v) ? v : null;
}

function normPhone(p) {
  if (!p) return null;
  let d = String(p).replace(/[^\d+]/g, '');
  if (d.startsWith('0044')) d = '+44' + d.slice(4);
  if (d.startsWith('44') && !d.startsWith('+')) d = '+' + d;
  if (d.startsWith('+44')) d = '0' + d.slice(3);
  if (!/^07\d{9}$/.test(d)) return null;
  return d.replace(/(\d{5})(\d{6})/, '$1 $2');
}

function normPostcode(pc) {
  if (!pc) return { valid: false, normalized: null, district: null };
  const raw = String(pc).toUpperCase().replace(/\s+/g, '');
  const m = raw.match(/^([A-Z]{1,2}\d[A-Z\d]?)(\d[A-Z]{2})$/);
  if (!m) return { valid: false, normalized: null, district: null };
  const normalized = `${m[1]} ${m[2]}`;
  const district = m[1].match(/^[A-Z]{1,2}\d+/)?.[0] || null;
  return { valid: true, normalized, district };
}

const email = normEmail(input.email || input.Email);
const phone = normPhone(input.phone || input.Phone);
const postcodeInfo = normPostcode(input.postcode || input.Postcode);

['first_name','last_name','description','service_required'].forEach(f => {
  const alt = f.replace('_',' ').replace(/\b\w/g,c=>c.toUpperCase()).replace(' ',' ');
});
const firstName = (input.first_name || input['First Name'] || '').trim();
const lastName = (input.last_name || input['Last Name'] || '').trim();
const description = (input.description || input.Description || '').trim();
const service = (input.service_required || input['Service Required'] || '').trim().toUpperCase();
const consent = Boolean(input.consent_to_contact ?? input['Consent To Contact']);

if (!firstName) errors.push('first_name required');
if (!lastName) errors.push('last_name required');
if (!email) errors.push('valid email required');
if (!phone) errors.push('valid UK mobile required');
if (!postcodeInfo.valid) errors.push('valid UK postcode required');
if (!description) errors.push('description required');
if (!service) errors.push('service_required required');
if (!consent) errors.push('consent_to_contact required');

const emergencyKw = ['flood','burst pipe','sparking','burning smell','no power','active leak','water everywhere','boiler leak'];
let urgency = (input.urgency || input.Urgency || 'NORMAL').toUpperCase();
const descLower = description.toLowerCase();
if (emergencyKw.some(k => descLower.includes(k))) urgency = 'EMERGENCY';

const fingerprint = [email, phone, postcodeInfo.normalized, service, descLower.slice(0,120)].join('|');

return [{
  json: {
    valid: errors.length === 0,
    errors,
    first_name: firstName,
    last_name: lastName,
    email,
    phone,
    postcode: postcodeInfo.normalized,
    postcode_district: postcodeInfo.district,
    service_required: service,
    description,
    preferred_date: input.preferred_date || input['Preferred Date'] || null,
    preferred_time: input.preferred_time || input['Preferred Time'] || null,
    urgency,
    consent_to_contact: consent,
    content_fingerprint: fingerprint,
    source: input.source || 'WEB_FORM',
    received_at: new Date().toISOString()
  }
}];
"""

SERVICE_AREA_JS = r"""
const item = $input.first().json;
const district = item.postcode_district || item.postcode?.split(' ')[0];
const primary = ['NN1','NN2','NN3','NN4','NN5'];
const extended = ['NN6','NN7','NN8','NN9','NN10','NN11','NN12'];
let service_area = 'OUTSIDE';
if (primary.includes(district)) service_area = 'PRIMARY';
else if (extended.includes(district)) service_area = 'EXTENDED';
return [{ json: { ...item, service_area, postcode_district: district, api_fallback_used: true } }];
"""

QUALIFICATION_JS = r"""
const item = $input.first().json;
const reasons = [];
let score = 0;
const weights = {
  primary_area: 25, extended_area: 15, emergency: 20, urgent: 12,
  supported_service: 20, complete_contact: 10, preferred_appointment: 5,
  detailed_description: 5, returning_customer: 5,
  unsupported_service: -40, outside_area: -50, missing_info: -20
};
const supported = ['PLUMBING','ELECTRICAL','HEATING','PROPERTY_MAINTENANCE'];

if (item.service_area === 'PRIMARY') { score += weights.primary_area; reasons.push('Primary service area: +25'); }
else if (item.service_area === 'EXTENDED') { score += weights.extended_area; reasons.push('Extended service area: +15'); }
else { score += weights.outside_area; reasons.push('Outside service area: -50'); }

if (item.urgency === 'EMERGENCY') { score += weights.emergency; reasons.push('Emergency request: +20'); }
else if (item.urgency === 'URGENT') { score += weights.urgent; reasons.push('Urgent request: +12'); }

if (supported.includes(item.service_required)) { score += weights.supported_service; reasons.push(`Supported ${item.service_required.toLowerCase()} service: +20`); }
else { score += weights.unsupported_service; reasons.push('Unsupported service: -40'); }

if (item.email && item.phone && item.postcode) { score += weights.complete_contact; reasons.push('Complete contact details: +10'); }
else { score += weights.missing_info; reasons.push('Missing essential information: -20'); }

if (item.preferred_date) { score += weights.preferred_appointment; reasons.push('Preferred booking date provided: +5'); }
if ((item.description || '').length >= 40) { score += weights.detailed_description; reasons.push('Detailed description: +5'); }
if (item.is_returning_customer) { score += weights.returning_customer; reasons.push('Returning customer: +5'); }

score = Math.max(0, Math.min(100, score));
let rating = 'VERY_LOW';
if (score >= 80) rating = 'VERY_HIGH';
else if (score >= 65) rating = 'HIGH';
else if (score >= 45) rating = 'MEDIUM';
else if (score >= 25) rating = 'LOW';

let status = item.service_area === 'OUTSIDE' ? 'OUTSIDE_SERVICE_AREA' : 'QUALIFIED';
if (item.service_area === 'EXTENDED' && score < 45) status = 'MANUAL_REVIEW';
if (!supported.includes(item.service_required)) status = 'MANUAL_REVIEW';

return [{ json: { ...item, qualification_score: score, qualification_rating: rating, qualification_reasons: reasons, lead_status: status } }];
"""


def generate_sub_workflows():
    nodes = [
        sticky("Sub-workflow: Validate & Normalise Postcode", -200, 0),
        code_node("Normalise Postcode Input", SERVICE_AREA_JS.replace("service_area", "postcode_check"), 200, 0),
        respond_node("Return Postcode Result", 500, 0),
    ]
    save_workflow("sub-validate-postcode.json", "Sub: Validate Postcode", nodes,
                  build_connections([("Normalise Postcode Input", "Return Postcode Result")]))


def generate_wf03():
    nodes = [
        sticky("WF-03 Service Area Check\nConfigurable NN districts", -200, 100),
        code_node("Calculate Service Area", SERVICE_AREA_JS, 0, 200),
        if_node("Is Outside Service Area?", "={{ $json.service_area === 'OUTSIDE' }}", "", 300, 200),
        email_node(
            "Send Outside Area Response",
            "={{ 'Thank you for contacting Northampton Home Services — Ref pending' }}",
            "={{ 'Thank you for your enquiry. Unfortunately your postcode (' + $json.postcode + ') is outside our standard service area. We primarily serve Northampton (NN1–NN12). If you believe this is an error, please call 01604 000000.' }}",
            600, 100,
            "={{ $json.email }}",
        ),
        respond_node("Return Service Area Classification", 600, 300),
    ]
    conns = build_connections([
        ("Calculate Service Area", "Is Outside Service Area?"),
        ("Is Outside Service Area?", "Send Outside Area Response", 0),
        ("Is Outside Service Area?", "Return Service Area Classification", 1),
        ("Send Outside Area Response", "Return Service Area Classification"),
    ])
    save_workflow("03-service-area-check.json", "WF-03 Service Area Check", nodes, conns)


def generate_wf02():
    nodes = [
        sticky("WF-02 Lead Qualification\nDeterministic scoring 0-100", -200, 100),
        code_node("Calculate Qualification Score", QUALIFICATION_JS, 0, 200),
        respond_node("Return Qualification Result", 400, 200),
    ]
    save_workflow("02-lead-qualification.json", "WF-02 Lead Qualification", nodes,
                  build_connections([("Calculate Qualification Score", "Return Qualification Result")]))


def generate_wf01():
    nodes = [
        sticky("1. Input Validation\n2. Customer Matching\n3. Lead Creation\n4. Orchestration", -400, 0, 350, 200),
        form_trigger_node("Customer Enquiry Form", 0, 0),
        webhook_node("Lead Intake Webhook", "lead-intake", 0, 200),
        code_node("Normalise and Validate Lead Payload", NORMALIZE_JS, 300, 100),
        if_node("Validation Passed?", "={{ $json.valid }}", "", 600, 100),
        respond_node("Return Validation Error", 900, 0, "={{ { success: false, errors: $json.errors, http_status: 400 } }}"),
        postgres_node(
            "Check Duplicate Lead",
            """SELECT l.id, l.lead_reference, l.status,
  CASE
    WHEN l.content_fingerprint = '{{ $json.content_fingerprint }}' THEN 'EXACT_DUPLICATE'
    WHEN l.created_at > NOW() - INTERVAL '48 hours'
      AND c.email = '{{ $json.email }}'
      AND l.service_category = '{{ $json.service_required }}' THEN 'LIKELY_DUPLICATE'
    ELSE 'NEW'
  END AS duplicate_classification
FROM leads l
JOIN customers c ON c.id = l.customer_id
WHERE l.content_fingerprint = '{{ $json.content_fingerprint }}'
   OR (c.email = '{{ $json.email }}' AND l.created_at > NOW() - INTERVAL '48 hours' AND l.service_category = '{{ $json.service_required }}')
ORDER BY l.created_at DESC LIMIT 1;""",
            900, 200,
        ),
        if_node("Is Duplicate?", "={{ ['EXACT_DUPLICATE','LIKELY_DUPLICATE'].includes($json.duplicate_classification) }}", "", 1200, 200),
        respond_node("Return Duplicate Response", 1500, 100,
                     "={{ { success: true, duplicate: true, lead_reference: $json.lead_reference, message: 'We already have your enquiry on file.' } }}"),
        postgres_node(
            "Create or Match Customer",
            """INSERT INTO customers (first_name, last_name, email, phone, postcode)
VALUES ('{{ $('Normalise and Validate Lead Payload').item.json.first_name }}',
        '{{ $('Normalise and Validate Lead Payload').item.json.last_name }}',
        '{{ $('Normalise and Validate Lead Payload').item.json.email }}',
        '{{ $('Normalise and Validate Lead Payload').item.json.phone }}',
        '{{ $('Normalise and Validate Lead Payload').item.json.postcode }}')
ON CONFLICT DO NOTHING;
SELECT id, (xmax = 0) AS is_new FROM customers WHERE email = '{{ $('Normalise and Validate Lead Payload').item.json.email }}' LIMIT 1;""",
            1500, 300,
        ),
        postgres_node(
            "Create Lead Record",
            """WITH nr AS (SELECT generate_lead_reference() AS ref)
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, status, preferred_date, preferred_time, content_fingerprint, consent_to_contact)
SELECT nr.ref, {{ $json.id }}, '{{ $('Normalise and Validate Lead Payload').item.json.source }}',
  '{{ $('Normalise and Validate Lead Payload').item.json.service_required }}',
  '{{ $('Normalise and Validate Lead Payload').item.json.description.replace(/'/g, "''") }}',
  '{{ $('Normalise and Validate Lead Payload').item.json.urgency }}'::urgency_level,
  '{{ $('Normalise and Validate Lead Payload').item.json.postcode }}',
  '{{ $('Normalise and Validate Lead Payload').item.json.postcode_district }}',
  'NEW'::lead_status,
  NULLIF('{{ $('Normalise and Validate Lead Payload').item.json.preferred_date }}','')::date,
  NULLIF('{{ $('Normalise and Validate Lead Payload').item.json.preferred_time }}','')::time,
  '{{ $('Normalise and Validate Lead Payload').item.json.content_fingerprint }}',
  true
FROM nr RETURNING *;""",
            1800, 300,
        ),
        code_node("Prepare Service Area Input", "return [{ json: { ...$('Normalise and Validate Lead Payload').item.json, lead_id: $json.id, lead_reference: $json.lead_reference, email: $('Normalise and Validate Lead Payload').item.json.email } }];", 2100, 300),
        execute_workflow_node("Call Service Area Workflow", "WF-03 Service Area Check", 2400, 200),
        execute_workflow_node("Call Qualification Workflow", "WF-02 Lead Qualification", 2700, 200),
        postgres_node(
            "Update Lead After Qualification",
            """UPDATE leads SET
  service_area = '{{ $json.service_area }}'::service_area_class,
  qualification_score = {{ $json.qualification_score }},
  qualification_rating = '{{ $json.qualification_rating }}'::qualification_rating,
  qualification_reasons = '{{ JSON.stringify($json.qualification_reasons).replace(/'/g, "''") }}'::jsonb,
  status = '{{ $json.lead_status }}'::lead_status,
  first_contact_at = NOW(),
  updated_at = NOW()
WHERE id = {{ $('Create Lead Record').item.json.id }}
RETURNING *;""",
            3000, 200,
        ),
        if_node("Very High Priority?", "={{ ['VERY_HIGH','HIGH'].includes($json.qualification_rating) || $json.urgency === 'EMERGENCY' }}", "", 3300, 200),
        email_node(
            "Send Owner Priority Alert",
            "={{ 'HIGH PRIORITY LEAD — ' + $json.lead_reference }}",
            "={{ 'HIGH PRIORITY LEAD\\n\\nLead: ' + $json.lead_reference + '\\nCustomer: ' + $('Normalise and Validate Lead Payload').item.json.first_name + ' ' + $('Normalise and Validate Lead Payload').item.json.last_name + '\\nService: ' + $json.service_category + '\\nPostcode: ' + $json.postcode + '\\nScore: ' + $json.qualification_score + '/100\\nUrgency: ' + $json.urgency + '\\n\\nAction: Contact customer immediately.' }}",
            3600, 100,
            "owner@northamptonhomeservices.demo",
        ),
        email_node(
            "Send Customer Acknowledgement",
            "={{ 'Enquiry received — ' + $json.lead_reference }}",
            "={{ 'Dear ' + $('Normalise and Validate Lead Payload').item.json.first_name + ',\\n\\nThank you for contacting Northampton Home Services Ltd.\\n\\nReference: ' + $json.lead_reference + '\\nService: ' + $json.service_category + '\\nPostcode: ' + $json.postcode + '\\n\\nWe will review your enquiry and contact you shortly. This is not a confirmed appointment.\\n\\nNorthampton Home Services Ltd' }}",
            3600, 300,
            "={{ $('Normalise and Validate Lead Payload').item.json.email }}",
        ),
        postgres_node(
            "Log Communication Records",
            """INSERT INTO communications (customer_id, lead_id, channel, communication_type, recipient, subject, status, sent_at, idempotency_key)
VALUES
({{ $json.customer_id }}, {{ $json.id }}, 'EMAIL', 'LEAD_ACKNOWLEDGEMENT', '{{ $('Normalise and Validate Lead Payload').item.json.email }}', 'Enquiry received', 'SENT', NOW(), 'ack-' || {{ $json.id }}),
({{ $json.customer_id }}, {{ $json.id }}, 'EMAIL', 'OWNER_ALERT', 'owner@northamptonhomeservices.demo', 'Priority lead alert', 'SENT', NOW(), 'alert-' || {{ $json.id }})
ON CONFLICT (idempotency_key) DO NOTHING RETURNING id;""",
            3900, 200,
        ),
        postgres_node(
            "Log Successful Execution",
            """INSERT INTO workflow_runs (workflow_name, business_entity_type, business_entity_id, status, completed_at, duration_ms)
VALUES ('WF-01 Lead Intake', 'lead', {{ $json.id }}, 'SUCCESS', NOW(), 0) RETURNING id;""",
            4200, 200,
        ),
        respond_node("Return Success Response", 4500, 200,
                     "={{ { success: true, lead_reference: $('Create Lead Record').item.json.lead_reference, qualification_score: $json.qualification_score, qualification_rating: $json.qualification_rating, service_area: $json.service_area } }}"),
    ]
    conns = build_connections([
        ("Customer Enquiry Form", "Normalise and Validate Lead Payload"),
        ("Lead Intake Webhook", "Normalise and Validate Lead Payload"),
        ("Normalise and Validate Lead Payload", "Validation Passed?"),
        ("Validation Passed?", "Check Duplicate Lead", 0),
        ("Validation Passed?", "Return Validation Error", 1),
        ("Check Duplicate Lead", "Is Duplicate?"),
        ("Is Duplicate?", "Return Duplicate Response", 0),
        ("Is Duplicate?", "Create or Match Customer", 1),
        ("Create or Match Customer", "Create Lead Record"),
        ("Create Lead Record", "Prepare Service Area Input"),
        ("Prepare Service Area Input", "Call Service Area Workflow"),
        ("Call Service Area Workflow", "Call Qualification Workflow"),
        ("Call Qualification Workflow", "Update Lead After Qualification"),
        ("Update Lead After Qualification", "Very High Priority?"),
        ("Very High Priority?", "Send Owner Priority Alert", 0),
        ("Very High Priority?", "Send Customer Acknowledgement", 1),
        ("Send Owner Priority Alert", "Send Customer Acknowledgement"),
        ("Send Customer Acknowledgement", "Log Communication Records"),
        ("Log Communication Records", "Log Successful Execution"),
        ("Log Successful Execution", "Return Success Response"),
    ])
    save_workflow("01-lead-intake.json", "WF-01 Lead Intake", nodes, conns)


def generate_wf04():
    nodes = [
        sticky("WF-04 Booking Management\nConflict detection + confirmation", -200, 100),
        webhook_node("Booking Webhook", "booking/create", 0, 200),
        code_node("Validate Booking Request", r"""
const b = $input.first().json.body || $input.first().json;
if (!b.lead_id || !b.start_at || !b.end_at) {
  return [{ json: { valid: false, error: 'lead_id, start_at, end_at required', http_status: 400 } }];
}
return [{ json: { valid: true, ...b } }];
""", 300, 200),
        if_node("Booking Valid?", "={{ $json.valid }}", "", 600, 200),
        respond_node("Return Booking Validation Error", 900, 100),
        postgres_node(
            "Check Booking Conflicts",
            """SELECT COUNT(*)::int AS conflict_count FROM bookings
WHERE status IN ('BOOKED','CONFIRMED','IN_PROGRESS')
  AND technician_id = COALESCE({{ $json.technician_id || 'NULL' }}, technician_id)
  AND start_at < '{{ $json.end_at }}'::timestamptz
  AND end_at > '{{ $json.start_at }}'::timestamptz;""",
            900, 300,
        ),
        if_node("Has Conflict?", "={{ $json.conflict_count > 0 }}", "", 1200, 300),
        respond_node("Return Conflict Response", 1500, 200,
                     "={{ { success: false, error: 'BOOKING_CONFLICT', message: 'Requested slot unavailable', http_status: 409 } }}"),
        postgres_node(
            "Create Booking Record",
            """WITH nr AS (SELECT generate_booking_reference() AS ref),
lead_row AS (SELECT customer_id, service_category FROM leads WHERE id = {{ $('Validate Booking Request').item.json.lead_id }})
INSERT INTO bookings (booking_reference, lead_id, customer_id, start_at, end_at, service_type, technician_id, status)
SELECT nr.ref, {{ $('Validate Booking Request').item.json.lead_id }}, lead_row.customer_id,
  '{{ $('Validate Booking Request').item.json.start_at }}'::timestamptz,
  '{{ $('Validate Booking Request').item.json.end_at }}'::timestamptz,
  lead_row.service_category,
  {{ $('Validate Booking Request').item.json.technician_id || 'NULL' }},
  'BOOKED'::booking_status
FROM nr, lead_row
RETURNING *;""",
            1500, 400,
        ),
        postgres_node(
            "Update Lead Status Booked",
            """UPDATE leads SET status = 'BOOKED'::lead_status, updated_at = NOW()
WHERE id = {{ $json.lead_id }} RETURNING id;""",
            1800, 400,
        ),
        email_node(
            "Send Booking Confirmation",
            "={{ 'Booking confirmed — ' + $('Create Booking Record').item.json.booking_reference }}",
            "={{ 'Your appointment is confirmed.\\n\\nReference: ' + $('Create Booking Record').item.json.booking_reference + '\\nDate: ' + $('Create Booking Record').item.json.start_at + '\\n\\nPlease ensure access is available. To reschedule, reply to this email.\\n\\nNorthampton Home Services Ltd' }}",
            2100, 400,
            "={{ $('Validate Booking Request').item.json.customer_email || 'demo@example.com' }}",
        ),
        postgres_node(
            "Record Booking Communication",
            """INSERT INTO communications (customer_id, lead_id, booking_id, channel, communication_type, recipient, subject, status, sent_at, idempotency_key)
VALUES ({{ $('Create Booking Record').item.json.customer_id }}, {{ $('Create Booking Record').item.json.lead_id }},
  {{ $('Create Booking Record').item.json.id }}, 'EMAIL', 'BOOKING_CONFIRMATION',
  '{{ $('Validate Booking Request').item.json.customer_email }}', 'Booking confirmed', 'SENT', NOW(),
  'book-confirm-' || {{ $('Create Booking Record').item.json.id }})
ON CONFLICT (idempotency_key) DO NOTHING;""",
            2400, 400,
        ),
        respond_node("Return Booking Success", 2700, 400,
                     "={{ { success: true, booking_reference: $('Create Booking Record').item.json.booking_reference } }}"),
    ]
    conns = build_connections([
        ("Booking Webhook", "Validate Booking Request"),
        ("Validate Booking Request", "Booking Valid?"),
        ("Booking Valid?", "Check Booking Conflicts", 0),
        ("Booking Valid?", "Return Booking Validation Error", 1),
        ("Check Booking Conflicts", "Has Conflict?"),
        ("Has Conflict?", "Return Conflict Response", 0),
        ("Has Conflict?", "Create Booking Record", 1),
        ("Create Booking Record", "Update Lead Status Booked"),
        ("Update Lead Status Booked", "Send Booking Confirmation"),
        ("Send Booking Confirmation", "Record Booking Communication"),
        ("Record Booking Communication", "Return Booking Success"),
    ])
    save_workflow("04-booking-management.json", "WF-04 Booking Management", nodes, conns)


def generate_wf05():
    nodes = [
        sticky("WF-05 Appointment Reminders\nIdempotent 24h and 2h reminders", -200, 100),
        schedule_node("Every 15 Minutes", "*/15 * * * *", 0, 200),
        postgres_node(
            "Find Bookings Needing 24h Reminder",
            """SELECT b.*, c.email, c.first_name FROM bookings b
JOIN customers c ON c.id = b.customer_id
WHERE b.status IN ('BOOKED','CONFIRMED')
  AND b.reminder_24h_sent_at IS NULL
  AND b.start_at <= NOW() + INTERVAL '24 hours'
  AND b.start_at > NOW() + INTERVAL '23 hours';""",
            300, 100,
        ),
        email_node(
            "Send 24h Reminder",
            "={{ 'Reminder: appointment tomorrow — ' + $json.booking_reference }}",
            "={{ 'Dear ' + $json.first_name + ',\\n\\nReminder: your appointment (' + $json.booking_reference + ') is in approximately 24 hours on ' + $json.start_at + '.\\n\\nNorthampton Home Services Ltd' }}",
            600, 100,
        ),
        postgres_node(
            "Mark 24h Reminder Sent",
            """UPDATE bookings SET reminder_24h_sent_at = NOW(), updated_at = NOW()
WHERE id = {{ $json.id }} AND reminder_24h_sent_at IS NULL RETURNING id;""",
            900, 100,
        ),
        postgres_node(
            "Find Bookings Needing 2h Reminder",
            """SELECT b.*, c.email, c.first_name FROM bookings b
JOIN customers c ON c.id = b.customer_id
WHERE b.status IN ('BOOKED','CONFIRMED')
  AND b.reminder_2h_sent_at IS NULL
  AND b.start_at <= NOW() + INTERVAL '2 hours'
  AND b.start_at > NOW();""",
            300, 400,
        ),
        email_node(
            "Send 2h Reminder",
            "={{ 'Reminder: appointment in 2 hours — ' + $json.booking_reference }}",
            "={{ 'Dear ' + $json.first_name + ',\\n\\nYour technician will arrive in approximately 2 hours for booking ' + $json.booking_reference + '.\\n\\nNorthampton Home Services Ltd' }}",
            600, 400,
        ),
        postgres_node(
            "Mark 2h Reminder Sent",
            """UPDATE bookings SET reminder_2h_sent_at = NOW(), updated_at = NOW()
WHERE id = {{ $json.id }} AND reminder_2h_sent_at IS NULL RETURNING id;""",
            900, 400,
        ),
    ]
    conns = build_connections([
        ("Every 15 Minutes", "Find Bookings Needing 24h Reminder"),
        ("Find Bookings Needing 24h Reminder", "Send 24h Reminder"),
        ("Send 24h Reminder", "Mark 24h Reminder Sent"),
        ("Every 15 Minutes", "Find Bookings Needing 2h Reminder"),
        ("Find Bookings Needing 2h Reminder", "Send 2h Reminder"),
        ("Send 2h Reminder", "Mark 2h Reminder Sent"),
    ])
    save_workflow("05-appointment-reminders.json", "WF-05 Appointment Reminders", nodes, conns)


def generate_wf06():
    nodes = [
        sticky("WF-06 Lead Follow-Up\nStops when booked/cancelled/dormant", -200, 100),
        schedule_node("Hourly Follow-Up Check", "0 * * * *", 0, 200),
        postgres_node(
            "Find Leads Needing Follow-Up",
            """SELECT l.*, c.email, c.first_name FROM leads l
JOIN customers c ON c.id = l.customer_id
WHERE l.status IN ('QUALIFIED','CONTACTED','BOOKING_PENDING')
  AND NOT EXISTS (
    SELECT 1 FROM follow_ups f WHERE f.lead_id = l.id AND f.follow_up_type = 'FOLLOW_UP_1' AND f.status = 'SENT'
  )
  AND l.updated_at < NOW() - INTERVAL '2 hours';""",
            300, 200,
        ),
        email_node(
            "Send Follow-Up 1",
            "={{ 'Following up on your enquiry — ' + $json.lead_reference }}",
            "={{ 'Dear ' + $json.first_name + ',\\n\\nWe wanted to follow up on your enquiry (' + $json.lead_reference + '). Would you like to book an appointment? Reply or call 01604 000000.\\n\\nNorthampton Home Services Ltd' }}",
            600, 200,
        ),
        postgres_node(
            "Record Follow-Up 1",
            """INSERT INTO follow_ups (lead_id, follow_up_type, scheduled_for, sent_at, status, idempotency_key)
VALUES ({{ $json.id }}, 'FOLLOW_UP_1', NOW(), NOW(), 'SENT', 'fu1-' || {{ $json.id }})
ON CONFLICT (idempotency_key) DO NOTHING;
UPDATE leads SET last_contact_at = NOW(), status = 'CONTACTED'::lead_status WHERE id = {{ $json.id }};""",
            900, 200,
        ),
    ]
    save_workflow("06-lead-follow-up.json", "WF-06 Lead Follow-Up", nodes,
                  build_connections([
                      ("Hourly Follow-Up Check", "Find Leads Needing Follow-Up"),
                      ("Find Leads Needing Follow-Up", "Send Follow-Up 1"),
                      ("Send Follow-Up 1", "Record Follow-Up 1"),
                  ]))


def generate_wf07():
    nodes = [
        sticky("WF-07 Job Completion & Review", -200, 100),
        webhook_node("Job Complete Webhook", "job/complete", 0, 200),
        postgres_node(
            "Update Job Completed",
            """UPDATE jobs SET status = 'COMPLETED'::job_status, completed_at = NOW(), updated_at = NOW()
WHERE id = {{ ($json.body || $json).job_id }} RETURNING *;""",
            300, 200,
        ),
        postgres_node(
            "Update Booking And Lead",
            """UPDATE bookings SET status = 'COMPLETED'::booking_status, updated_at = NOW() WHERE id = {{ $json.booking_id }};
UPDATE leads SET status = 'COMPLETED'::lead_status, updated_at = NOW() WHERE id = {{ $json.lead_id }};""",
            600, 200,
        ),
        email_node(
            "Send Thank You Email",
            "={{ 'Thank you — ' + $json.job_reference }}",
            "={{ 'Thank you for choosing Northampton Home Services.\\n\\nWas everything satisfactory? Reply YES or NO to this email.\\n\\nJob reference: ' + $json.job_reference }}",
            900, 200,
        ),
        webhook_node("Satisfaction Response Webhook", "job/satisfaction", 0, 500),
        if_node("Customer Satisfied?", "={{ ($json.body || $json).satisfied === true || ($json.body || $json).response === 'YES' }}", "", 300, 500),
        email_node(
            "Send Review Request",
            "We value your feedback",
            "Thank you! Please share your experience: https://example.com/reviews/northampton-home-services",
            600, 400,
        ),
        email_node(
            "Send Service Recovery Alert",
            "SERVICE RECOVERY REQUIRED",
            "Customer reported dissatisfaction. Manual follow-up required.",
            600, 600,
            "owner@northamptonhomeservices.demo",
        ),
        postgres_node(
            "Record Review Outcome",
            """INSERT INTO reviews (job_id, customer_id, customer_satisfied, review_requested, review_status, request_sent_at)
VALUES ({{ $('Update Job Completed').item.json.id }}, {{ $('Update Job Completed').item.json.customer_id }},
  {{ ($json.body || $json).satisfied === true || ($json.body || $json).response === 'YES' }},
  {{ ($json.body || $json).satisfied === true || ($json.body || $json).response === 'YES' }},
  CASE WHEN {{ ($json.body || $json).satisfied === true || ($json.body || $json).response === 'YES' }} THEN 'REQUESTED'::review_status ELSE 'SUPPRESSED'::review_status END,
  NOW())
ON CONFLICT DO NOTHING;""",
            900, 500,
        ),
    ]
    conns = build_connections([
        ("Job Complete Webhook", "Update Job Completed"),
        ("Update Job Completed", "Update Booking And Lead"),
        ("Update Booking And Lead", "Send Thank You Email"),
        ("Satisfaction Response Webhook", "Customer Satisfied?"),
        ("Customer Satisfied?", "Send Review Request", 0),
        ("Customer Satisfied?", "Send Service Recovery Alert", 1),
        ("Send Review Request", "Record Review Outcome"),
        ("Send Service Recovery Alert", "Record Review Outcome"),
    ])
    save_workflow("07-job-completion-review.json", "WF-07 Job Completion Review", nodes, conns)


def generate_wf08():
    nodes = [
        sticky("WF-08 Central Error Handler", -200, 100),
        error_trigger_node("On Workflow Error", 0, 200),
        code_node("Classify Error", r"""
const err = $input.first().json;
const msg = (err.error?.message || err.message || '').toLowerCase();
let error_type = 'UNKNOWN';
let retryable = false;
if (msg.includes('timeout') || msg.includes('econnreset')) { error_type = 'TRANSIENT_NETWORK'; retryable = true; }
else if (msg.includes('500') || msg.includes('502')) { error_type = 'EXTERNAL_API'; retryable = true; }
else if (msg.includes('validation') || msg.includes('invalid')) { error_type = 'VALIDATION'; }
else if (msg.includes('postgres') || msg.includes('database')) { error_type = 'DATABASE'; }
else if (msg.includes('auth')) { error_type = 'AUTHENTICATION'; }
return [{ json: { ...err, error_type, retryable, retry_count: err.retry_count || 0 } }];
""", 300, 200),
        postgres_node(
            "Record Workflow Failure",
            """INSERT INTO workflow_errors (workflow_name, workflow_execution_id, node_name, error_type, error_message, retryable, retry_count, entity_reference, status)
VALUES ('{{ $json.workflow?.name || "unknown" }}', '{{ $json.execution?.id || "" }}', '{{ $json.error?.node?.name || "" }}',
  '{{ $json.error_type }}', '{{ ($json.error?.message || "").replace(/'/g, "''") }}', {{ $json.retryable }}, {{ $json.retry_count }},
  '{{ $json.entity_reference || "" }}', CASE WHEN {{ $json.retryable }} AND {{ $json.retry_count }} < 3 THEN 'RETRYING'::error_status ELSE 'MANUAL_ACTION_REQUIRED'::error_status END)
RETURNING *;""",
            600, 200,
        ),
        if_node("Needs Owner Alert?", "={{ $json.status === 'MANUAL_ACTION_REQUIRED' }}", "", 900, 200),
        email_node(
            "Send Error Alert To Owner",
            "LocalFlow Workflow Failure",
            "={{ 'Workflow failure recorded.\\nWorkflow: ' + ($json.workflow_name || '') + '\\nError: ' + ($json.error_message || '') + '\\nStatus: ' + $json.status }}",
            1200, 200,
            "owner@northamptonhomeservices.demo",
        ),
    ]
    conns = build_connections([
        ("On Workflow Error", "Classify Error"),
        ("Classify Error", "Record Workflow Failure"),
        ("Record Workflow Failure", "Needs Owner Alert?"),
        ("Needs Owner Alert?", "Send Error Alert To Owner", 0),
    ])
    save_workflow("08-error-handler.json", "WF-08 Error Handler", nodes, conns)


def generate_wf09():
    nodes = [
        sticky("WF-09 Daily Operations Brief", -200, 100),
        schedule_node("Daily 07:00", "0 7 * * *", 0, 200),
        postgres_node(
            "Aggregate Daily Metrics",
            """SELECT
  (SELECT COUNT(*) FROM leads WHERE created_at >= CURRENT_DATE - INTERVAL '1 day' AND created_at < CURRENT_DATE) AS new_leads,
  (SELECT COUNT(*) FROM leads WHERE qualification_rating = 'VERY_HIGH' AND created_at >= CURRENT_DATE - INTERVAL '1 day') AS very_high_leads,
  (SELECT COUNT(*) FROM leads WHERE status = 'MANUAL_REVIEW') AS manual_review_leads,
  (SELECT COUNT(*) FROM bookings WHERE start_at::date = CURRENT_DATE AND status IN ('BOOKED','CONFIRMED')) AS todays_bookings,
  (SELECT COUNT(*) FROM bookings WHERE start_at::date = CURRENT_DATE + 1 AND status IN ('BOOKED','CONFIRMED')) AS tomorrows_bookings,
  (SELECT COUNT(*) FROM follow_ups WHERE status = 'SCHEDULED' AND scheduled_for <= NOW()) AS follow_ups_due,
  (SELECT COUNT(*) FROM jobs WHERE completed_at::date = CURRENT_DATE - 1) AS jobs_completed_yesterday,
  (SELECT COUNT(*) FROM workflow_errors WHERE status IN ('OPEN','MANUAL_ACTION_REQUIRED')) AS workflow_errors_open;""",
            300, 200,
        ),
        code_node("Format Daily Brief", r"""
const m = $input.first().json;
const body = `LOCALFLOW — DAILY OPERATIONS BRIEF\n\nNew leads (24h): ${m.new_leads}\nVery high priority: ${m.very_high_leads}\nManual review queue: ${m.manual_review_leads}\nToday's bookings: ${m.todays_bookings}\nTomorrow's bookings: ${m.tomorrows_bookings}\nFollow-ups due: ${m.follow_ups_due}\nJobs completed yesterday: ${m.jobs_completed_yesterday}\nOpen workflow errors: ${m.workflow_errors_open}\n`;
return [{ json: { ...m, report_body: body } }];
""", 600, 200),
        email_node(
            "Send Daily Brief",
            "LocalFlow Daily Operations Brief",
            "={{ $json.report_body }}",
            900, 200,
            "owner@northamptonhomeservices.demo",
        ),
        postgres_node(
            "Store Daily Snapshot",
            """INSERT INTO reporting_snapshots (report_type, period_start, period_end, metrics_json)
VALUES ('DAILY_BRIEF', CURRENT_DATE - INTERVAL '1 day', CURRENT_DATE, '{{ JSON.stringify($json).replace(/'/g, "''") }}'::jsonb);""",
            1200, 200,
        ),
    ]
    save_workflow("09-daily-operations-brief.json", "WF-09 Daily Operations Brief", nodes,
                  build_connections([
                      ("Daily 07:00", "Aggregate Daily Metrics"),
                      ("Aggregate Daily Metrics", "Format Daily Brief"),
                      ("Format Daily Brief", "Send Daily Brief"),
                      ("Send Daily Brief", "Store Daily Snapshot"),
                  ]))


def generate_wf10():
    nodes = [
        sticky("WF-10 Weekly Business Report", -200, 100),
        schedule_node("Monday 08:00", "0 8 * * 1", 0, 200),
        postgres_node(
            "Aggregate Weekly Metrics",
            """WITH period AS (
  SELECT CURRENT_DATE - INTERVAL '7 days' AS start_at, CURRENT_DATE AS end_at
)
SELECT
  (SELECT COUNT(*) FROM leads l, period p WHERE l.created_at >= p.start_at AND l.created_at < p.end_at) AS leads_received,
  (SELECT COUNT(*) FROM leads l, period p WHERE l.status IN ('QUALIFIED','BOOKED','COMPLETED') AND l.created_at >= p.start_at) AS leads_qualified,
  (SELECT COUNT(*) FROM leads l, period p WHERE l.status = 'OUTSIDE_SERVICE_AREA' AND l.created_at >= p.start_at) AS outside_area,
  (SELECT COUNT(*) FROM leads l, period p WHERE l.status = 'DUPLICATE' AND l.created_at >= p.start_at) AS duplicates,
  (SELECT COUNT(*) FROM bookings b, period p WHERE b.created_at >= p.start_at AND b.created_at < p.end_at) AS bookings_created,
  (SELECT COUNT(*) FROM jobs j, period p WHERE j.status = 'COMPLETED' AND j.completed_at >= p.start_at) AS jobs_completed,
  (SELECT COUNT(*) FROM follow_ups f, period p WHERE f.status = 'SENT' AND f.sent_at >= p.start_at) AS follow_ups_sent,
  (SELECT COUNT(*) FROM reviews r, period p WHERE r.review_requested AND r.request_sent_at >= p.start_at) AS review_requests,
  (SELECT COUNT(*) FROM reviews r, period p WHERE r.customer_satisfied = false AND r.created_at >= p.start_at) AS unsatisfied,
  (SELECT COUNT(*) FROM workflow_runs w, period p WHERE w.created_at >= p.start_at) AS workflow_runs,
  (SELECT COUNT(*) FROM workflow_runs w, period p WHERE w.status = 'FAILED' AND w.created_at >= p.start_at) AS workflow_failed;""",
            300, 200,
        ),
        code_node("Format Weekly Report", r"""
const m = $input.first().json;
const l2b = m.leads_received ? ((m.bookings_created / m.leads_received) * 100).toFixed(1) : 'N/A';
const b2c = m.bookings_created ? ((m.jobs_completed / m.bookings_created) * 100).toFixed(1) : 'N/A';
const body = `LOCALFLOW WEEKLY OPERATIONS\n\nLEADS\nReceived: ${m.leads_received}\nQualified: ${m.leads_qualified}\nOutside area: ${m.outside_area}\nDuplicates: ${m.duplicates}\n\nCONVERSION\nLead → Booking: ${l2b}%\nBooking → Completed: ${b2c}%\n\nOPERATIONS\nBookings: ${m.bookings_created}\nCompleted jobs: ${m.jobs_completed}\nFollow-ups sent: ${m.follow_ups_sent}\n\nCUSTOMER EXPERIENCE\nReview requests: ${m.review_requests}\nUnsatisfied: ${m.unsatisfied}\n\nAUTOMATION\nRuns: ${m.workflow_runs}\nFailed: ${m.workflow_failed}\n`;
return [{ json: { ...m, report_body: body, lead_to_booking_rate: l2b, booking_to_completion_rate: b2c } }];
""", 600, 200),
        email_node("Send Weekly Report", "LocalFlow Weekly Business Report", "={{ $json.report_body }}", 900, 200, "owner@northamptonhomeservices.demo"),
        postgres_node(
            "Store Weekly Snapshot",
            """INSERT INTO reporting_snapshots (report_type, period_start, period_end, metrics_json)
VALUES ('WEEKLY_REPORT', CURRENT_DATE - INTERVAL '7 days', CURRENT_DATE, '{{ JSON.stringify($json).replace(/'/g, "''") }}'::jsonb);""",
            1200, 200,
        ),
    ]
    save_workflow("10-weekly-business-report.json", "WF-10 Weekly Business Report", nodes,
                  build_connections([
                      ("Monday 08:00", "Aggregate Weekly Metrics"),
                      ("Aggregate Weekly Metrics", "Format Weekly Report"),
                      ("Format Weekly Report", "Send Weekly Report"),
                      ("Send Weekly Report", "Store Weekly Snapshot"),
                  ]))


def main():
    WORKFLOWS_DIR.mkdir(parents=True, exist_ok=True)
    generate_sub_workflows()
    generate_wf02()
    generate_wf03()
    generate_wf01()
    generate_wf04()
    generate_wf05()
    generate_wf06()
    generate_wf07()
    generate_wf08()
    generate_wf09()
    generate_wf10()
    print("All workflows generated.")


if __name__ == "__main__":
    main()
