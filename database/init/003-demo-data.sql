-- LocalFlow demo data (synthetic, fictional)
BEGIN;

INSERT INTO customers (first_name, last_name, email, phone, postcode, address_line_1, city) VALUES
  ('Anna', 'Roberts', 'anna.roberts0@example.demo', '07125 877572', 'NN5 5PL', '32 Bedford Road', 'Northampton'),
  ('Jessica', 'Thomas', 'jessica.thomas1@example.demo', '07792 876646', 'NN10 6YU', '12 Duston Main Road', 'Northampton'),
  ('Adam', 'Taylor', 'adam.taylor2@example.demo', '07130 198246', 'NN4 8LA', '30 East Hunsbury', 'Northampton'),
  ('Claire', 'Brown', 'claire.brown3@example.demo', '07674 308496', 'NN10 6YU', '54 Bedford Road', 'Northampton'),
  ('Katie', 'Cox', 'katie.cox4@example.demo', '07384 948749', 'NN1 3ER', '98 Wellingborough Road', 'Northampton'),
  ('Susan', 'Kelly', 'susan.kelly5@example.demo', '07448 391369', 'NN3 3HQ', '28 Kingsthorpe Grove', 'Northampton'),
  ('Amelia', 'Evans', 'amelia.evans6@example.demo', '07489 201414', 'NN6 9DF', '109 Kingsthorpe Grove', 'Northampton'),
  ('Claire', 'Hall', 'claire.hall7@example.demo', '07926 145561', 'NN8 4RT', '69 Kettering Road', 'Northampton'),
  ('Grace', 'Evans', 'grace.evans8@example.demo', '07665 407419', 'NN12 2OP', '114 Kingsthorpe Grove', 'Northampton'),
  ('Helen', 'White', 'helen.white9@example.demo', '07821 172933', 'NN1 3ER', '85 Bedford Road', 'Northampton'),
  ('Simon', 'Harris', 'simon.harris10@example.demo', '07181 996865', 'NN4 8LA', '111 Kettering Road', 'Northampton'),
  ('Grace', 'Lewis', 'grace.lewis11@example.demo', '07564 766563', 'NN6 9DF', '21 Kingsthorpe Grove', 'Northampton'),
  ('Chloe', 'Hughes', 'chloe.hughes12@example.demo', '07786 379946', 'NN2 6BT', '78 Wellingborough Road', 'Northampton'),
  ('Rachel', 'Green', 'rachel.green13@example.demo', '07267 584714', 'NN7 1QW', '35 East Hunsbury', 'Northampton'),
  ('Lucy', 'Patel', 'lucy.patel14@example.demo', '07963 905635', 'NN1 3ER', '30 Abington Avenue', 'Northampton'),
  ('Megan', 'Bennett', 'megan.bennett15@example.demo', '07374 169403', 'NN4 8LA', '117 Duston Main Road', 'Northampton'),
  ('Mark', 'Patel', 'mark.patel16@example.demo', '07317 787277', 'NN8 4RT', '51 Harlestone Road', 'Northampton'),
  ('Thomas', 'Hall', 'thomas.hall17@example.demo', '07242 358607', 'NN10 6YU', '69 St James Road', 'Northampton'),
  ('Paul', 'Cox', 'paul.cox18@example.demo', '07538 711878', 'NN7 1QW', '47 Bedford Road', 'Northampton'),
  ('Jessica', 'Rogers', 'jessica.rogers19@example.demo', '07605 195325', 'NN1 3ER', '111 Kettering Road', 'Northampton'),
  ('Thomas', 'Wright', 'thomas.wright20@example.demo', '07911 813536', 'NN7 1QW', '77 Kettering Road', 'Northampton'),
  ('Grace', 'Morgan', 'grace.morgan21@example.demo', '07710 590785', 'NN10 6YU', '33 East Hunsbury', 'Northampton'),
  ('Sarah', 'Roberts', 'sarah.roberts22@example.demo', '07798 663054', 'NN5 5PL', '99 Kingsthorpe Grove', 'Northampton'),
  ('George', 'Harris', 'george.harris23@example.demo', '07545 265840', 'NN8 4RT', '1 St James Road', 'Northampton'),
  ('Victoria', 'Thompson', 'victoria.thompson24@example.demo', '07619 211579', 'NN5 5PL', '108 East Hunsbury', 'Northampton'),
  ('Claire', 'White', 'claire.white25@example.demo', '07256 492077', 'NN3 3HQ', '70 East Hunsbury', 'Northampton'),
  ('Sarah', 'Richardson', 'sarah.richardson26@example.demo', '07431 612340', 'NN1 3ER', '15 Kingsthorpe Grove', 'Northampton'),
  ('Jack', 'Green', 'jack.green27@example.demo', '07159 352572', 'NN12 2OP', '11 Kettering Road', 'Northampton'),
  ('Julie', 'Cook', 'julie.cook28@example.demo', '07935 172574', 'NN10 6YU', '99 Wellingborough Road', 'Northampton'),
  ('Jessica', 'Murphy', 'jessica.murphy29@example.demo', '07662 273148', 'NN5 5PL', '68 Duston Main Road', 'Northampton'),
  ('Adam', 'Hughes', 'adam.hughes30@example.demo', '07652 891952', 'NN4 8LA', '92 St James Road', 'Northampton'),
  ('Ryan', 'Cooper', 'ryan.cooper31@example.demo', '07548 642717', 'NN8 4RT', '16 Bedford Road', 'Northampton'),
  ('Lucy', 'Wilson', 'lucy.wilson32@example.demo', '07446 122056', 'NN12 2OP', '71 Bedford Road', 'Northampton'),
  ('Michael', 'Edwards', 'michael.edwards33@example.demo', '07107 174441', 'NN1 3ER', '30 Kettering Road', 'Northampton'),
  ('Emily', 'Khan', 'emily.khan34@example.demo', '07172 639131', 'NN4 8LA', '36 Harlestone Road', 'Northampton'),
  ('Matthew', 'Reed', 'matthew.reed35@example.demo', '07235 858490', 'NN12 2OP', '74 Harlestone Road', 'Northampton'),
  ('Benjamin', 'Murphy', 'benjamin.murphy36@example.demo', '07926 526833', 'NN4 8LA', '13 Kettering Road', 'Northampton'),
  ('Fiona', 'Kelly', 'fiona.kelly37@example.demo', '07462 544154', 'NN7 1QW', '60 Abington Avenue', 'Northampton'),
  ('Richard', 'Thomas', 'richard.thomas38@example.demo', '07162 522179', 'NN6 9DF', '103 Kettering Road', 'Northampton'),
  ('Benjamin', 'White', 'benjamin.white39@example.demo', '07294 662336', 'NN8 4RT', '18 Booth Lane', 'Northampton'),
  ('Daniel', 'Lewis', 'daniel.lewis40@example.demo', '07573 361941', 'NN2 6BT', '57 East Hunsbury', 'Northampton'),
  ('Amelia', 'Davies', 'amelia.davies41@example.demo', '07767 666847', 'NN1 3ER', '12 Bedford Road', 'Northampton'),
  ('Sophie', 'Brooks', 'sophie.brooks42@example.demo', '07597 604740', 'NN4 8LA', '111 Booth Lane', 'Northampton'),
  ('Oliver', 'Wright', 'oliver.wright43@example.demo', '07488 102260', 'NN7 1QW', '34 Harlestone Road', 'Northampton'),
  ('Laura', 'Kelly', 'laura.kelly44@example.demo', '07813 865990', 'NN10 6YU', '85 Harlestone Road', 'Northampton'),
  ('Thomas', 'White', 'thomas.white45@example.demo', '07403 328275', 'NN1 3ER', '75 East Hunsbury', 'Northampton'),
  ('Oliver', 'Patel', 'oliver.patel46@example.demo', '07158 152578', 'NN12 2OP', '62 East Hunsbury', 'Northampton'),
  ('Christopher', 'Wright', 'christopher.wright47@example.demo', '07158 632496', 'NN2 6BT', '109 Wellingborough Road', 'Northampton'),
  ('Charlotte', 'Richardson', 'charlotte.richardson48@example.demo', '07169 808011', 'NN4 8LA', '52 Kettering Road', 'Northampton'),
  ('Helen', 'Green', 'helen.green49@example.demo', '07692 723398', 'NN1 3ER', '80 Kettering Road', 'Northampton'),
  ('Ellie', 'Cox', 'ellie.cox50@example.demo', '07678 648177', 'NN6 9DF', '120 St James Road', 'Northampton'),
  ('Matthew', 'Patel', 'matthew.patel51@example.demo', '07344 378517', 'NN7 1QW', '17 St James Road', 'Northampton'),
  ('Lewis', 'Patel', 'lewis.patel52@example.demo', '07869 176066', 'NN1 3ER', '59 Duston Main Road', 'Northampton'),
  ('Helen', 'Thomas', 'helen.thomas53@example.demo', '07175 663750', 'NN4 8LA', '65 St James Road', 'Northampton'),
  ('Jessica', 'Singh', 'jessica.singh54@example.demo', '07170 356150', 'NN6 9DF', '37 Wellingborough Road', 'Northampton'),
  ('Katie', 'Reed', 'katie.reed55@example.demo', '07820 417212', 'NN12 2OP', '104 East Hunsbury', 'Northampton'),
  ('Sarah', 'Howard', 'sarah.howard56@example.demo', '07406 795613', 'NN2 6BT', '113 Wellingborough Road', 'Northampton'),
  ('Rebecca', 'Roberts', 'rebecca.roberts57@example.demo', '07209 878480', 'NN10 6YU', '20 St James Road', 'Northampton'),
  ('Laura', 'Richardson', 'laura.richardson58@example.demo', '07315 852470', 'NN6 9DF', '27 St James Road', 'Northampton'),
  ('Victoria', 'Cook', 'victoria.cook59@example.demo', '07357 987204', 'NN1 3ER', '12 Booth Lane', 'Northampton'),
  ('Henry', 'Taylor', 'henry.taylor60@example.demo', '07103 449759', 'NN3 3HQ', '82 St James Road', 'Northampton'),
  ('Sophie', 'Sanders', 'sophie.sanders61@example.demo', '07664 839945', 'NN7 1QW', '72 Abington Avenue', 'Northampton'),
  ('George', 'Wilson', 'george.wilson62@example.demo', '07807 256294', 'NN10 6YU', '5 Kingsthorpe Grove', 'Northampton'),
  ('Michael', 'Howard', 'michael.howard63@example.demo', '07251 550664', 'NN3 3HQ', '6 St James Road', 'Northampton'),
  ('Joseph', 'Taylor', 'joseph.taylor64@example.demo', '07466 320281', 'NN4 8LA', '86 Kettering Road', 'Northampton'),
  ('Chloe', 'Howard', 'chloe.howard65@example.demo', '07995 526117', 'NN12 2OP', '96 Wellingborough Road', 'Northampton'),
  ('Benjamin', 'Wright', 'benjamin.wright66@example.demo', '07919 950155', 'NN3 3HQ', '113 Booth Lane', 'Northampton'),
  ('James', 'Thompson', 'james.thompson67@example.demo', '07854 448321', 'NN7 1QW', '103 Bedford Road', 'Northampton'),
  ('Henry', 'Wright', 'henry.wright68@example.demo', '07906 835343', 'NN2 6BT', '49 Abington Avenue', 'Northampton'),
  ('Nicola', 'Edwards', 'nicola.edwards69@example.demo', '07304 956253', 'NN8 4RT', '45 St James Road', 'Northampton'),
  ('Lucy', 'Edwards', 'lucy.edwards70@example.demo', '07124 792094', 'NN4 8LA', '52 Kingsthorpe Grove', 'Northampton'),
  ('Henry', 'Wilson', 'henry.wilson71@example.demo', '07891 392683', 'NN6 9DF', '83 East Hunsbury', 'Northampton'),
  ('Ryan', 'Reed', 'ryan.reed72@example.demo', '07439 128941', 'NN2 6BT', '113 St James Road', 'Northampton'),
  ('Daniel', 'Cox', 'daniel.cox73@example.demo', '07371 140115', 'NN2 6BT', '77 Booth Lane', 'Northampton'),
  ('Chloe', 'Patel', 'chloe.patel74@example.demo', '07546 735656', 'NN10 6YU', '15 Booth Lane', 'Northampton');

SELECT setval('lead_ref_seq', 200);
SELECT setval('booking_ref_seq', 100);
SELECT setval('job_ref_seq', 80);

