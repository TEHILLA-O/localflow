-- LocalFlow PostgreSQL Schema
-- Northampton Home Services Ltd — demo automation platform

CREATE EXTENSION IF NOT EXISTS "pgcrypto";

-- ============================================================
-- ENUM types
-- ============================================================

CREATE TYPE customer_status AS ENUM ('ACTIVE', 'INACTIVE', 'BLOCKED');
CREATE TYPE lead_status AS ENUM (
  'NEW', 'VALIDATED', 'QUALIFIED', 'CONTACTED', 'BOOKING_PENDING',
  'BOOKED', 'CONFIRMED', 'IN_PROGRESS', 'COMPLETED', 'REVIEW_REQUESTED',
  'CLOSED', 'MANUAL_REVIEW', 'OUTSIDE_SERVICE_AREA', 'DUPLICATE',
  'INVALID', 'CANCELLED', 'NO_RESPONSE', 'DORMANT', 'FAILED'
);
CREATE TYPE booking_status AS ENUM (
  'PENDING', 'BOOKED', 'CONFIRMED', 'IN_PROGRESS', 'COMPLETED', 'CANCELLED', 'NO_SHOW'
);
CREATE TYPE job_status AS ENUM ('SCHEDULED', 'IN_PROGRESS', 'COMPLETED', 'CANCELLED', 'FAILED');
CREATE TYPE service_area_class AS ENUM ('PRIMARY', 'EXTENDED', 'OUTSIDE', 'UNKNOWN');
CREATE TYPE urgency_level AS ENUM ('EMERGENCY', 'URGENT', 'NORMAL', 'LOW');
CREATE TYPE qualification_rating AS ENUM ('VERY_HIGH', 'HIGH', 'MEDIUM', 'LOW', 'VERY_LOW');
CREATE TYPE communication_channel AS ENUM ('EMAIL', 'SMS', 'WHATSAPP', 'PHONE', 'INTERNAL');
CREATE TYPE communication_status AS ENUM ('PENDING', 'SENT', 'FAILED', 'BOUNCED', 'SKIPPED');
CREATE TYPE follow_up_status AS ENUM ('SCHEDULED', 'SENT', 'CANCELLED', 'FAILED', 'SKIPPED');
CREATE TYPE review_status AS ENUM ('NOT_REQUESTED', 'REQUESTED', 'RECEIVED', 'DECLINED', 'SUPPRESSED');
CREATE TYPE workflow_run_status AS ENUM ('RUNNING', 'SUCCESS', 'PARTIAL_SUCCESS', 'FAILED');
CREATE TYPE error_status AS ENUM ('OPEN', 'RETRYING', 'RESOLVED', 'MANUAL_ACTION_REQUIRED');
CREATE TYPE duplicate_class AS ENUM ('NEW', 'LIKELY_DUPLICATE', 'EXACT_DUPLICATE');

-- ============================================================
-- Configuration
-- ============================================================

