-- LocalFlow indexes for query performance

-- Customers
CREATE INDEX idx_customers_email ON customers (LOWER(email));
CREATE INDEX idx_customers_phone ON customers (phone);
CREATE INDEX idx_customers_postcode ON customers (postcode);

-- Leads
CREATE INDEX idx_leads_customer_id ON leads (customer_id);
CREATE INDEX idx_leads_status ON leads (status);
CREATE INDEX idx_leads_postcode_district ON leads (postcode_district);
CREATE INDEX idx_leads_service_area ON leads (service_area);
CREATE INDEX idx_leads_qualification_rating ON leads (qualification_rating);
CREATE INDEX idx_leads_content_fingerprint ON leads (content_fingerprint);
CREATE INDEX idx_leads_created_at ON leads (created_at DESC);
CREATE INDEX idx_leads_duplicate_of ON leads (duplicate_of_lead_id) WHERE duplicate_of_lead_id IS NOT NULL;
CREATE INDEX idx_leads_active_follow_up ON leads (status, updated_at)
  WHERE status IN ('QUALIFIED', 'CONTACTED', 'BOOKING_PENDING');

-- Bookings
CREATE INDEX idx_bookings_lead_id ON bookings (lead_id);
CREATE INDEX idx_bookings_customer_id ON bookings (customer_id);
CREATE INDEX idx_bookings_status ON bookings (status);
CREATE INDEX idx_bookings_technician_id ON bookings (technician_id);
CREATE INDEX idx_bookings_start_at ON bookings (start_at);
CREATE INDEX idx_bookings_active_time ON bookings (start_at, end_at)
  WHERE status IN ('BOOKED', 'CONFIRMED', 'IN_PROGRESS');
CREATE INDEX idx_bookings_reminder_24h ON bookings (start_at, reminder_24h_sent_at)
  WHERE status IN ('BOOKED', 'CONFIRMED') AND reminder_24h_sent_at IS NULL;
CREATE INDEX idx_bookings_reminder_2h ON bookings (start_at, reminder_2h_sent_at)
  WHERE status IN ('BOOKED', 'CONFIRMED') AND reminder_2h_sent_at IS NULL;

-- Jobs
CREATE INDEX idx_jobs_booking_id ON jobs (booking_id);
CREATE INDEX idx_jobs_lead_id ON jobs (lead_id);
CREATE INDEX idx_jobs_status ON jobs (status);
CREATE INDEX idx_jobs_completed_at ON jobs (completed_at) WHERE completed_at IS NOT NULL;

-- Communications
CREATE INDEX idx_communications_lead_id ON communications (lead_id);
CREATE INDEX idx_communications_booking_id ON communications (booking_id);
CREATE INDEX idx_communications_type ON communications (communication_type);
CREATE INDEX idx_communications_idempotency ON communications (idempotency_key) WHERE idempotency_key IS NOT NULL;

-- Follow-ups
CREATE INDEX idx_follow_ups_lead_id ON follow_ups (lead_id);
CREATE INDEX idx_follow_ups_scheduled ON follow_ups (scheduled_for, status)
  WHERE status = 'SCHEDULED';
CREATE INDEX idx_follow_ups_idempotency ON follow_ups (idempotency_key) WHERE idempotency_key IS NOT NULL;

-- Reviews
CREATE INDEX idx_reviews_job_id ON reviews (job_id);
CREATE INDEX idx_reviews_customer_id ON reviews (customer_id);

-- Audit & workflow
CREATE INDEX idx_audit_events_entity ON audit_events (entity_type, entity_id);
CREATE INDEX idx_audit_events_created ON audit_events (created_at DESC);
CREATE INDEX idx_workflow_runs_name ON workflow_runs (workflow_name, created_at DESC);
CREATE INDEX idx_workflow_errors_status ON workflow_errors (status) WHERE status IN ('OPEN', 'RETRYING', 'MANUAL_ACTION_REQUIRED');
CREATE INDEX idx_reporting_snapshots_type ON reporting_snapshots (report_type, generated_at DESC);

-- Overlap prevention helper: unique active booking per technician slot would be too restrictive;
-- conflict detection is handled in workflow logic with idx_bookings_active_time