-- Leads
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000001', 1, 'WEB_FORM', 'ELECTRICAL', 'Emergency — sparking from fuse box.', 'NORMAL'::urgency_level, 'NN5 5PL', 'NN5', 'PRIMARY'::service_area_class, 75, 'HIGH'::qualification_rating, '["Demo seed data"]'::jsonb, 'QUALIFIED'::lead_status, true, NOW() - INTERVAL '60 days', NOW() - INTERVAL '52 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000002', 2, 'WEB_FORM', 'ELECTRICAL', 'Install new light fittings in lounge.', 'EMERGENCY'::urgency_level, 'NN6 9DF', 'NN6', 'EXTENDED'::service_area_class, 2, 'LOW'::qualification_rating, '["Demo seed data"]'::jsonb, 'DUPLICATE'::lead_status, true, NOW() - INTERVAL '40 days', NOW() - INTERVAL '21 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000003', 3, 'WEB_FORM', 'PLUMBING', 'Radiator not heating in upstairs bedroom.', 'EMERGENCY'::urgency_level, 'NN5 5PL', 'NN5', 'PRIMARY'::service_area_class, 59, 'MEDIUM'::qualification_rating, '["Demo seed data"]'::jsonb, 'CANCELLED'::lead_status, true, NOW() - INTERVAL '21 days', NOW() - INTERVAL '26 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000004', 4, 'WEB_FORM', 'HEATING', 'Radiator not heating in upstairs bedroom.', 'URGENT'::urgency_level, 'NN10 6YU', 'NN10', 'EXTENDED'::service_area_class, 44, 'LOW'::qualification_rating, '["Demo seed data"]'::jsonb, 'COMPLETED'::lead_status, true, NOW() - INTERVAL '44 days', NOW() - INTERVAL '48 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000005', 5, 'WEB_FORM', 'ELECTRICAL', 'Kitchen tap dripping constantly, needs repair.', 'EMERGENCY'::urgency_level, 'NN12 2OP', 'NN12', 'EXTENDED'::service_area_class, 71, 'HIGH'::qualification_rating, '["Demo seed data"]'::jsonb, 'DORMANT'::lead_status, true, NOW() - INTERVAL '20 days', NOW() - INTERVAL '19 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000006', 6, 'WEB_FORM', 'ELECTRICAL', 'Replace broken garden fence panel.', 'URGENT'::urgency_level, 'NN7 1QW', 'NN7', 'EXTENDED'::service_area_class, 14, 'LOW'::qualification_rating, '["Demo seed data"]'::jsonb, 'OUTSIDE_SERVICE_AREA'::lead_status, true, NOW() - INTERVAL '44 days', NOW() - INTERVAL '14 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000007', 7, 'WEB_FORM', 'PROPERTY_MAINTENANCE', 'Leak under bathroom basin, water isolated.', 'EMERGENCY'::urgency_level, 'NN3 3HQ', 'NN3', 'PRIMARY'::service_area_class, 56, 'MEDIUM'::qualification_rating, '["Demo seed data"]'::jsonb, 'BOOKED'::lead_status, true, NOW() - INTERVAL '22 days', NOW() - INTERVAL '6 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000008', 8, 'WEB_FORM', 'ELECTRICAL', 'Power socket in bedroom not working.', 'NORMAL'::urgency_level, 'PE25 8XX', 'PE25', 'OUTSIDE'::service_area_class, 7, 'LOW'::qualification_rating, '["Demo seed data"]'::jsonb, 'OUTSIDE_SERVICE_AREA'::lead_status, true, NOW() - INTERVAL '2 days', NOW() - INTERVAL '3 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000009', 9, 'WEB_FORM', 'ELECTRICAL', 'Leak under bathroom basin, water isolated.', 'URGENT'::urgency_level, 'NN8 4RT', 'NN8', 'EXTENDED'::service_area_class, 78, 'HIGH'::qualification_rating, '["Demo seed data"]'::jsonb, 'BOOKED'::lead_status, true, NOW() - INTERVAL '13 days', NOW() - INTERVAL '46 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000010', 10, 'WEB_FORM', 'PROPERTY_MAINTENANCE', 'Kitchen tap dripping constantly, needs repair.', 'NORMAL'::urgency_level, 'NN8 4RT', 'NN8', 'EXTENDED'::service_area_class, 7, 'LOW'::qualification_rating, '["Demo seed data"]'::jsonb, 'DUPLICATE'::lead_status, true, NOW() - INTERVAL '58 days', NOW() - INTERVAL '49 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000011', 11, 'WEB_FORM', 'PLUMBING', 'Emergency — sparking from fuse box.', 'EMERGENCY'::urgency_level, 'NN7 1QW', 'NN7', 'EXTENDED'::service_area_class, 42, 'LOW'::qualification_rating, '["Demo seed data"]'::jsonb, 'CONTACTED'::lead_status, true, NOW() - INTERVAL '30 days', NOW() - INTERVAL '4 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000012', 12, 'WEB_FORM', 'ELECTRICAL', 'Emergency — sparking from fuse box.', 'URGENT'::urgency_level, 'NN2 6BT', 'NN2', 'PRIMARY'::service_area_class, 37, 'LOW'::qualification_rating, '["Demo seed data"]'::jsonb, 'MANUAL_REVIEW'::lead_status, true, NOW() - INTERVAL '36 days', NOW() - INTERVAL '39 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000013', 13, 'WEB_FORM', 'HEATING', 'Replace broken garden fence panel.', 'EMERGENCY'::urgency_level, 'NN8 4RT', 'NN8', 'EXTENDED'::service_area_class, 74, 'HIGH'::qualification_rating, '["Demo seed data"]'::jsonb, 'CANCELLED'::lead_status, true, NOW() - INTERVAL '58 days', NOW() - INTERVAL '11 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000014', 14, 'WEB_FORM', 'PROPERTY_MAINTENANCE', 'Water pouring from pipe under sink — urgent.', 'EMERGENCY'::urgency_level, 'NN8 4RT', 'NN8', 'EXTENDED'::service_area_class, 51, 'MEDIUM'::qualification_rating, '["Demo seed data"]'::jsonb, 'DORMANT'::lead_status, true, NOW() - INTERVAL '50 days', NOW() - INTERVAL '50 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000015', 15, 'WEB_FORM', 'PROPERTY_MAINTENANCE', 'Boiler making unusual noise and losing pressure.', 'URGENT'::urgency_level, 'PE25 8XX', 'PE25', 'OUTSIDE'::service_area_class, 8, 'LOW'::qualification_rating, '["Demo seed data"]'::jsonb, 'OUTSIDE_SERVICE_AREA'::lead_status, true, NOW() - INTERVAL '46 days', NOW() - INTERVAL '19 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000016', 16, 'WEB_FORM', 'ELECTRICAL', 'Boiler making unusual noise and losing pressure.', 'EMERGENCY'::urgency_level, 'NN5 5PL', 'NN5', 'PRIMARY'::service_area_class, 10, 'LOW'::qualification_rating, '["Demo seed data"]'::jsonb, 'OUTSIDE_SERVICE_AREA'::lead_status, true, NOW() - INTERVAL '9 days', NOW() - INTERVAL '10 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000017', 17, 'WEB_FORM', 'ELECTRICAL', 'Radiator not heating in upstairs bedroom.', 'NORMAL'::urgency_level, 'NN7 1QW', 'NN7', 'EXTENDED'::service_area_class, 47, 'MEDIUM'::qualification_rating, '["Demo seed data"]'::jsonb, 'COMPLETED'::lead_status, true, NOW() - INTERVAL '27 days', NOW() - INTERVAL '22 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000018', 18, 'WEB_FORM', 'PROPERTY_MAINTENANCE', 'Radiator not heating in upstairs bedroom.', 'URGENT'::urgency_level, 'NN7 1QW', 'NN7', 'EXTENDED'::service_area_class, 46, 'MEDIUM'::qualification_rating, '["Demo seed data"]'::jsonb, 'QUALIFIED'::lead_status, true, NOW() - INTERVAL '58 days', NOW() - INTERVAL '50 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000019', 19, 'WEB_FORM', 'PLUMBING', 'Install new light fittings in lounge.', 'NORMAL'::urgency_level, 'NN12 2OP', 'NN12', 'EXTENDED'::service_area_class, 15, 'LOW'::qualification_rating, '["Demo seed data"]'::jsonb, 'DUPLICATE'::lead_status, true, NOW() - INTERVAL '20 days', NOW() - INTERVAL '49 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000020', 20, 'WEB_FORM', 'PROPERTY_MAINTENANCE', 'Annual landlord safety inspection required.', 'EMERGENCY'::urgency_level, 'NN7 1QW', 'NN7', 'EXTENDED'::service_area_class, 89, 'VERY_HIGH'::qualification_rating, '["Demo seed data"]'::jsonb, 'CANCELLED'::lead_status, true, NOW() - INTERVAL '32 days', NOW() - INTERVAL '15 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000021', 21, 'WEB_FORM', 'HEATING', 'Install new light fittings in lounge.', 'URGENT'::urgency_level, 'NN7 1QW', 'NN7', 'EXTENDED'::service_area_class, 23, 'LOW'::qualification_rating, '["Demo seed data"]'::jsonb, 'MANUAL_REVIEW'::lead_status, true, NOW() - INTERVAL '43 days', NOW() - INTERVAL '44 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000022', 22, 'WEB_FORM', 'PROPERTY_MAINTENANCE', 'Emergency — sparking from fuse box.', 'EMERGENCY'::urgency_level, 'NN3 3HQ', 'NN3', 'PRIMARY'::service_area_class, 36, 'LOW'::qualification_rating, '["Demo seed data"]'::jsonb, 'MANUAL_REVIEW'::lead_status, true, NOW() - INTERVAL '2 days', NOW() - INTERVAL '59 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000023', 23, 'WEB_FORM', 'PROPERTY_MAINTENANCE', 'Radiator not heating in upstairs bedroom.', 'EMERGENCY'::urgency_level, 'NN12 2OP', 'NN12', 'EXTENDED'::service_area_class, 30, 'LOW'::qualification_rating, '["Demo seed data"]'::jsonb, 'QUALIFIED'::lead_status, true, NOW() - INTERVAL '9 days', NOW() - INTERVAL '56 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000024', 24, 'WEB_FORM', 'PROPERTY_MAINTENANCE', 'Install new light fittings in lounge.', 'URGENT'::urgency_level, 'NN3 3HQ', 'NN3', 'PRIMARY'::service_area_class, 53, 'MEDIUM'::qualification_rating, '["Demo seed data"]'::jsonb, 'QUALIFIED'::lead_status, true, NOW() - INTERVAL '14 days', NOW() - INTERVAL '30 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000025', 25, 'WEB_FORM', 'HEATING', 'Water pouring from pipe under sink — urgent.', 'URGENT'::urgency_level, 'NN6 9DF', 'NN6', 'EXTENDED'::service_area_class, 8, 'LOW'::qualification_rating, '["Demo seed data"]'::jsonb, 'DUPLICATE'::lead_status, true, NOW() - INTERVAL '54 days', NOW() - INTERVAL '6 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000026', 26, 'WEB_FORM', 'PROPERTY_MAINTENANCE', 'Annual landlord safety inspection required.', 'URGENT'::urgency_level, 'NN1 3ER', 'NN1', 'PRIMARY'::service_area_class, 26, 'LOW'::qualification_rating, '["Demo seed data"]'::jsonb, 'CANCELLED'::lead_status, true, NOW() - INTERVAL '42 days', NOW() - INTERVAL '5 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000027', 27, 'WEB_FORM', 'PLUMBING', 'Leak under bathroom basin, water isolated.', 'NORMAL'::urgency_level, 'NN1 3ER', 'NN1', 'PRIMARY'::service_area_class, 45, 'MEDIUM'::qualification_rating, '["Demo seed data"]'::jsonb, 'CONTACTED'::lead_status, true, NOW() - INTERVAL '10 days', NOW() - INTERVAL '16 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000028', 28, 'WEB_FORM', 'ELECTRICAL', 'Replace broken garden fence panel.', 'NORMAL'::urgency_level, 'NN8 4RT', 'NN8', 'EXTENDED'::service_area_class, 92, 'VERY_HIGH'::qualification_rating, '["Demo seed data"]'::jsonb, 'BOOKED'::lead_status, true, NOW() - INTERVAL '45 days', NOW() - INTERVAL '17 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000029', 29, 'WEB_FORM', 'HEATING', 'Boiler making unusual noise and losing pressure.', 'URGENT'::urgency_level, 'NN3 3HQ', 'NN3', 'PRIMARY'::service_area_class, 40, 'LOW'::qualification_rating, '["Demo seed data"]'::jsonb, 'BOOKED'::lead_status, true, NOW() - INTERVAL '38 days', NOW() - INTERVAL '2 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000030', 30, 'WEB_FORM', 'HEATING', 'Annual landlord safety inspection required.', 'EMERGENCY'::urgency_level, 'NN12 2OP', 'NN12', 'EXTENDED'::service_area_class, 12, 'LOW'::qualification_rating, '["Demo seed data"]'::jsonb, 'DUPLICATE'::lead_status, true, NOW() - INTERVAL '5 days', NOW() - INTERVAL '38 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000031', 31, 'WEB_FORM', 'ELECTRICAL', 'Kitchen tap dripping constantly, needs repair.', 'EMERGENCY'::urgency_level, 'NN2 6BT', 'NN2', 'PRIMARY'::service_area_class, 35, 'LOW'::qualification_rating, '["Demo seed data"]'::jsonb, 'DORMANT'::lead_status, true, NOW() - INTERVAL '23 days', NOW() - INTERVAL '35 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000032', 32, 'WEB_FORM', 'PROPERTY_MAINTENANCE', 'Install new light fittings in lounge.', 'EMERGENCY'::urgency_level, 'PE25 8XX', 'PE25', 'OUTSIDE'::service_area_class, 2, 'LOW'::qualification_rating, '["Demo seed data"]'::jsonb, 'OUTSIDE_SERVICE_AREA'::lead_status, true, NOW() - INTERVAL '1 days', NOW() - INTERVAL '55 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000033', 33, 'WEB_FORM', 'PROPERTY_MAINTENANCE', 'Replace broken garden fence panel.', 'URGENT'::urgency_level, 'NN8 4RT', 'NN8', 'EXTENDED'::service_area_class, 75, 'HIGH'::qualification_rating, '["Demo seed data"]'::jsonb, 'BOOKED'::lead_status, true, NOW() - INTERVAL '46 days', NOW() - INTERVAL '10 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000034', 34, 'WEB_FORM', 'PROPERTY_MAINTENANCE', 'Emergency — sparking from fuse box.', 'EMERGENCY'::urgency_level, 'NN3 3HQ', 'NN3', 'PRIMARY'::service_area_class, 54, 'MEDIUM'::qualification_rating, '["Demo seed data"]'::jsonb, 'CANCELLED'::lead_status, true, NOW() - INTERVAL '50 days', NOW() - INTERVAL '31 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000035', 35, 'WEB_FORM', 'PROPERTY_MAINTENANCE', 'Boiler making unusual noise and losing pressure.', 'NORMAL'::urgency_level, 'NN7 1QW', 'NN7', 'EXTENDED'::service_area_class, 61, 'MEDIUM'::qualification_rating, '["Demo seed data"]'::jsonb, 'DORMANT'::lead_status, true, NOW() - INTERVAL '18 days', NOW() - INTERVAL '57 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000036', 36, 'WEB_FORM', 'PROPERTY_MAINTENANCE', 'Radiator not heating in upstairs bedroom.', 'EMERGENCY'::urgency_level, 'NN4 8LA', 'NN4', 'PRIMARY'::service_area_class, 92, 'VERY_HIGH'::qualification_rating, '["Demo seed data"]'::jsonb, 'MANUAL_REVIEW'::lead_status, true, NOW() - INTERVAL '22 days', NOW() - INTERVAL '2 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000037', 37, 'WEB_FORM', 'PROPERTY_MAINTENANCE', 'Install new light fittings in lounge.', 'NORMAL'::urgency_level, 'NN6 9DF', 'NN6', 'EXTENDED'::service_area_class, 82, 'VERY_HIGH'::qualification_rating, '["Demo seed data"]'::jsonb, 'COMPLETED'::lead_status, true, NOW() - INTERVAL '52 days', NOW() - INTERVAL '17 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000038', 38, 'WEB_FORM', 'HEATING', 'Emergency — sparking from fuse box.', 'NORMAL'::urgency_level, 'NN5 5PL', 'NN5', 'PRIMARY'::service_area_class, 91, 'VERY_HIGH'::qualification_rating, '["Demo seed data"]'::jsonb, 'DORMANT'::lead_status, true, NOW() - INTERVAL '13 days', NOW() - INTERVAL '6 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000039', 39, 'WEB_FORM', 'ELECTRICAL', 'Replace broken garden fence panel.', 'NORMAL'::urgency_level, 'NN7 1QW', 'NN7', 'EXTENDED'::service_area_class, 91, 'VERY_HIGH'::qualification_rating, '["Demo seed data"]'::jsonb, 'MANUAL_REVIEW'::lead_status, true, NOW() - INTERVAL '42 days', NOW() - INTERVAL '46 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000040', 40, 'WEB_FORM', 'PROPERTY_MAINTENANCE', 'Annual landlord safety inspection required.', 'URGENT'::urgency_level, 'NN8 4RT', 'NN8', 'EXTENDED'::service_area_class, 31, 'LOW'::qualification_rating, '["Demo seed data"]'::jsonb, 'QUALIFIED'::lead_status, true, NOW() - INTERVAL '26 days', NOW() - INTERVAL '45 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000041', 41, 'WEB_FORM', 'ELECTRICAL', 'Emergency — sparking from fuse box.', 'EMERGENCY'::urgency_level, 'NN5 5PL', 'NN5', 'PRIMARY'::service_area_class, 15, 'LOW'::qualification_rating, '["Demo seed data"]'::jsonb, 'OUTSIDE_SERVICE_AREA'::lead_status, true, NOW() - INTERVAL '23 days', NOW() - INTERVAL '28 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000042', 42, 'WEB_FORM', 'HEATING', 'Water pouring from pipe under sink — urgent.', 'URGENT'::urgency_level, 'NN6 9DF', 'NN6', 'EXTENDED'::service_area_class, 54, 'MEDIUM'::qualification_rating, '["Demo seed data"]'::jsonb, 'MANUAL_REVIEW'::lead_status, true, NOW() - INTERVAL '15 days', NOW() - INTERVAL '8 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000043', 43, 'WEB_FORM', 'ELECTRICAL', 'Power socket in bedroom not working.', 'EMERGENCY'::urgency_level, 'NN6 9DF', 'NN6', 'EXTENDED'::service_area_class, 88, 'VERY_HIGH'::qualification_rating, '["Demo seed data"]'::jsonb, 'BOOKED'::lead_status, true, NOW() - INTERVAL '13 days', NOW() - INTERVAL '14 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000044', 44, 'WEB_FORM', 'PROPERTY_MAINTENANCE', 'Annual landlord safety inspection required.', 'NORMAL'::urgency_level, 'NN5 5PL', 'NN5', 'PRIMARY'::service_area_class, 56, 'MEDIUM'::qualification_rating, '["Demo seed data"]'::jsonb, 'CANCELLED'::lead_status, true, NOW() - INTERVAL '19 days', NOW() - INTERVAL '15 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000045', 45, 'WEB_FORM', 'HEATING', 'Emergency — sparking from fuse box.', 'EMERGENCY'::urgency_level, 'NN3 3HQ', 'NN3', 'PRIMARY'::service_area_class, 21, 'LOW'::qualification_rating, '["Demo seed data"]'::jsonb, 'DORMANT'::lead_status, true, NOW() - INTERVAL '9 days', NOW() - INTERVAL '18 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000046', 46, 'WEB_FORM', 'PLUMBING', 'Power socket in bedroom not working.', 'EMERGENCY'::urgency_level, 'NN1 3ER', 'NN1', 'PRIMARY'::service_area_class, 57, 'MEDIUM'::qualification_rating, '["Demo seed data"]'::jsonb, 'CANCELLED'::lead_status, true, NOW() - INTERVAL '41 days', NOW() - INTERVAL '56 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000047', 47, 'WEB_FORM', 'PROPERTY_MAINTENANCE', 'Replace broken garden fence panel.', 'URGENT'::urgency_level, 'NN2 6BT', 'NN2', 'PRIMARY'::service_area_class, 93, 'VERY_HIGH'::qualification_rating, '["Demo seed data"]'::jsonb, 'QUALIFIED'::lead_status, true, NOW() - INTERVAL '31 days', NOW() - INTERVAL '29 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000048', 48, 'WEB_FORM', 'HEATING', 'Boiler making unusual noise and losing pressure.', 'URGENT'::urgency_level, 'NN3 3HQ', 'NN3', 'PRIMARY'::service_area_class, 52, 'MEDIUM'::qualification_rating, '["Demo seed data"]'::jsonb, 'QUALIFIED'::lead_status, true, NOW() - INTERVAL '53 days', NOW() - INTERVAL '5 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000049', 49, 'WEB_FORM', 'PROPERTY_MAINTENANCE', 'Kitchen tap dripping constantly, needs repair.', 'EMERGENCY'::urgency_level, 'NN8 4RT', 'NN8', 'EXTENDED'::service_area_class, 93, 'VERY_HIGH'::qualification_rating, '["Demo seed data"]'::jsonb, 'BOOKED'::lead_status, true, NOW() - INTERVAL '10 days', NOW() - INTERVAL '10 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000050', 50, 'WEB_FORM', 'HEATING', 'Radiator not heating in upstairs bedroom.', 'EMERGENCY'::urgency_level, 'NN2 6BT', 'NN2', 'PRIMARY'::service_area_class, 35, 'LOW'::qualification_rating, '["Demo seed data"]'::jsonb, 'CONTACTED'::lead_status, true, NOW() - INTERVAL '39 days', NOW() - INTERVAL '39 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000051', 51, 'WEB_FORM', 'ELECTRICAL', 'Water pouring from pipe under sink — urgent.', 'URGENT'::urgency_level, 'NN10 6YU', 'NN10', 'EXTENDED'::service_area_class, 14, 'LOW'::qualification_rating, '["Demo seed data"]'::jsonb, 'DUPLICATE'::lead_status, true, NOW() - INTERVAL '56 days', NOW() - INTERVAL '38 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000052', 52, 'WEB_FORM', 'PROPERTY_MAINTENANCE', 'Annual landlord safety inspection required.', 'NORMAL'::urgency_level, 'NN5 5PL', 'NN5', 'PRIMARY'::service_area_class, 32, 'LOW'::qualification_rating, '["Demo seed data"]'::jsonb, 'QUALIFIED'::lead_status, true, NOW() - INTERVAL '17 days', NOW() - INTERVAL '43 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000053', 53, 'WEB_FORM', 'PLUMBING', 'Boiler making unusual noise and losing pressure.', 'EMERGENCY'::urgency_level, 'NN3 3HQ', 'NN3', 'PRIMARY'::service_area_class, 42, 'LOW'::qualification_rating, '["Demo seed data"]'::jsonb, 'CONTACTED'::lead_status, true, NOW() - INTERVAL '11 days', NOW() - INTERVAL '1 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000054', 54, 'WEB_FORM', 'PROPERTY_MAINTENANCE', 'Annual landlord safety inspection required.', 'NORMAL'::urgency_level, 'NN8 4RT', 'NN8', 'EXTENDED'::service_area_class, 57, 'MEDIUM'::qualification_rating, '["Demo seed data"]'::jsonb, 'MANUAL_REVIEW'::lead_status, true, NOW() - INTERVAL '19 days', NOW() - INTERVAL '46 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000055', 55, 'WEB_FORM', 'HEATING', 'Leak under bathroom basin, water isolated.', 'URGENT'::urgency_level, 'NN8 4RT', 'NN8', 'EXTENDED'::service_area_class, 49, 'MEDIUM'::qualification_rating, '["Demo seed data"]'::jsonb, 'BOOKED'::lead_status, true, NOW() - INTERVAL '43 days', NOW() - INTERVAL '52 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000056', 56, 'WEB_FORM', 'ELECTRICAL', 'Power socket in bedroom not working.', 'NORMAL'::urgency_level, 'NN7 1QW', 'NN7', 'EXTENDED'::service_area_class, 89, 'VERY_HIGH'::qualification_rating, '["Demo seed data"]'::jsonb, 'BOOKED'::lead_status, true, NOW() - INTERVAL '59 days', NOW() - INTERVAL '18 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000057', 57, 'WEB_FORM', 'ELECTRICAL', 'Leak under bathroom basin, water isolated.', 'URGENT'::urgency_level, 'NN2 6BT', 'NN2', 'PRIMARY'::service_area_class, 41, 'LOW'::qualification_rating, '["Demo seed data"]'::jsonb, 'QUALIFIED'::lead_status, true, NOW() - INTERVAL '48 days', NOW() - INTERVAL '53 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000058', 58, 'WEB_FORM', 'HEATING', 'Water pouring from pipe under sink — urgent.', 'EMERGENCY'::urgency_level, 'NN8 4RT', 'NN8', 'EXTENDED'::service_area_class, 79, 'HIGH'::qualification_rating, '["Demo seed data"]'::jsonb, 'BOOKED'::lead_status, true, NOW() - INTERVAL '45 days', NOW() - INTERVAL '26 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000059', 59, 'WEB_FORM', 'HEATING', 'Boiler making unusual noise and losing pressure.', 'URGENT'::urgency_level, 'NN10 6YU', 'NN10', 'EXTENDED'::service_area_class, 83, 'VERY_HIGH'::qualification_rating, '["Demo seed data"]'::jsonb, 'CANCELLED'::lead_status, true, NOW() - INTERVAL '39 days', NOW() - INTERVAL '3 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000060', 60, 'WEB_FORM', 'PROPERTY_MAINTENANCE', 'Annual landlord safety inspection required.', 'NORMAL'::urgency_level, 'NN6 9DF', 'NN6', 'EXTENDED'::service_area_class, 23, 'LOW'::qualification_rating, '["Demo seed data"]'::jsonb, 'DORMANT'::lead_status, true, NOW() - INTERVAL '44 days', NOW() - INTERVAL '54 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000061', 61, 'WEB_FORM', 'PLUMBING', 'Power socket in bedroom not working.', 'NORMAL'::urgency_level, 'PE25 8XX', 'PE25', 'OUTSIDE'::service_area_class, 18, 'LOW'::qualification_rating, '["Demo seed data"]'::jsonb, 'OUTSIDE_SERVICE_AREA'::lead_status, true, NOW() - INTERVAL '31 days', NOW() - INTERVAL '34 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000062', 62, 'WEB_FORM', 'PROPERTY_MAINTENANCE', 'Replace broken garden fence panel.', 'URGENT'::urgency_level, 'NN5 5PL', 'NN5', 'PRIMARY'::service_area_class, 94, 'VERY_HIGH'::qualification_rating, '["Demo seed data"]'::jsonb, 'COMPLETED'::lead_status, true, NOW() - INTERVAL '6 days', NOW() - INTERVAL '31 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000063', 63, 'WEB_FORM', 'HEATING', 'Boiler making unusual noise and losing pressure.', 'EMERGENCY'::urgency_level, 'NN7 1QW', 'NN7', 'EXTENDED'::service_area_class, 10, 'LOW'::qualification_rating, '["Demo seed data"]'::jsonb, 'OUTSIDE_SERVICE_AREA'::lead_status, true, NOW() - INTERVAL '55 days', NOW() - INTERVAL '11 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000064', 64, 'WEB_FORM', 'HEATING', 'Radiator not heating in upstairs bedroom.', 'EMERGENCY'::urgency_level, 'NN7 1QW', 'NN7', 'EXTENDED'::service_area_class, 56, 'MEDIUM'::qualification_rating, '["Demo seed data"]'::jsonb, 'MANUAL_REVIEW'::lead_status, true, NOW() - INTERVAL '53 days', NOW() - INTERVAL '49 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000065', 65, 'WEB_FORM', 'PLUMBING', 'Install new light fittings in lounge.', 'URGENT'::urgency_level, 'NN8 4RT', 'NN8', 'EXTENDED'::service_area_class, 60, 'MEDIUM'::qualification_rating, '["Demo seed data"]'::jsonb, 'BOOKED'::lead_status, true, NOW() - INTERVAL '8 days', NOW() - INTERVAL '50 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000066', 66, 'WEB_FORM', 'PROPERTY_MAINTENANCE', 'Radiator not heating in upstairs bedroom.', 'URGENT'::urgency_level, 'NN10 6YU', 'NN10', 'EXTENDED'::service_area_class, 89, 'VERY_HIGH'::qualification_rating, '["Demo seed data"]'::jsonb, 'QUALIFIED'::lead_status, true, NOW() - INTERVAL '4 days', NOW() - INTERVAL '13 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000067', 67, 'WEB_FORM', 'HEATING', 'Annual landlord safety inspection required.', 'NORMAL'::urgency_level, 'NN12 2OP', 'NN12', 'EXTENDED'::service_area_class, 76, 'HIGH'::qualification_rating, '["Demo seed data"]'::jsonb, 'MANUAL_REVIEW'::lead_status, true, NOW() - INTERVAL '18 days', NOW() - INTERVAL '36 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000068', 68, 'WEB_FORM', 'ELECTRICAL', 'Kitchen tap dripping constantly, needs repair.', 'NORMAL'::urgency_level, 'NN5 5PL', 'NN5', 'PRIMARY'::service_area_class, 82, 'VERY_HIGH'::qualification_rating, '["Demo seed data"]'::jsonb, 'MANUAL_REVIEW'::lead_status, true, NOW() - INTERVAL '41 days', NOW() - INTERVAL '39 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000069', 69, 'WEB_FORM', 'ELECTRICAL', 'Emergency — sparking from fuse box.', 'NORMAL'::urgency_level, 'NN3 3HQ', 'NN3', 'PRIMARY'::service_area_class, 90, 'VERY_HIGH'::qualification_rating, '["Demo seed data"]'::jsonb, 'DORMANT'::lead_status, true, NOW() - INTERVAL '27 days', NOW() - INTERVAL '6 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000070', 70, 'WEB_FORM', 'ELECTRICAL', 'Power socket in bedroom not working.', 'EMERGENCY'::urgency_level, 'NN2 6BT', 'NN2', 'PRIMARY'::service_area_class, 35, 'LOW'::qualification_rating, '["Demo seed data"]'::jsonb, 'MANUAL_REVIEW'::lead_status, true, NOW() - INTERVAL '32 days', NOW() - INTERVAL '60 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000071', 71, 'WEB_FORM', 'HEATING', 'Replace broken garden fence panel.', 'URGENT'::urgency_level, 'NN10 6YU', 'NN10', 'EXTENDED'::service_area_class, 73, 'HIGH'::qualification_rating, '["Demo seed data"]'::jsonb, 'DORMANT'::lead_status, true, NOW() - INTERVAL '16 days', NOW() - INTERVAL '30 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000072', 72, 'WEB_FORM', 'ELECTRICAL', 'Power socket in bedroom not working.', 'EMERGENCY'::urgency_level, 'NN7 1QW', 'NN7', 'EXTENDED'::service_area_class, 85, 'VERY_HIGH'::qualification_rating, '["Demo seed data"]'::jsonb, 'CONTACTED'::lead_status, true, NOW() - INTERVAL '56 days', NOW() - INTERVAL '5 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000073', 73, 'WEB_FORM', 'HEATING', 'Water pouring from pipe under sink — urgent.', 'EMERGENCY'::urgency_level, 'NN7 1QW', 'NN7', 'EXTENDED'::service_area_class, 29, 'LOW'::qualification_rating, '["Demo seed data"]'::jsonb, 'OUTSIDE_SERVICE_AREA'::lead_status, true, NOW() - INTERVAL '53 days', NOW() - INTERVAL '1 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000074', 74, 'WEB_FORM', 'HEATING', 'Emergency — sparking from fuse box.', 'URGENT'::urgency_level, 'NN5 5PL', 'NN5', 'PRIMARY'::service_area_class, 39, 'LOW'::qualification_rating, '["Demo seed data"]'::jsonb, 'MANUAL_REVIEW'::lead_status, true, NOW() - INTERVAL '31 days', NOW() - INTERVAL '23 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000075', 75, 'WEB_FORM', 'HEATING', 'Install new light fittings in lounge.', 'URGENT'::urgency_level, 'NN10 6YU', 'NN10', 'EXTENDED'::service_area_class, 68, 'HIGH'::qualification_rating, '["Demo seed data"]'::jsonb, 'CANCELLED'::lead_status, true, NOW() - INTERVAL '56 days', NOW() - INTERVAL '13 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000076', 1, 'WEB_FORM', 'ELECTRICAL', 'Kitchen tap dripping constantly, needs repair.', 'URGENT'::urgency_level, 'NN12 2OP', 'NN12', 'EXTENDED'::service_area_class, 7, 'LOW'::qualification_rating, '["Demo seed data"]'::jsonb, 'DUPLICATE'::lead_status, true, NOW() - INTERVAL '21 days', NOW() - INTERVAL '48 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000077', 2, 'WEB_FORM', 'PROPERTY_MAINTENANCE', 'Power socket in bedroom not working.', 'EMERGENCY'::urgency_level, 'NN7 1QW', 'NN7', 'EXTENDED'::service_area_class, 21, 'LOW'::qualification_rating, '["Demo seed data"]'::jsonb, 'DUPLICATE'::lead_status, true, NOW() - INTERVAL '32 days', NOW() - INTERVAL '3 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000078', 3, 'WEB_FORM', 'ELECTRICAL', 'Replace broken garden fence panel.', 'NORMAL'::urgency_level, 'NN10 6YU', 'NN10', 'EXTENDED'::service_area_class, 27, 'LOW'::qualification_rating, '["Demo seed data"]'::jsonb, 'OUTSIDE_SERVICE_AREA'::lead_status, true, NOW() - INTERVAL '7 days', NOW() - INTERVAL '34 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000079', 4, 'WEB_FORM', 'PROPERTY_MAINTENANCE', 'Power socket in bedroom not working.', 'EMERGENCY'::urgency_level, 'NN1 3ER', 'NN1', 'PRIMARY'::service_area_class, 72, 'HIGH'::qualification_rating, '["Demo seed data"]'::jsonb, 'COMPLETED'::lead_status, true, NOW() - INTERVAL '5 days', NOW() - INTERVAL '31 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000080', 5, 'WEB_FORM', 'HEATING', 'Install new light fittings in lounge.', 'NORMAL'::urgency_level, 'NN6 9DF', 'NN6', 'EXTENDED'::service_area_class, 20, 'LOW'::qualification_rating, '["Demo seed data"]'::jsonb, 'DUPLICATE'::lead_status, true, NOW() - INTERVAL '55 days', NOW() - INTERVAL '44 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000081', 6, 'WEB_FORM', 'PROPERTY_MAINTENANCE', 'Leak under bathroom basin, water isolated.', 'NORMAL'::urgency_level, 'NN6 9DF', 'NN6', 'EXTENDED'::service_area_class, 89, 'VERY_HIGH'::qualification_rating, '["Demo seed data"]'::jsonb, 'MANUAL_REVIEW'::lead_status, true, NOW() - INTERVAL '5 days', NOW() - INTERVAL '16 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000082', 7, 'WEB_FORM', 'HEATING', 'Boiler making unusual noise and losing pressure.', 'NORMAL'::urgency_level, 'NN4 8LA', 'NN4', 'PRIMARY'::service_area_class, 75, 'HIGH'::qualification_rating, '["Demo seed data"]'::jsonb, 'BOOKED'::lead_status, true, NOW() - INTERVAL '29 days', NOW() - INTERVAL '11 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000083', 8, 'WEB_FORM', 'HEATING', 'Water pouring from pipe under sink — urgent.', 'NORMAL'::urgency_level, 'NN1 3ER', 'NN1', 'PRIMARY'::service_area_class, 61, 'MEDIUM'::qualification_rating, '["Demo seed data"]'::jsonb, 'QUALIFIED'::lead_status, true, NOW() - INTERVAL '23 days', NOW() - INTERVAL '24 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000084', 9, 'WEB_FORM', 'PROPERTY_MAINTENANCE', 'Leak under bathroom basin, water isolated.', 'URGENT'::urgency_level, 'NN3 3HQ', 'NN3', 'PRIMARY'::service_area_class, 87, 'VERY_HIGH'::qualification_rating, '["Demo seed data"]'::jsonb, 'CONTACTED'::lead_status, true, NOW() - INTERVAL '44 days', NOW() - INTERVAL '51 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000085', 10, 'WEB_FORM', 'ELECTRICAL', 'Radiator not heating in upstairs bedroom.', 'EMERGENCY'::urgency_level, 'NN3 3HQ', 'NN3', 'PRIMARY'::service_area_class, 30, 'LOW'::qualification_rating, '["Demo seed data"]'::jsonb, 'COMPLETED'::lead_status, true, NOW() - INTERVAL '40 days', NOW() - INTERVAL '44 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000086', 11, 'WEB_FORM', 'ELECTRICAL', 'Water pouring from pipe under sink — urgent.', 'URGENT'::urgency_level, 'NN8 4RT', 'NN8', 'EXTENDED'::service_area_class, 49, 'MEDIUM'::qualification_rating, '["Demo seed data"]'::jsonb, 'COMPLETED'::lead_status, true, NOW() - INTERVAL '30 days', NOW() - INTERVAL '17 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000087', 12, 'WEB_FORM', 'PLUMBING', 'Boiler making unusual noise and losing pressure.', 'NORMAL'::urgency_level, 'NN8 4RT', 'NN8', 'EXTENDED'::service_area_class, 89, 'VERY_HIGH'::qualification_rating, '["Demo seed data"]'::jsonb, 'DORMANT'::lead_status, true, NOW() - INTERVAL '29 days', NOW() - INTERVAL '23 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000088', 13, 'WEB_FORM', 'HEATING', 'Replace broken garden fence panel.', 'URGENT'::urgency_level, 'PE25 8XX', 'PE25', 'OUTSIDE'::service_area_class, 22, 'LOW'::qualification_rating, '["Demo seed data"]'::jsonb, 'OUTSIDE_SERVICE_AREA'::lead_status, true, NOW() - INTERVAL '55 days', NOW() - INTERVAL '20 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000089', 14, 'WEB_FORM', 'ELECTRICAL', 'Radiator not heating in upstairs bedroom.', 'NORMAL'::urgency_level, 'NN7 1QW', 'NN7', 'EXTENDED'::service_area_class, 33, 'LOW'::qualification_rating, '["Demo seed data"]'::jsonb, 'MANUAL_REVIEW'::lead_status, true, NOW() - INTERVAL '37 days', NOW() - INTERVAL '23 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000090', 15, 'WEB_FORM', 'HEATING', 'Kitchen tap dripping constantly, needs repair.', 'URGENT'::urgency_level, 'NN5 5PL', 'NN5', 'PRIMARY'::service_area_class, 70, 'HIGH'::qualification_rating, '["Demo seed data"]'::jsonb, 'QUALIFIED'::lead_status, true, NOW() - INTERVAL '37 days', NOW() - INTERVAL '56 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000091', 16, 'WEB_FORM', 'PLUMBING', 'Leak under bathroom basin, water isolated.', 'NORMAL'::urgency_level, 'NN12 2OP', 'NN12', 'EXTENDED'::service_area_class, 56, 'MEDIUM'::qualification_rating, '["Demo seed data"]'::jsonb, 'MANUAL_REVIEW'::lead_status, true, NOW() - INTERVAL '52 days', NOW() - INTERVAL '23 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000092', 17, 'WEB_FORM', 'ELECTRICAL', 'Power socket in bedroom not working.', 'URGENT'::urgency_level, 'PE25 8XX', 'PE25', 'OUTSIDE'::service_area_class, 19, 'LOW'::qualification_rating, '["Demo seed data"]'::jsonb, 'OUTSIDE_SERVICE_AREA'::lead_status, true, NOW() - INTERVAL '41 days', NOW() - INTERVAL '7 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000093', 18, 'WEB_FORM', 'PLUMBING', 'Install new light fittings in lounge.', 'EMERGENCY'::urgency_level, 'NN5 5PL', 'NN5', 'PRIMARY'::service_area_class, 24, 'LOW'::qualification_rating, '["Demo seed data"]'::jsonb, 'MANUAL_REVIEW'::lead_status, true, NOW() - INTERVAL '47 days', NOW() - INTERVAL '9 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000094', 19, 'WEB_FORM', 'PLUMBING', 'Power socket in bedroom not working.', 'URGENT'::urgency_level, 'NN5 5PL', 'NN5', 'PRIMARY'::service_area_class, 23, 'LOW'::qualification_rating, '["Demo seed data"]'::jsonb, 'OUTSIDE_SERVICE_AREA'::lead_status, true, NOW() - INTERVAL '13 days', NOW() - INTERVAL '9 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000095', 20, 'WEB_FORM', 'HEATING', 'Water pouring from pipe under sink — urgent.', 'NORMAL'::urgency_level, 'NN10 6YU', 'NN10', 'EXTENDED'::service_area_class, 54, 'MEDIUM'::qualification_rating, '["Demo seed data"]'::jsonb, 'CANCELLED'::lead_status, true, NOW() - INTERVAL '59 days', NOW() - INTERVAL '53 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000096', 21, 'WEB_FORM', 'PROPERTY_MAINTENANCE', 'Replace broken garden fence panel.', 'NORMAL'::urgency_level, 'NN5 5PL', 'NN5', 'PRIMARY'::service_area_class, 25, 'LOW'::qualification_rating, '["Demo seed data"]'::jsonb, 'OUTSIDE_SERVICE_AREA'::lead_status, true, NOW() - INTERVAL '5 days', NOW() - INTERVAL '10 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000097', 22, 'WEB_FORM', 'ELECTRICAL', 'Install new light fittings in lounge.', 'EMERGENCY'::urgency_level, 'PE25 8XX', 'PE25', 'OUTSIDE'::service_area_class, 30, 'LOW'::qualification_rating, '["Demo seed data"]'::jsonb, 'OUTSIDE_SERVICE_AREA'::lead_status, true, NOW() - INTERVAL '6 days', NOW() - INTERVAL '51 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000098', 23, 'WEB_FORM', 'PROPERTY_MAINTENANCE', 'Replace broken garden fence panel.', 'NORMAL'::urgency_level, 'NN1 3ER', 'NN1', 'PRIMARY'::service_area_class, 88, 'VERY_HIGH'::qualification_rating, '["Demo seed data"]'::jsonb, 'DORMANT'::lead_status, true, NOW() - INTERVAL '24 days', NOW() - INTERVAL '44 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000099', 24, 'WEB_FORM', 'HEATING', 'Install new light fittings in lounge.', 'EMERGENCY'::urgency_level, 'NN12 2OP', 'NN12', 'EXTENDED'::service_area_class, 26, 'LOW'::qualification_rating, '["Demo seed data"]'::jsonb, 'DUPLICATE'::lead_status, true, NOW() - INTERVAL '7 days', NOW() - INTERVAL '44 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000100', 25, 'WEB_FORM', 'ELECTRICAL', 'Leak under bathroom basin, water isolated.', 'URGENT'::urgency_level, 'NN8 4RT', 'NN8', 'EXTENDED'::service_area_class, 91, 'VERY_HIGH'::qualification_rating, '["Demo seed data"]'::jsonb, 'QUALIFIED'::lead_status, true, NOW() - INTERVAL '15 days', NOW() - INTERVAL '42 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000101', 26, 'WEB_FORM', 'PLUMBING', 'Water pouring from pipe under sink — urgent.', 'EMERGENCY'::urgency_level, 'PE25 8XX', 'PE25', 'OUTSIDE'::service_area_class, 29, 'LOW'::qualification_rating, '["Demo seed data"]'::jsonb, 'OUTSIDE_SERVICE_AREA'::lead_status, true, NOW() - INTERVAL '42 days', NOW() - INTERVAL '27 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000102', 27, 'WEB_FORM', 'PLUMBING', 'Replace broken garden fence panel.', 'URGENT'::urgency_level, 'NN3 3HQ', 'NN3', 'PRIMARY'::service_area_class, 24, 'LOW'::qualification_rating, '["Demo seed data"]'::jsonb, 'QUALIFIED'::lead_status, true, NOW() - INTERVAL '8 days', NOW() - INTERVAL '7 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000103', 28, 'WEB_FORM', 'ELECTRICAL', 'Install new light fittings in lounge.', 'URGENT'::urgency_level, 'NN10 6YU', 'NN10', 'EXTENDED'::service_area_class, 69, 'HIGH'::qualification_rating, '["Demo seed data"]'::jsonb, 'COMPLETED'::lead_status, true, NOW() - INTERVAL '43 days', NOW() - INTERVAL '48 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000104', 29, 'WEB_FORM', 'PROPERTY_MAINTENANCE', 'Boiler making unusual noise and losing pressure.', 'EMERGENCY'::urgency_level, 'NN12 2OP', 'NN12', 'EXTENDED'::service_area_class, 73, 'HIGH'::qualification_rating, '["Demo seed data"]'::jsonb, 'COMPLETED'::lead_status, true, NOW() - INTERVAL '54 days', NOW() - INTERVAL '32 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000105', 30, 'WEB_FORM', 'PROPERTY_MAINTENANCE', 'Replace broken garden fence panel.', 'NORMAL'::urgency_level, 'NN5 5PL', 'NN5', 'PRIMARY'::service_area_class, 67, 'HIGH'::qualification_rating, '["Demo seed data"]'::jsonb, 'QUALIFIED'::lead_status, true, NOW() - INTERVAL '29 days', NOW() - INTERVAL '16 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000106', 31, 'WEB_FORM', 'HEATING', 'Install new light fittings in lounge.', 'EMERGENCY'::urgency_level, 'NN2 6BT', 'NN2', 'PRIMARY'::service_area_class, 17, 'LOW'::qualification_rating, '["Demo seed data"]'::jsonb, 'OUTSIDE_SERVICE_AREA'::lead_status, true, NOW() - INTERVAL '4 days', NOW() - INTERVAL '26 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000107', 32, 'WEB_FORM', 'HEATING', 'Annual landlord safety inspection required.', 'NORMAL'::urgency_level, 'NN4 8LA', 'NN4', 'PRIMARY'::service_area_class, 78, 'HIGH'::qualification_rating, '["Demo seed data"]'::jsonb, 'BOOKED'::lead_status, true, NOW() - INTERVAL '42 days', NOW() - INTERVAL '41 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000108', 33, 'WEB_FORM', 'PLUMBING', 'Leak under bathroom basin, water isolated.', 'NORMAL'::urgency_level, 'NN1 3ER', 'NN1', 'PRIMARY'::service_area_class, 7, 'LOW'::qualification_rating, '["Demo seed data"]'::jsonb, 'OUTSIDE_SERVICE_AREA'::lead_status, true, NOW() - INTERVAL '14 days', NOW() - INTERVAL '5 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000109', 34, 'WEB_FORM', 'ELECTRICAL', 'Power socket in bedroom not working.', 'URGENT'::urgency_level, 'NN12 2OP', 'NN12', 'EXTENDED'::service_area_class, 49, 'MEDIUM'::qualification_rating, '["Demo seed data"]'::jsonb, 'CONTACTED'::lead_status, true, NOW() - INTERVAL '51 days', NOW() - INTERVAL '58 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000110', 35, 'WEB_FORM', 'PLUMBING', 'Water pouring from pipe under sink — urgent.', 'EMERGENCY'::urgency_level, 'NN5 5PL', 'NN5', 'PRIMARY'::service_area_class, 36, 'LOW'::qualification_rating, '["Demo seed data"]'::jsonb, 'COMPLETED'::lead_status, true, NOW() - INTERVAL '52 days', NOW() - INTERVAL '12 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000111', 36, 'WEB_FORM', 'PLUMBING', 'Install new light fittings in lounge.', 'NORMAL'::urgency_level, 'PE25 8XX', 'PE25', 'OUTSIDE'::service_area_class, 4, 'LOW'::qualification_rating, '["Demo seed data"]'::jsonb, 'OUTSIDE_SERVICE_AREA'::lead_status, true, NOW() - INTERVAL '51 days', NOW() - INTERVAL '51 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000112', 37, 'WEB_FORM', 'ELECTRICAL', 'Water pouring from pipe under sink — urgent.', 'NORMAL'::urgency_level, 'NN12 2OP', 'NN12', 'EXTENDED'::service_area_class, 0, 'LOW'::qualification_rating, '["Demo seed data"]'::jsonb, 'OUTSIDE_SERVICE_AREA'::lead_status, true, NOW() - INTERVAL '4 days', NOW() - INTERVAL '9 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000113', 38, 'WEB_FORM', 'PROPERTY_MAINTENANCE', 'Replace broken garden fence panel.', 'URGENT'::urgency_level, 'NN10 6YU', 'NN10', 'EXTENDED'::service_area_class, 28, 'LOW'::qualification_rating, '["Demo seed data"]'::jsonb, 'BOOKED'::lead_status, true, NOW() - INTERVAL '50 days', NOW() - INTERVAL '24 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000114', 39, 'WEB_FORM', 'PLUMBING', 'Kitchen tap dripping constantly, needs repair.', 'EMERGENCY'::urgency_level, 'NN8 4RT', 'NN8', 'EXTENDED'::service_area_class, 48, 'MEDIUM'::qualification_rating, '["Demo seed data"]'::jsonb, 'CANCELLED'::lead_status, true, NOW() - INTERVAL '47 days', NOW() - INTERVAL '51 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000115', 40, 'WEB_FORM', 'HEATING', 'Radiator not heating in upstairs bedroom.', 'URGENT'::urgency_level, 'NN8 4RT', 'NN8', 'EXTENDED'::service_area_class, 27, 'LOW'::qualification_rating, '["Demo seed data"]'::jsonb, 'QUALIFIED'::lead_status, true, NOW() - INTERVAL '28 days', NOW() - INTERVAL '44 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000116', 41, 'WEB_FORM', 'PLUMBING', 'Install new light fittings in lounge.', 'NORMAL'::urgency_level, 'NN8 4RT', 'NN8', 'EXTENDED'::service_area_class, 29, 'LOW'::qualification_rating, '["Demo seed data"]'::jsonb, 'MANUAL_REVIEW'::lead_status, true, NOW() - INTERVAL '39 days', NOW() - INTERVAL '10 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000117', 42, 'WEB_FORM', 'PLUMBING', 'Install new light fittings in lounge.', 'EMERGENCY'::urgency_level, 'NN3 3HQ', 'NN3', 'PRIMARY'::service_area_class, 94, 'VERY_HIGH'::qualification_rating, '["Demo seed data"]'::jsonb, 'DORMANT'::lead_status, true, NOW() - INTERVAL '25 days', NOW() - INTERVAL '39 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000118', 43, 'WEB_FORM', 'HEATING', 'Boiler making unusual noise and losing pressure.', 'NORMAL'::urgency_level, 'NN8 4RT', 'NN8', 'EXTENDED'::service_area_class, 75, 'HIGH'::qualification_rating, '["Demo seed data"]'::jsonb, 'CANCELLED'::lead_status, true, NOW() - INTERVAL '55 days', NOW() - INTERVAL '42 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000119', 44, 'WEB_FORM', 'ELECTRICAL', 'Install new light fittings in lounge.', 'URGENT'::urgency_level, 'NN7 1QW', 'NN7', 'EXTENDED'::service_area_class, 49, 'MEDIUM'::qualification_rating, '["Demo seed data"]'::jsonb, 'MANUAL_REVIEW'::lead_status, true, NOW() - INTERVAL '53 days', NOW() - INTERVAL '30 days');
INSERT INTO leads (lead_reference, customer_id, source, service_category, description, urgency, postcode, postcode_district, service_area, qualification_score, qualification_rating, qualification_reasons, status, consent_to_contact, lead_received_at, created_at)
VALUES ('LEAD-2026-000120', 45, 'WEB_FORM', 'PROPERTY_MAINTENANCE', 'Install new light fittings in lounge.', 'URGENT'::urgency_level, 'NN7 1QW', 'NN7', 'EXTENDED'::service_area_class, 60, 'MEDIUM'::qualification_rating, '["Demo seed data"]'::jsonb, 'BOOKED'::lead_status, true, NOW() - INTERVAL '43 days', NOW() - INTERVAL '17 days');