CREATE TABLE automation_config (
  key VARCHAR(100) PRIMARY KEY,
  value JSONB NOT NULL,
  description TEXT,
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE service_definitions (
  id SERIAL PRIMARY KEY,
  code VARCHAR(50) NOT NULL UNIQUE,
  name VARCHAR(100) NOT NULL,
  enabled BOOLEAN NOT NULL DEFAULT TRUE,
  default_duration_minutes INTEGER NOT NULL DEFAULT 60,
  base_priority INTEGER NOT NULL DEFAULT 10,
  emergency_eligible BOOLEAN NOT NULL DEFAULT FALSE,
  supported_zones JSONB NOT NULL DEFAULT '["PRIMARY","EXTENDED"]'::jsonb,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE technicians (
  id SERIAL PRIMARY KEY,
  code VARCHAR(20) NOT NULL UNIQUE,
  full_name VARCHAR(100) NOT NULL,
  email VARCHAR(255) NOT NULL,
  service_codes TEXT[] NOT NULL,
  active BOOLEAN NOT NULL DEFAULT TRUE,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- ============================================================
-- Core business tables
-- ============================================================

CREATE TABLE customers (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(100) NOT NULL,
  last_name VARCHAR(100) NOT NULL,
  email VARCHAR(255) NOT NULL,
  phone VARCHAR(30),
  postcode VARCHAR(12) NOT NULL,
  address_line_1 VARCHAR(255),
  address_line_2 VARCHAR(255),
  city VARCHAR(100) DEFAULT 'Northampton',
  customer_status customer_status NOT NULL DEFAULT 'ACTIVE',
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  CONSTRAINT customers_email_unique UNIQUE (email)
);

CREATE TABLE leads (
  id SERIAL PRIMARY KEY,
  lead_reference VARCHAR(20) NOT NULL UNIQUE,
  customer_id INTEGER NOT NULL REFERENCES customers(id),
  source VARCHAR(50) NOT NULL DEFAULT 'WEB_FORM',
  service_category VARCHAR(50) NOT NULL,
  service_subcategory VARCHAR(50),
  description TEXT NOT NULL,
  urgency urgency_level NOT NULL DEFAULT 'NORMAL',
  postcode VARCHAR(12) NOT NULL,
  postcode_district VARCHAR(10),
  service_area service_area_class NOT NULL DEFAULT 'UNKNOWN',
  qualification_score INTEGER CHECK (qualification_score >= 0 AND qualification_score <= 100),
  qualification_rating qualification_rating,
  qualification_reasons JSONB,
  status lead_status NOT NULL DEFAULT 'NEW',
  preferred_date DATE,
  preferred_time TIME,
  content_fingerprint VARCHAR(64),
  duplicate_of_lead_id INTEGER REFERENCES leads(id),
  duplicate_classification duplicate_class DEFAULT 'NEW',
  consent_to_contact BOOLEAN NOT NULL DEFAULT FALSE,
  first_contact_at TIMESTAMPTZ,
  last_contact_at TIMESTAMPTZ,
  lead_received_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE bookings (
  id SERIAL PRIMARY KEY,
  booking_reference VARCHAR(20) NOT NULL UNIQUE,
  lead_id INTEGER NOT NULL REFERENCES leads(id),
  customer_id INTEGER NOT NULL REFERENCES customers(id),
  start_at TIMESTAMPTZ NOT NULL,
  end_at TIMESTAMPTZ NOT NULL,
  service_type VARCHAR(50) NOT NULL,
  technician_id INTEGER REFERENCES technicians(id),
  technician VARCHAR(100),
  status booking_status NOT NULL DEFAULT 'PENDING',
  calendar_reference VARCHAR(100),
  confirmation_sent_at TIMESTAMPTZ,
  reminder_24h_sent_at TIMESTAMPTZ,
  reminder_2h_sent_at TIMESTAMPTZ,
  cancelled_at TIMESTAMPTZ,
  cancellation_reason TEXT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  CONSTRAINT bookings_time_valid CHECK (end_at > start_at)
);

CREATE TABLE jobs (
  id SERIAL PRIMARY KEY,
  job_reference VARCHAR(20) NOT NULL UNIQUE,
  booking_id INTEGER NOT NULL REFERENCES bookings(id),
  lead_id INTEGER NOT NULL REFERENCES leads(id),
  customer_id INTEGER NOT NULL REFERENCES customers(id),
  status job_status NOT NULL DEFAULT 'SCHEDULED',
  started_at TIMESTAMPTZ,
  completed_at TIMESTAMPTZ,
  notes TEXT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE communications (
  id SERIAL PRIMARY KEY,
  customer_id INTEGER REFERENCES customers(id),
  lead_id INTEGER REFERENCES leads(id),
  booking_id INTEGER REFERENCES bookings(id),
  channel communication_channel NOT NULL DEFAULT 'EMAIL',
  communication_type VARCHAR(50) NOT NULL,
  recipient VARCHAR(255) NOT NULL,
  subject VARCHAR(500),
  status communication_status NOT NULL DEFAULT 'PENDING',
  sent_at TIMESTAMPTZ,
  external_reference VARCHAR(100),
  idempotency_key VARCHAR(100) UNIQUE,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE follow_ups (
  id SERIAL PRIMARY KEY,
  lead_id INTEGER NOT NULL REFERENCES leads(id),
  follow_up_type VARCHAR(30) NOT NULL,
  scheduled_for TIMESTAMPTZ NOT NULL,
  sent_at TIMESTAMPTZ,
  cancelled_at TIMESTAMPTZ,
  status follow_up_status NOT NULL DEFAULT 'SCHEDULED',
  reason TEXT,
  idempotency_key VARCHAR(100) UNIQUE,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE reviews (
  id SERIAL PRIMARY KEY,
  job_id INTEGER NOT NULL REFERENCES jobs(id),
  customer_id INTEGER NOT NULL REFERENCES customers(id),
  request_sent_at TIMESTAMPTZ,
  customer_satisfied BOOLEAN,
  review_requested BOOLEAN NOT NULL DEFAULT FALSE,
  review_status review_status NOT NULL DEFAULT 'NOT_REQUESTED',
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE audit_events (
  id SERIAL PRIMARY KEY,
  entity_type VARCHAR(50) NOT NULL,
  entity_id INTEGER NOT NULL,
  event_type VARCHAR(50) NOT NULL,
  previous_state VARCHAR(50),
  new_state VARCHAR(50),
  workflow_name VARCHAR(100),
  workflow_execution_id VARCHAR(100),
  metadata JSONB,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE workflow_runs (
  id SERIAL PRIMARY KEY,
  workflow_name VARCHAR(100) NOT NULL,
  workflow_execution_id VARCHAR(100),
  business_entity_type VARCHAR(50),
  business_entity_id INTEGER,
  status workflow_run_status NOT NULL DEFAULT 'RUNNING',
  started_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  completed_at TIMESTAMPTZ,
  duration_ms INTEGER,
  error_code VARCHAR(50),
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE workflow_errors (
  id SERIAL PRIMARY KEY,
  workflow_name VARCHAR(100) NOT NULL,
  workflow_execution_id VARCHAR(100),
  node_name VARCHAR(100),
  error_type VARCHAR(50) NOT NULL,
  error_message TEXT NOT NULL,
  retryable BOOLEAN NOT NULL DEFAULT FALSE,
  retry_count INTEGER NOT NULL DEFAULT 0,
  entity_reference VARCHAR(50),
  occurred_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  resolved_at TIMESTAMPTZ,
  status error_status NOT NULL DEFAULT 'OPEN'
);

CREATE TABLE reporting_snapshots (
  id SERIAL PRIMARY KEY,
  report_type VARCHAR(50) NOT NULL,
  period_start TIMESTAMPTZ NOT NULL,
  period_end TIMESTAMPTZ NOT NULL,
  metrics_json JSONB NOT NULL,
  generated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- ============================================================
-- Reference generation sequences
-- ============================================================

CREATE SEQUENCE lead_ref_seq START 1;
CREATE SEQUENCE booking_ref_seq START 1;
CREATE SEQUENCE job_ref_seq START 1;

CREATE OR REPLACE FUNCTION generate_lead_reference()
RETURNS VARCHAR(20) AS $$
BEGIN
  RETURN 'LEAD-' || TO_CHAR(NOW(), 'YYYY') || '-' || LPAD(nextval('lead_ref_seq')::TEXT, 6, '0');
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION generate_booking_reference()
RETURNS VARCHAR(20) AS $$
BEGIN
  RETURN 'BOOK-' || TO_CHAR(NOW(), 'YYYY') || '-' || LPAD(nextval('booking_ref_seq')::TEXT, 6, '0');
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION generate_job_reference()
RETURNS VARCHAR(20) AS $$
BEGIN
  RETURN 'JOB-' || TO_CHAR(NOW(), 'YYYY') || '-' || LPAD(nextval('job_ref_seq')::TEXT, 6, '0');
END;
$$ LANGUAGE plpgsql;

-- ============================================================
-- Updated_at triggers
-- ============================================================

CREATE OR REPLACE FUNCTION set_updated_at()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER customers_updated_at BEFORE UPDATE ON customers
  FOR EACH ROW EXECUTE FUNCTION set_updated_at();
CREATE TRIGGER leads_updated_at BEFORE UPDATE ON leads
  FOR EACH ROW EXECUTE FUNCTION set_updated_at();
CREATE TRIGGER bookings_updated_at BEFORE UPDATE ON bookings
  FOR EACH ROW EXECUTE FUNCTION set_updated_at();
CREATE TRIGGER jobs_updated_at BEFORE UPDATE ON jobs
  FOR EACH ROW EXECUTE FUNCTION set_updated_at();
CREATE TRIGGER reviews_updated_at BEFORE UPDATE ON reviews
  FOR EACH ROW EXECUTE FUNCTION set_updated_at();

-- ============================================================
-- Seed configuration
-- ============================================================

INSERT INTO automation_config (key, value, description) VALUES
  ('company', '{"name": "Northampton Home Services Ltd", "email": "office@northamptonhomeservices.demo", "phone": "01604 000000", "timezone": "Europe/London"}'::jsonb, 'Company details'),
  ('service_areas', '{"primary": ["NN1","NN2","NN3","NN4","NN5"], "extended": ["NN6","NN7","NN8","NN9","NN10","NN11","NN12"]}'::jsonb, 'Postcode districts served'),
  ('qualification_weights', '{"primary_area": 25, "extended_area": 15, "emergency": 20, "urgent": 12, "supported_service": 20, "complete_contact": 10, "preferred_appointment": 5, "detailed_description": 5, "returning_customer": 5, "unsupported_service": -40, "outside_area": -50, "missing_info": -20}'::jsonb, 'Lead scoring weights'),
  ('follow_up_schedule', '{"follow_up_1_hours": 2, "follow_up_2_hours": 24, "final_follow_up_days": 3}'::jsonb, 'Follow-up timing'),
  ('reminder_windows', '{"reminder_24h_hours": 24, "reminder_2h_hours": 2}'::jsonb, 'Appointment reminder windows'),
  ('duplicate_window_hours', '48'::jsonb, 'Duplicate detection window in hours'),
  ('owner_alert_email', '"owner@northamptonhomeservices.demo"'::jsonb, 'Owner notification email'),
  ('review_url', '"https://example.com/reviews/northampton-home-services"'::jsonb, 'Review link placeholder'),
  ('working_hours', '{"start": "08:00", "end": "18:00", "days": ["mon","tue","wed","thu","fri","sat"]}'::jsonb, 'Business hours'),
  ('default_appointment_duration_minutes', '60'::jsonb, 'Default booking duration');

INSERT INTO service_definitions (code, name, default_duration_minutes, base_priority, emergency_eligible) VALUES
  ('PLUMBING', 'Plumbing', 60, 20, TRUE),
  ('ELECTRICAL', 'Electrical', 90, 18, TRUE),
  ('HEATING', 'Heating & Boiler', 90, 22, TRUE),
  ('PROPERTY_MAINTENANCE', 'Property Maintenance', 120, 10, FALSE);

INSERT INTO technicians (code, full_name, email, service_codes) VALUES
  ('TECH-AM', 'Alex Morgan', 'alex.morgan@northamptonhomeservices.demo', ARRAY['PLUMBING']),
  ('TECH-JP', 'Jordan Patel', 'jordan.patel@northamptonhomeservices.demo', ARRAY['ELECTRICAL']),
  ('TECH-SC', 'Sam Carter', 'sam.carter@northamptonhomeservices.demo', ARRAY['HEATING']),
  ('TECH-TE', 'Taylor Evans', 'taylor.evans@northamptonhomeservices.demo', ARRAY['PROPERTY_MAINTENANCE','PLUMBING']);