-- Bookings (~45)
INSERT INTO bookings (booking_reference, lead_id, customer_id, start_at, end_at, service_type, technician_id, technician, status, confirmation_sent_at)
SELECT 'BOOK-2026-000001', 48, 48,
  (DATE_TRUNC('day', NOW()) + INTERVAL '-10 days' + INTERVAL '16 hours'),
  (DATE_TRUNC('day', NOW()) + INTERVAL '-10 days' + INTERVAL '17 hours'),
  'PLUMBING', 1, (SELECT full_name FROM technicians WHERE id = 1), 'CANCELLED'::booking_status,
  CASE WHEN 'CANCELLED' != 'CANCELLED' THEN NOW() - INTERVAL '2 days' ELSE NULL END;
INSERT INTO bookings (booking_reference, lead_id, customer_id, start_at, end_at, service_type, technician_id, technician, status, confirmation_sent_at)
SELECT 'BOOK-2026-000002', 12, 12,
  (DATE_TRUNC('day', NOW()) + INTERVAL '12 days' + INTERVAL '9 hours'),
  (DATE_TRUNC('day', NOW()) + INTERVAL '12 days' + INTERVAL '10 hours'),
  'PLUMBING', 4, (SELECT full_name FROM technicians WHERE id = 4), 'BOOKED'::booking_status,
  CASE WHEN 'BOOKED' != 'CANCELLED' THEN NOW() - INTERVAL '2 days' ELSE NULL END;
INSERT INTO bookings (booking_reference, lead_id, customer_id, start_at, end_at, service_type, technician_id, technician, status, confirmation_sent_at)
SELECT 'BOOK-2026-000003', 13, 13,
  (DATE_TRUNC('day', NOW()) + INTERVAL '9 days' + INTERVAL '16 hours'),
  (DATE_TRUNC('day', NOW()) + INTERVAL '9 days' + INTERVAL '17 hours'),
  'PLUMBING', 2, (SELECT full_name FROM technicians WHERE id = 2), 'COMPLETED'::booking_status,
  CASE WHEN 'COMPLETED' != 'CANCELLED' THEN NOW() - INTERVAL '2 days' ELSE NULL END;
INSERT INTO bookings (booking_reference, lead_id, customer_id, start_at, end_at, service_type, technician_id, technician, status, confirmation_sent_at)
SELECT 'BOOK-2026-000004', 72, 72,
  (DATE_TRUNC('day', NOW()) + INTERVAL '-13 days' + INTERVAL '15 hours'),
  (DATE_TRUNC('day', NOW()) + INTERVAL '-13 days' + INTERVAL '16 hours'),
  'PLUMBING', 1, (SELECT full_name FROM technicians WHERE id = 1), 'COMPLETED'::booking_status,
  CASE WHEN 'COMPLETED' != 'CANCELLED' THEN NOW() - INTERVAL '2 days' ELSE NULL END;
INSERT INTO bookings (booking_reference, lead_id, customer_id, start_at, end_at, service_type, technician_id, technician, status, confirmation_sent_at)
SELECT 'BOOK-2026-000005', 53, 53,
  (DATE_TRUNC('day', NOW()) + INTERVAL '-3 days' + INTERVAL '16 hours'),
  (DATE_TRUNC('day', NOW()) + INTERVAL '-3 days' + INTERVAL '17 hours'),
  'PLUMBING', 1, (SELECT full_name FROM technicians WHERE id = 1), 'CANCELLED'::booking_status,
  CASE WHEN 'CANCELLED' != 'CANCELLED' THEN NOW() - INTERVAL '2 days' ELSE NULL END;
INSERT INTO bookings (booking_reference, lead_id, customer_id, start_at, end_at, service_type, technician_id, technician, status, confirmation_sent_at)
SELECT 'BOOK-2026-000006', 37, 37,
  (DATE_TRUNC('day', NOW()) + INTERVAL '5 days' + INTERVAL '11 hours'),
  (DATE_TRUNC('day', NOW()) + INTERVAL '5 days' + INTERVAL '12 hours'),
  'PLUMBING', 1, (SELECT full_name FROM technicians WHERE id = 1), 'COMPLETED'::booking_status,
  CASE WHEN 'COMPLETED' != 'CANCELLED' THEN NOW() - INTERVAL '2 days' ELSE NULL END;
INSERT INTO bookings (booking_reference, lead_id, customer_id, start_at, end_at, service_type, technician_id, technician, status, confirmation_sent_at)
SELECT 'BOOK-2026-000007', 74, 74,
  (DATE_TRUNC('day', NOW()) + INTERVAL '2 days' + INTERVAL '10 hours'),
  (DATE_TRUNC('day', NOW()) + INTERVAL '2 days' + INTERVAL '11 hours'),
  'PLUMBING', 4, (SELECT full_name FROM technicians WHERE id = 4), 'CONFIRMED'::booking_status,
  CASE WHEN 'CONFIRMED' != 'CANCELLED' THEN NOW() - INTERVAL '2 days' ELSE NULL END;
INSERT INTO bookings (booking_reference, lead_id, customer_id, start_at, end_at, service_type, technician_id, technician, status, confirmation_sent_at)
SELECT 'BOOK-2026-000008', 29, 29,
  (DATE_TRUNC('day', NOW()) + INTERVAL '13 days' + INTERVAL '9 hours'),
  (DATE_TRUNC('day', NOW()) + INTERVAL '13 days' + INTERVAL '10 hours'),
  'PLUMBING', 3, (SELECT full_name FROM technicians WHERE id = 3), 'COMPLETED'::booking_status,
  CASE WHEN 'COMPLETED' != 'CANCELLED' THEN NOW() - INTERVAL '2 days' ELSE NULL END;
INSERT INTO bookings (booking_reference, lead_id, customer_id, start_at, end_at, service_type, technician_id, technician, status, confirmation_sent_at)
SELECT 'BOOK-2026-000009', 15, 15,
  (DATE_TRUNC('day', NOW()) + INTERVAL '10 days' + INTERVAL '11 hours'),
  (DATE_TRUNC('day', NOW()) + INTERVAL '10 days' + INTERVAL '12 hours'),
  'PLUMBING', 4, (SELECT full_name FROM technicians WHERE id = 4), 'CONFIRMED'::booking_status,
  CASE WHEN 'CONFIRMED' != 'CANCELLED' THEN NOW() - INTERVAL '2 days' ELSE NULL END;
INSERT INTO bookings (booking_reference, lead_id, customer_id, start_at, end_at, service_type, technician_id, technician, status, confirmation_sent_at)
SELECT 'BOOK-2026-000010', 72, 72,
  (DATE_TRUNC('day', NOW()) + INTERVAL '10 days' + INTERVAL '15 hours'),
  (DATE_TRUNC('day', NOW()) + INTERVAL '10 days' + INTERVAL '16 hours'),
  'PLUMBING', 3, (SELECT full_name FROM technicians WHERE id = 3), 'BOOKED'::booking_status,
  CASE WHEN 'BOOKED' != 'CANCELLED' THEN NOW() - INTERVAL '2 days' ELSE NULL END;
INSERT INTO bookings (booking_reference, lead_id, customer_id, start_at, end_at, service_type, technician_id, technician, status, confirmation_sent_at)
SELECT 'BOOK-2026-000011', 4, 4,
  (DATE_TRUNC('day', NOW()) + INTERVAL '-9 days' + INTERVAL '11 hours'),
  (DATE_TRUNC('day', NOW()) + INTERVAL '-9 days' + INTERVAL '12 hours'),
  'PLUMBING', 3, (SELECT full_name FROM technicians WHERE id = 3), 'COMPLETED'::booking_status,
  CASE WHEN 'COMPLETED' != 'CANCELLED' THEN NOW() - INTERVAL '2 days' ELSE NULL END;
INSERT INTO bookings (booking_reference, lead_id, customer_id, start_at, end_at, service_type, technician_id, technician, status, confirmation_sent_at)
SELECT 'BOOK-2026-000012', 45, 45,
  (DATE_TRUNC('day', NOW()) + INTERVAL '-14 days' + INTERVAL '10 hours'),
  (DATE_TRUNC('day', NOW()) + INTERVAL '-14 days' + INTERVAL '11 hours'),
  'PLUMBING', 4, (SELECT full_name FROM technicians WHERE id = 4), 'CONFIRMED'::booking_status,
  CASE WHEN 'CONFIRMED' != 'CANCELLED' THEN NOW() - INTERVAL '2 days' ELSE NULL END;
INSERT INTO bookings (booking_reference, lead_id, customer_id, start_at, end_at, service_type, technician_id, technician, status, confirmation_sent_at)
SELECT 'BOOK-2026-000013', 9, 9,
  (DATE_TRUNC('day', NOW()) + INTERVAL '-10 days' + INTERVAL '16 hours'),
  (DATE_TRUNC('day', NOW()) + INTERVAL '-10 days' + INTERVAL '17 hours'),
  'PLUMBING', 1, (SELECT full_name FROM technicians WHERE id = 1), 'BOOKED'::booking_status,
  CASE WHEN 'BOOKED' != 'CANCELLED' THEN NOW() - INTERVAL '2 days' ELSE NULL END;
INSERT INTO bookings (booking_reference, lead_id, customer_id, start_at, end_at, service_type, technician_id, technician, status, confirmation_sent_at)
SELECT 'BOOK-2026-000014', 68, 68,
  (DATE_TRUNC('day', NOW()) + INTERVAL '-8 days' + INTERVAL '14 hours'),
  (DATE_TRUNC('day', NOW()) + INTERVAL '-8 days' + INTERVAL '15 hours'),
  'PLUMBING', 4, (SELECT full_name FROM technicians WHERE id = 4), 'CANCELLED'::booking_status,
  CASE WHEN 'CANCELLED' != 'CANCELLED' THEN NOW() - INTERVAL '2 days' ELSE NULL END;
INSERT INTO bookings (booking_reference, lead_id, customer_id, start_at, end_at, service_type, technician_id, technician, status, confirmation_sent_at)
SELECT 'BOOK-2026-000015', 44, 44,
  (DATE_TRUNC('day', NOW()) + INTERVAL '-9 days' + INTERVAL '11 hours'),
  (DATE_TRUNC('day', NOW()) + INTERVAL '-9 days' + INTERVAL '12 hours'),
  'PLUMBING', 3, (SELECT full_name FROM technicians WHERE id = 3), 'COMPLETED'::booking_status,
  CASE WHEN 'COMPLETED' != 'CANCELLED' THEN NOW() - INTERVAL '2 days' ELSE NULL END;
INSERT INTO bookings (booking_reference, lead_id, customer_id, start_at, end_at, service_type, technician_id, technician, status, confirmation_sent_at)
SELECT 'BOOK-2026-000016', 73, 73,
  (DATE_TRUNC('day', NOW()) + INTERVAL '5 days' + INTERVAL '9 hours'),
  (DATE_TRUNC('day', NOW()) + INTERVAL '5 days' + INTERVAL '10 hours'),
  'PLUMBING', 2, (SELECT full_name FROM technicians WHERE id = 2), 'BOOKED'::booking_status,
  CASE WHEN 'BOOKED' != 'CANCELLED' THEN NOW() - INTERVAL '2 days' ELSE NULL END;
INSERT INTO bookings (booking_reference, lead_id, customer_id, start_at, end_at, service_type, technician_id, technician, status, confirmation_sent_at)
SELECT 'BOOK-2026-000017', 21, 21,
  (DATE_TRUNC('day', NOW()) + INTERVAL '10 days' + INTERVAL '15 hours'),
  (DATE_TRUNC('day', NOW()) + INTERVAL '10 days' + INTERVAL '16 hours'),
  'PLUMBING', 1, (SELECT full_name FROM technicians WHERE id = 1), 'BOOKED'::booking_status,
  CASE WHEN 'BOOKED' != 'CANCELLED' THEN NOW() - INTERVAL '2 days' ELSE NULL END;
INSERT INTO bookings (booking_reference, lead_id, customer_id, start_at, end_at, service_type, technician_id, technician, status, confirmation_sent_at)
SELECT 'BOOK-2026-000018', 35, 35,
  (DATE_TRUNC('day', NOW()) + INTERVAL '0 days' + INTERVAL '16 hours'),
  (DATE_TRUNC('day', NOW()) + INTERVAL '0 days' + INTERVAL '17 hours'),
  'PLUMBING', 4, (SELECT full_name FROM technicians WHERE id = 4), 'CANCELLED'::booking_status,
  CASE WHEN 'CANCELLED' != 'CANCELLED' THEN NOW() - INTERVAL '2 days' ELSE NULL END;
INSERT INTO bookings (booking_reference, lead_id, customer_id, start_at, end_at, service_type, technician_id, technician, status, confirmation_sent_at)
SELECT 'BOOK-2026-000019', 78, 3,
  (DATE_TRUNC('day', NOW()) + INTERVAL '0 days' + INTERVAL '14 hours'),
  (DATE_TRUNC('day', NOW()) + INTERVAL '0 days' + INTERVAL '15 hours'),
  'PLUMBING', 2, (SELECT full_name FROM technicians WHERE id = 2), 'COMPLETED'::booking_status,
  CASE WHEN 'COMPLETED' != 'CANCELLED' THEN NOW() - INTERVAL '2 days' ELSE NULL END;
INSERT INTO bookings (booking_reference, lead_id, customer_id, start_at, end_at, service_type, technician_id, technician, status, confirmation_sent_at)
SELECT 'BOOK-2026-000020', 66, 66,
  (DATE_TRUNC('day', NOW()) + INTERVAL '-11 days' + INTERVAL '11 hours'),
  (DATE_TRUNC('day', NOW()) + INTERVAL '-11 days' + INTERVAL '12 hours'),
  'PLUMBING', 1, (SELECT full_name FROM technicians WHERE id = 1), 'CANCELLED'::booking_status,
  CASE WHEN 'CANCELLED' != 'CANCELLED' THEN NOW() - INTERVAL '2 days' ELSE NULL END;
INSERT INTO bookings (booking_reference, lead_id, customer_id, start_at, end_at, service_type, technician_id, technician, status, confirmation_sent_at)
SELECT 'BOOK-2026-000021', 37, 37,
  (DATE_TRUNC('day', NOW()) + INTERVAL '7 days' + INTERVAL '16 hours'),
  (DATE_TRUNC('day', NOW()) + INTERVAL '7 days' + INTERVAL '17 hours'),
  'PLUMBING', 3, (SELECT full_name FROM technicians WHERE id = 3), 'CANCELLED'::booking_status,
  CASE WHEN 'CANCELLED' != 'CANCELLED' THEN NOW() - INTERVAL '2 days' ELSE NULL END;
INSERT INTO bookings (booking_reference, lead_id, customer_id, start_at, end_at, service_type, technician_id, technician, status, confirmation_sent_at)
SELECT 'BOOK-2026-000022', 6, 6,
  (DATE_TRUNC('day', NOW()) + INTERVAL '-7 days' + INTERVAL '14 hours'),
  (DATE_TRUNC('day', NOW()) + INTERVAL '-7 days' + INTERVAL '15 hours'),
  'PLUMBING', 1, (SELECT full_name FROM technicians WHERE id = 1), 'BOOKED'::booking_status,
  CASE WHEN 'BOOKED' != 'CANCELLED' THEN NOW() - INTERVAL '2 days' ELSE NULL END;
INSERT INTO bookings (booking_reference, lead_id, customer_id, start_at, end_at, service_type, technician_id, technician, status, confirmation_sent_at)
SELECT 'BOOK-2026-000023', 27, 27,
  (DATE_TRUNC('day', NOW()) + INTERVAL '-5 days' + INTERVAL '10 hours'),
  (DATE_TRUNC('day', NOW()) + INTERVAL '-5 days' + INTERVAL '11 hours'),
  'PLUMBING', 3, (SELECT full_name FROM technicians WHERE id = 3), 'CONFIRMED'::booking_status,
  CASE WHEN 'CONFIRMED' != 'CANCELLED' THEN NOW() - INTERVAL '2 days' ELSE NULL END;
INSERT INTO bookings (booking_reference, lead_id, customer_id, start_at, end_at, service_type, technician_id, technician, status, confirmation_sent_at)
SELECT 'BOOK-2026-000024', 38, 38,
  (DATE_TRUNC('day', NOW()) + INTERVAL '-4 days' + INTERVAL '9 hours'),
  (DATE_TRUNC('day', NOW()) + INTERVAL '-4 days' + INTERVAL '10 hours'),
  'PLUMBING', 4, (SELECT full_name FROM technicians WHERE id = 4), 'BOOKED'::booking_status,
  CASE WHEN 'BOOKED' != 'CANCELLED' THEN NOW() - INTERVAL '2 days' ELSE NULL END;
INSERT INTO bookings (booking_reference, lead_id, customer_id, start_at, end_at, service_type, technician_id, technician, status, confirmation_sent_at)
SELECT 'BOOK-2026-000025', 56, 56,
  (DATE_TRUNC('day', NOW()) + INTERVAL '-9 days' + INTERVAL '10 hours'),
  (DATE_TRUNC('day', NOW()) + INTERVAL '-9 days' + INTERVAL '11 hours'),
  'PLUMBING', 2, (SELECT full_name FROM technicians WHERE id = 2), 'CANCELLED'::booking_status,
  CASE WHEN 'CANCELLED' != 'CANCELLED' THEN NOW() - INTERVAL '2 days' ELSE NULL END;
INSERT INTO bookings (booking_reference, lead_id, customer_id, start_at, end_at, service_type, technician_id, technician, status, confirmation_sent_at)
SELECT 'BOOK-2026-000026', 65, 65,
  (DATE_TRUNC('day', NOW()) + INTERVAL '3 days' + INTERVAL '16 hours'),
  (DATE_TRUNC('day', NOW()) + INTERVAL '3 days' + INTERVAL '17 hours'),
  'PLUMBING', 1, (SELECT full_name FROM technicians WHERE id = 1), 'COMPLETED'::booking_status,
  CASE WHEN 'COMPLETED' != 'CANCELLED' THEN NOW() - INTERVAL '2 days' ELSE NULL END;
INSERT INTO bookings (booking_reference, lead_id, customer_id, start_at, end_at, service_type, technician_id, technician, status, confirmation_sent_at)
SELECT 'BOOK-2026-000027', 51, 51,
  (DATE_TRUNC('day', NOW()) + INTERVAL '13 days' + INTERVAL '16 hours'),
  (DATE_TRUNC('day', NOW()) + INTERVAL '13 days' + INTERVAL '17 hours'),
  'PLUMBING', 4, (SELECT full_name FROM technicians WHERE id = 4), 'BOOKED'::booking_status,
  CASE WHEN 'BOOKED' != 'CANCELLED' THEN NOW() - INTERVAL '2 days' ELSE NULL END;
INSERT INTO bookings (booking_reference, lead_id, customer_id, start_at, end_at, service_type, technician_id, technician, status, confirmation_sent_at)
SELECT 'BOOK-2026-000028', 3, 3,
  (DATE_TRUNC('day', NOW()) + INTERVAL '0 days' + INTERVAL '9 hours'),
  (DATE_TRUNC('day', NOW()) + INTERVAL '0 days' + INTERVAL '10 hours'),
  'PLUMBING', 4, (SELECT full_name FROM technicians WHERE id = 4), 'COMPLETED'::booking_status,
  CASE WHEN 'COMPLETED' != 'CANCELLED' THEN NOW() - INTERVAL '2 days' ELSE NULL END;
INSERT INTO bookings (booking_reference, lead_id, customer_id, start_at, end_at, service_type, technician_id, technician, status, confirmation_sent_at)
SELECT 'BOOK-2026-000029', 74, 74,
  (DATE_TRUNC('day', NOW()) + INTERVAL '-2 days' + INTERVAL '16 hours'),
  (DATE_TRUNC('day', NOW()) + INTERVAL '-2 days' + INTERVAL '17 hours'),
  'PLUMBING', 3, (SELECT full_name FROM technicians WHERE id = 3), 'CANCELLED'::booking_status,
  CASE WHEN 'CANCELLED' != 'CANCELLED' THEN NOW() - INTERVAL '2 days' ELSE NULL END;
INSERT INTO bookings (booking_reference, lead_id, customer_id, start_at, end_at, service_type, technician_id, technician, status, confirmation_sent_at)
SELECT 'BOOK-2026-000030', 15, 15,
  (DATE_TRUNC('day', NOW()) + INTERVAL '-2 days' + INTERVAL '9 hours'),
  (DATE_TRUNC('day', NOW()) + INTERVAL '-2 days' + INTERVAL '10 hours'),
  'PLUMBING', 2, (SELECT full_name FROM technicians WHERE id = 2), 'COMPLETED'::booking_status,
  CASE WHEN 'COMPLETED' != 'CANCELLED' THEN NOW() - INTERVAL '2 days' ELSE NULL END;
INSERT INTO bookings (booking_reference, lead_id, customer_id, start_at, end_at, service_type, technician_id, technician, status, confirmation_sent_at)
SELECT 'BOOK-2026-000031', 80, 5,
  (DATE_TRUNC('day', NOW()) + INTERVAL '0 days' + INTERVAL '16 hours'),
  (DATE_TRUNC('day', NOW()) + INTERVAL '0 days' + INTERVAL '17 hours'),
  'PLUMBING', 1, (SELECT full_name FROM technicians WHERE id = 1), 'COMPLETED'::booking_status,
  CASE WHEN 'COMPLETED' != 'CANCELLED' THEN NOW() - INTERVAL '2 days' ELSE NULL END;
INSERT INTO bookings (booking_reference, lead_id, customer_id, start_at, end_at, service_type, technician_id, technician, status, confirmation_sent_at)
SELECT 'BOOK-2026-000032', 56, 56,
  (DATE_TRUNC('day', NOW()) + INTERVAL '13 days' + INTERVAL '9 hours'),
  (DATE_TRUNC('day', NOW()) + INTERVAL '13 days' + INTERVAL '10 hours'),
  'PLUMBING', 4, (SELECT full_name FROM technicians WHERE id = 4), 'CONFIRMED'::booking_status,
  CASE WHEN 'CONFIRMED' != 'CANCELLED' THEN NOW() - INTERVAL '2 days' ELSE NULL END;
INSERT INTO bookings (booking_reference, lead_id, customer_id, start_at, end_at, service_type, technician_id, technician, status, confirmation_sent_at)
SELECT 'BOOK-2026-000033', 76, 1,
  (DATE_TRUNC('day', NOW()) + INTERVAL '-2 days' + INTERVAL '15 hours'),
  (DATE_TRUNC('day', NOW()) + INTERVAL '-2 days' + INTERVAL '16 hours'),
  'PLUMBING', 4, (SELECT full_name FROM technicians WHERE id = 4), 'BOOKED'::booking_status,
  CASE WHEN 'BOOKED' != 'CANCELLED' THEN NOW() - INTERVAL '2 days' ELSE NULL END;
INSERT INTO bookings (booking_reference, lead_id, customer_id, start_at, end_at, service_type, technician_id, technician, status, confirmation_sent_at)
SELECT 'BOOK-2026-000034', 40, 40,
  (DATE_TRUNC('day', NOW()) + INTERVAL '9 days' + INTERVAL '11 hours'),
  (DATE_TRUNC('day', NOW()) + INTERVAL '9 days' + INTERVAL '12 hours'),
  'PLUMBING', 3, (SELECT full_name FROM technicians WHERE id = 3), 'CONFIRMED'::booking_status,
  CASE WHEN 'CONFIRMED' != 'CANCELLED' THEN NOW() - INTERVAL '2 days' ELSE NULL END;
INSERT INTO bookings (booking_reference, lead_id, customer_id, start_at, end_at, service_type, technician_id, technician, status, confirmation_sent_at)
SELECT 'BOOK-2026-000035', 22, 22,
  (DATE_TRUNC('day', NOW()) + INTERVAL '-12 days' + INTERVAL '15 hours'),
  (DATE_TRUNC('day', NOW()) + INTERVAL '-12 days' + INTERVAL '16 hours'),
  'PLUMBING', 2, (SELECT full_name FROM technicians WHERE id = 2), 'BOOKED'::booking_status,
  CASE WHEN 'BOOKED' != 'CANCELLED' THEN NOW() - INTERVAL '2 days' ELSE NULL END;
INSERT INTO bookings (booking_reference, lead_id, customer_id, start_at, end_at, service_type, technician_id, technician, status, confirmation_sent_at)
SELECT 'BOOK-2026-000036', 45, 45,
  (DATE_TRUNC('day', NOW()) + INTERVAL '-3 days' + INTERVAL '16 hours'),
  (DATE_TRUNC('day', NOW()) + INTERVAL '-3 days' + INTERVAL '17 hours'),
  'PLUMBING', 2, (SELECT full_name FROM technicians WHERE id = 2), 'CONFIRMED'::booking_status,
  CASE WHEN 'CONFIRMED' != 'CANCELLED' THEN NOW() - INTERVAL '2 days' ELSE NULL END;
INSERT INTO bookings (booking_reference, lead_id, customer_id, start_at, end_at, service_type, technician_id, technician, status, confirmation_sent_at)
SELECT 'BOOK-2026-000037', 14, 14,
  (DATE_TRUNC('day', NOW()) + INTERVAL '-10 days' + INTERVAL '11 hours'),
  (DATE_TRUNC('day', NOW()) + INTERVAL '-10 days' + INTERVAL '12 hours'),
  'PLUMBING', 2, (SELECT full_name FROM technicians WHERE id = 2), 'CONFIRMED'::booking_status,
  CASE WHEN 'CONFIRMED' != 'CANCELLED' THEN NOW() - INTERVAL '2 days' ELSE NULL END;
INSERT INTO bookings (booking_reference, lead_id, customer_id, start_at, end_at, service_type, technician_id, technician, status, confirmation_sent_at)
SELECT 'BOOK-2026-000038', 78, 3,
  (DATE_TRUNC('day', NOW()) + INTERVAL '-10 days' + INTERVAL '16 hours'),
  (DATE_TRUNC('day', NOW()) + INTERVAL '-10 days' + INTERVAL '17 hours'),
  'PLUMBING', 2, (SELECT full_name FROM technicians WHERE id = 2), 'BOOKED'::booking_status,
  CASE WHEN 'BOOKED' != 'CANCELLED' THEN NOW() - INTERVAL '2 days' ELSE NULL END;
INSERT INTO bookings (booking_reference, lead_id, customer_id, start_at, end_at, service_type, technician_id, technician, status, confirmation_sent_at)
SELECT 'BOOK-2026-000039', 64, 64,
  (DATE_TRUNC('day', NOW()) + INTERVAL '0 days' + INTERVAL '15 hours'),
  (DATE_TRUNC('day', NOW()) + INTERVAL '0 days' + INTERVAL '16 hours'),
  'PLUMBING', 3, (SELECT full_name FROM technicians WHERE id = 3), 'CANCELLED'::booking_status,
  CASE WHEN 'CANCELLED' != 'CANCELLED' THEN NOW() - INTERVAL '2 days' ELSE NULL END;
INSERT INTO bookings (booking_reference, lead_id, customer_id, start_at, end_at, service_type, technician_id, technician, status, confirmation_sent_at)
SELECT 'BOOK-2026-000040', 41, 41,
  (DATE_TRUNC('day', NOW()) + INTERVAL '-10 days' + INTERVAL '14 hours'),
  (DATE_TRUNC('day', NOW()) + INTERVAL '-10 days' + INTERVAL '15 hours'),
  'PLUMBING', 4, (SELECT full_name FROM technicians WHERE id = 4), 'BOOKED'::booking_status,
  CASE WHEN 'BOOKED' != 'CANCELLED' THEN NOW() - INTERVAL '2 days' ELSE NULL END;
INSERT INTO bookings (booking_reference, lead_id, customer_id, start_at, end_at, service_type, technician_id, technician, status, confirmation_sent_at)
SELECT 'BOOK-2026-000041', 57, 57,
  (DATE_TRUNC('day', NOW()) + INTERVAL '6 days' + INTERVAL '11 hours'),
  (DATE_TRUNC('day', NOW()) + INTERVAL '6 days' + INTERVAL '12 hours'),
  'PLUMBING', 1, (SELECT full_name FROM technicians WHERE id = 1), 'COMPLETED'::booking_status,
  CASE WHEN 'COMPLETED' != 'CANCELLED' THEN NOW() - INTERVAL '2 days' ELSE NULL END;
INSERT INTO bookings (booking_reference, lead_id, customer_id, start_at, end_at, service_type, technician_id, technician, status, confirmation_sent_at)
SELECT 'BOOK-2026-000042', 46, 46,
  (DATE_TRUNC('day', NOW()) + INTERVAL '2 days' + INTERVAL '9 hours'),
  (DATE_TRUNC('day', NOW()) + INTERVAL '2 days' + INTERVAL '10 hours'),
  'PLUMBING', 4, (SELECT full_name FROM technicians WHERE id = 4), 'COMPLETED'::booking_status,
  CASE WHEN 'COMPLETED' != 'CANCELLED' THEN NOW() - INTERVAL '2 days' ELSE NULL END;
INSERT INTO bookings (booking_reference, lead_id, customer_id, start_at, end_at, service_type, technician_id, technician, status, confirmation_sent_at)
SELECT 'BOOK-2026-000043', 58, 58,
  (DATE_TRUNC('day', NOW()) + INTERVAL '-13 days' + INTERVAL '9 hours'),
  (DATE_TRUNC('day', NOW()) + INTERVAL '-13 days' + INTERVAL '10 hours'),
  'PLUMBING', 3, (SELECT full_name FROM technicians WHERE id = 3), 'COMPLETED'::booking_status,
  CASE WHEN 'COMPLETED' != 'CANCELLED' THEN NOW() - INTERVAL '2 days' ELSE NULL END;
INSERT INTO bookings (booking_reference, lead_id, customer_id, start_at, end_at, service_type, technician_id, technician, status, confirmation_sent_at)
SELECT 'BOOK-2026-000044', 10, 10,
  (DATE_TRUNC('day', NOW()) + INTERVAL '6 days' + INTERVAL '9 hours'),
  (DATE_TRUNC('day', NOW()) + INTERVAL '6 days' + INTERVAL '10 hours'),
  'PLUMBING', 4, (SELECT full_name FROM technicians WHERE id = 4), 'CANCELLED'::booking_status,
  CASE WHEN 'CANCELLED' != 'CANCELLED' THEN NOW() - INTERVAL '2 days' ELSE NULL END;
INSERT INTO bookings (booking_reference, lead_id, customer_id, start_at, end_at, service_type, technician_id, technician, status, confirmation_sent_at)
SELECT 'BOOK-2026-000045', 75, 75,
  (DATE_TRUNC('day', NOW()) + INTERVAL '3 days' + INTERVAL '16 hours'),
  (DATE_TRUNC('day', NOW()) + INTERVAL '3 days' + INTERVAL '17 hours'),
  'PLUMBING', 4, (SELECT full_name FROM technicians WHERE id = 4), 'BOOKED'::booking_status,
  CASE WHEN 'BOOKED' != 'CANCELLED' THEN NOW() - INTERVAL '2 days' ELSE NULL END;

-- Jobs (~35 completed)
INSERT INTO jobs (job_reference, booking_id, lead_id, customer_id, status, started_at, completed_at, notes)
SELECT 'JOB-2026-000001', b.id, b.lead_id, b.customer_id, 'COMPLETED'::job_status,
  b.start_at, b.end_at, 'Demo completed job'
FROM bookings b WHERE b.id = 37 LIMIT 1;
INSERT INTO jobs (job_reference, booking_id, lead_id, customer_id, status, started_at, completed_at, notes)
SELECT 'JOB-2026-000002', b.id, b.lead_id, b.customer_id, 'COMPLETED'::job_status,
  b.start_at, b.end_at, 'Demo completed job'
FROM bookings b WHERE b.id = 42 LIMIT 1;
INSERT INTO jobs (job_reference, booking_id, lead_id, customer_id, status, started_at, completed_at, notes)
SELECT 'JOB-2026-000003', b.id, b.lead_id, b.customer_id, 'COMPLETED'::job_status,
  b.start_at, b.end_at, 'Demo completed job'
FROM bookings b WHERE b.id = 13 LIMIT 1;
INSERT INTO jobs (job_reference, booking_id, lead_id, customer_id, status, started_at, completed_at, notes)
SELECT 'JOB-2026-000004', b.id, b.lead_id, b.customer_id, 'COMPLETED'::job_status,
  b.start_at, b.end_at, 'Demo completed job'
FROM bookings b WHERE b.id = 21 LIMIT 1;
INSERT INTO jobs (job_reference, booking_id, lead_id, customer_id, status, started_at, completed_at, notes)
SELECT 'JOB-2026-000005', b.id, b.lead_id, b.customer_id, 'COMPLETED'::job_status,
  b.start_at, b.end_at, 'Demo completed job'
FROM bookings b WHERE b.id = 39 LIMIT 1;
INSERT INTO jobs (job_reference, booking_id, lead_id, customer_id, status, started_at, completed_at, notes)
SELECT 'JOB-2026-000006', b.id, b.lead_id, b.customer_id, 'COMPLETED'::job_status,
  b.start_at, b.end_at, 'Demo completed job'
FROM bookings b WHERE b.id = 31 LIMIT 1;
INSERT INTO jobs (job_reference, booking_id, lead_id, customer_id, status, started_at, completed_at, notes)
SELECT 'JOB-2026-000007', b.id, b.lead_id, b.customer_id, 'COMPLETED'::job_status,
  b.start_at, b.end_at, 'Demo completed job'
FROM bookings b WHERE b.id = 33 LIMIT 1;
INSERT INTO jobs (job_reference, booking_id, lead_id, customer_id, status, started_at, completed_at, notes)
SELECT 'JOB-2026-000008', b.id, b.lead_id, b.customer_id, 'COMPLETED'::job_status,
  b.start_at, b.end_at, 'Demo completed job'
FROM bookings b WHERE b.id = 10 LIMIT 1;
INSERT INTO jobs (job_reference, booking_id, lead_id, customer_id, status, started_at, completed_at, notes)
SELECT 'JOB-2026-000009', b.id, b.lead_id, b.customer_id, 'COMPLETED'::job_status,
  b.start_at, b.end_at, 'Demo completed job'
FROM bookings b WHERE b.id = 4 LIMIT 1;
INSERT INTO jobs (job_reference, booking_id, lead_id, customer_id, status, started_at, completed_at, notes)
SELECT 'JOB-2026-000010', b.id, b.lead_id, b.customer_id, 'COMPLETED'::job_status,
  b.start_at, b.end_at, 'Demo completed job'
FROM bookings b WHERE b.id = 29 LIMIT 1;
INSERT INTO jobs (job_reference, booking_id, lead_id, customer_id, status, started_at, completed_at, notes)
SELECT 'JOB-2026-000011', b.id, b.lead_id, b.customer_id, 'COMPLETED'::job_status,
  b.start_at, b.end_at, 'Demo completed job'
FROM bookings b WHERE b.id = 7 LIMIT 1;
INSERT INTO jobs (job_reference, booking_id, lead_id, customer_id, status, started_at, completed_at, notes)
SELECT 'JOB-2026-000012', b.id, b.lead_id, b.customer_id, 'COMPLETED'::job_status,
  b.start_at, b.end_at, 'Demo completed job'
FROM bookings b WHERE b.id = 22 LIMIT 1;
INSERT INTO jobs (job_reference, booking_id, lead_id, customer_id, status, started_at, completed_at, notes)
SELECT 'JOB-2026-000013', b.id, b.lead_id, b.customer_id, 'COMPLETED'::job_status,
  b.start_at, b.end_at, 'Demo completed job'
FROM bookings b WHERE b.id = 6 LIMIT 1;
INSERT INTO jobs (job_reference, booking_id, lead_id, customer_id, status, started_at, completed_at, notes)
SELECT 'JOB-2026-000014', b.id, b.lead_id, b.customer_id, 'COMPLETED'::job_status,
  b.start_at, b.end_at, 'Demo completed job'
FROM bookings b WHERE b.id = 33 LIMIT 1;
INSERT INTO jobs (job_reference, booking_id, lead_id, customer_id, status, started_at, completed_at, notes)
SELECT 'JOB-2026-000015', b.id, b.lead_id, b.customer_id, 'COMPLETED'::job_status,
  b.start_at, b.end_at, 'Demo completed job'
FROM bookings b WHERE b.id = 42 LIMIT 1;
INSERT INTO jobs (job_reference, booking_id, lead_id, customer_id, status, started_at, completed_at, notes)
SELECT 'JOB-2026-000016', b.id, b.lead_id, b.customer_id, 'COMPLETED'::job_status,
  b.start_at, b.end_at, 'Demo completed job'
FROM bookings b WHERE b.id = 12 LIMIT 1;
INSERT INTO jobs (job_reference, booking_id, lead_id, customer_id, status, started_at, completed_at, notes)
SELECT 'JOB-2026-000017', b.id, b.lead_id, b.customer_id, 'COMPLETED'::job_status,
  b.start_at, b.end_at, 'Demo completed job'
FROM bookings b WHERE b.id = 3 LIMIT 1;
INSERT INTO jobs (job_reference, booking_id, lead_id, customer_id, status, started_at, completed_at, notes)
SELECT 'JOB-2026-000018', b.id, b.lead_id, b.customer_id, 'COMPLETED'::job_status,
  b.start_at, b.end_at, 'Demo completed job'
FROM bookings b WHERE b.id = 16 LIMIT 1;
INSERT INTO jobs (job_reference, booking_id, lead_id, customer_id, status, started_at, completed_at, notes)
SELECT 'JOB-2026-000019', b.id, b.lead_id, b.customer_id, 'COMPLETED'::job_status,
  b.start_at, b.end_at, 'Demo completed job'
FROM bookings b WHERE b.id = 29 LIMIT 1;
INSERT INTO jobs (job_reference, booking_id, lead_id, customer_id, status, started_at, completed_at, notes)
SELECT 'JOB-2026-000020', b.id, b.lead_id, b.customer_id, 'COMPLETED'::job_status,
  b.start_at, b.end_at, 'Demo completed job'
FROM bookings b WHERE b.id = 29 LIMIT 1;
INSERT INTO jobs (job_reference, booking_id, lead_id, customer_id, status, started_at, completed_at, notes)
SELECT 'JOB-2026-000021', b.id, b.lead_id, b.customer_id, 'COMPLETED'::job_status,
  b.start_at, b.end_at, 'Demo completed job'
FROM bookings b WHERE b.id = 34 LIMIT 1;
INSERT INTO jobs (job_reference, booking_id, lead_id, customer_id, status, started_at, completed_at, notes)
SELECT 'JOB-2026-000022', b.id, b.lead_id, b.customer_id, 'COMPLETED'::job_status,
  b.start_at, b.end_at, 'Demo completed job'
FROM bookings b WHERE b.id = 34 LIMIT 1;
INSERT INTO jobs (job_reference, booking_id, lead_id, customer_id, status, started_at, completed_at, notes)
SELECT 'JOB-2026-000023', b.id, b.lead_id, b.customer_id, 'COMPLETED'::job_status,
  b.start_at, b.end_at, 'Demo completed job'
FROM bookings b WHERE b.id = 40 LIMIT 1;
INSERT INTO jobs (job_reference, booking_id, lead_id, customer_id, status, started_at, completed_at, notes)
SELECT 'JOB-2026-000024', b.id, b.lead_id, b.customer_id, 'COMPLETED'::job_status,
  b.start_at, b.end_at, 'Demo completed job'
FROM bookings b WHERE b.id = 11 LIMIT 1;
INSERT INTO jobs (job_reference, booking_id, lead_id, customer_id, status, started_at, completed_at, notes)
SELECT 'JOB-2026-000025', b.id, b.lead_id, b.customer_id, 'COMPLETED'::job_status,
  b.start_at, b.end_at, 'Demo completed job'
FROM bookings b WHERE b.id = 24 LIMIT 1;
INSERT INTO jobs (job_reference, booking_id, lead_id, customer_id, status, started_at, completed_at, notes)
SELECT 'JOB-2026-000026', b.id, b.lead_id, b.customer_id, 'COMPLETED'::job_status,
  b.start_at, b.end_at, 'Demo completed job'
FROM bookings b WHERE b.id = 24 LIMIT 1;
INSERT INTO jobs (job_reference, booking_id, lead_id, customer_id, status, started_at, completed_at, notes)
SELECT 'JOB-2026-000027', b.id, b.lead_id, b.customer_id, 'COMPLETED'::job_status,
  b.start_at, b.end_at, 'Demo completed job'
FROM bookings b WHERE b.id = 19 LIMIT 1;
INSERT INTO jobs (job_reference, booking_id, lead_id, customer_id, status, started_at, completed_at, notes)
SELECT 'JOB-2026-000028', b.id, b.lead_id, b.customer_id, 'COMPLETED'::job_status,
  b.start_at, b.end_at, 'Demo completed job'
FROM bookings b WHERE b.id = 25 LIMIT 1;
INSERT INTO jobs (job_reference, booking_id, lead_id, customer_id, status, started_at, completed_at, notes)
SELECT 'JOB-2026-000029', b.id, b.lead_id, b.customer_id, 'COMPLETED'::job_status,
  b.start_at, b.end_at, 'Demo completed job'
FROM bookings b WHERE b.id = 27 LIMIT 1;
INSERT INTO jobs (job_reference, booking_id, lead_id, customer_id, status, started_at, completed_at, notes)
SELECT 'JOB-2026-000030', b.id, b.lead_id, b.customer_id, 'COMPLETED'::job_status,
  b.start_at, b.end_at, 'Demo completed job'
FROM bookings b WHERE b.id = 22 LIMIT 1;
INSERT INTO jobs (job_reference, booking_id, lead_id, customer_id, status, started_at, completed_at, notes)
SELECT 'JOB-2026-000031', b.id, b.lead_id, b.customer_id, 'COMPLETED'::job_status,
  b.start_at, b.end_at, 'Demo completed job'
FROM bookings b WHERE b.id = 44 LIMIT 1;
INSERT INTO jobs (job_reference, booking_id, lead_id, customer_id, status, started_at, completed_at, notes)
SELECT 'JOB-2026-000032', b.id, b.lead_id, b.customer_id, 'COMPLETED'::job_status,
  b.start_at, b.end_at, 'Demo completed job'
FROM bookings b WHERE b.id = 39 LIMIT 1;
INSERT INTO jobs (job_reference, booking_id, lead_id, customer_id, status, started_at, completed_at, notes)
SELECT 'JOB-2026-000033', b.id, b.lead_id, b.customer_id, 'COMPLETED'::job_status,
  b.start_at, b.end_at, 'Demo completed job'
FROM bookings b WHERE b.id = 4 LIMIT 1;
INSERT INTO jobs (job_reference, booking_id, lead_id, customer_id, status, started_at, completed_at, notes)
SELECT 'JOB-2026-000034', b.id, b.lead_id, b.customer_id, 'COMPLETED'::job_status,
  b.start_at, b.end_at, 'Demo completed job'
FROM bookings b WHERE b.id = 41 LIMIT 1;
INSERT INTO jobs (job_reference, booking_id, lead_id, customer_id, status, started_at, completed_at, notes)
SELECT 'JOB-2026-000035', b.id, b.lead_id, b.customer_id, 'COMPLETED'::job_status,
  b.start_at, b.end_at, 'Demo completed job'
FROM bookings b WHERE b.id = 42 LIMIT 1;

-- Communications sample
INSERT INTO communications (customer_id, lead_id, channel, communication_type, recipient, subject, status, sent_at, idempotency_key)
SELECT customer_id, id, 'EMAIL', 'LEAD_ACKNOWLEDGEMENT', (SELECT email FROM customers c WHERE c.id = leads.customer_id), 'Enquiry received', 'SENT', created_at, 'demo-ack-' || id
FROM leads WHERE id <= 30;

-- Follow-ups sample
INSERT INTO follow_ups (lead_id, follow_up_type, scheduled_for, sent_at, status, idempotency_key)
SELECT id, 'FOLLOW_UP_1', created_at + INTERVAL '2 hours', created_at + INTERVAL '2 hours', 'SENT', 'demo-fu1-' || id
FROM leads WHERE status IN ('CONTACTED','DORMANT') LIMIT 20;

-- Reviews sample
INSERT INTO reviews (job_id, customer_id, request_sent_at, customer_satisfied, review_requested, review_status)
SELECT j.id, j.customer_id, j.completed_at + INTERVAL '1 day', true, true, 'REQUESTED'::review_status
FROM jobs j WHERE j.status = 'COMPLETED' LIMIT 25;

-- Audit events sample
INSERT INTO audit_events (entity_type, entity_id, event_type, previous_state, new_state, workflow_name, metadata)
SELECT 'lead', id, 'STATUS_CHANGE', 'NEW', status::text, 'WF-01 Lead Intake', '{"demo": true}'::jsonb FROM leads LIMIT 15;

-- Workflow runs sample
INSERT INTO workflow_runs (workflow_name, business_entity_type, business_entity_id, status, started_at, completed_at, duration_ms)
SELECT 'WF-01 Lead Intake', 'lead', id, 'SUCCESS', created_at, created_at + INTERVAL '3 seconds', 3000 FROM leads LIMIT 50;

COMMIT;