#!/usr/bin/env python3
"""Validate LocalFlow n8n workflow exports."""

import json
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
WORKFLOWS = ROOT / "workflows"

REQUIRED = {
    "01-lead-intake.json": "WF-01 Lead Intake",
    "02-lead-qualification.json": "WF-02 Lead Qualification",
    "03-service-area-check.json": "WF-03 Service Area Check",
    "04-booking-management.json": "WF-04 Booking Management",
    "05-appointment-reminders.json": "WF-05 Appointment Reminders",
    "06-lead-follow-up.json": "WF-06 Lead Follow-Up",
    "07-job-completion-review.json": "WF-07 Job Completion Review",
    "08-error-handler.json": "WF-08 Error Handler",
    "09-daily-operations-brief.json": "WF-09 Daily Operations Brief",
    "10-weekly-business-report.json": "WF-10 Weekly Business Report",
}

SECRET_PATTERNS = [
    re.compile(r"password\s*[:=]\s*['\"][^'\"]{8,}", re.I),
    re.compile(r"api[_-]?key\s*[:=]\s*['\"][a-zA-Z0-9]{16,}", re.I),
    re.compile(r"Bearer\s+[a-zA-Z0-9\-_.]{20,}"),
]


def main() -> int:
    errors = []
    checked = 0

    for filename, expected_name in REQUIRED.items():
        path = WORKFLOWS / filename
        if not path.exists():
            errors.append(f"Missing workflow: {filename}")
            continue

        raw = path.read_text(encoding="utf-8")
        checked += 1

        for pat in SECRET_PATTERNS:
            if pat.search(raw):
                errors.append(f"Possible secret in {filename}")

        try:
            data = json.loads(raw)
        except json.JSONDecodeError as e:
            errors.append(f"Invalid JSON in {filename}: {e}")
            continue

        if not data.get("name"):
            errors.append(f"{filename}: missing workflow name")
        elif expected_name not in data["name"]:
            errors.append(f"{filename}: expected name containing '{expected_name}', got '{data.get('name')}'")

        nodes = data.get("nodes", [])
        if not nodes:
            errors.append(f"{filename}: no nodes")
        else:
            for n in nodes:
                if n.get("type") == "n8n-nodes-base.stickyNote":
                    continue
                if not n.get("name"):
                    errors.append(f"{filename}: node missing name")
                if not n.get("type"):
                    errors.append(f"{filename}: node missing type")

        connections = data.get("connections", {})
        if not connections and len([n for n in nodes if n.get("type") != "n8n-nodes-base.stickyNote"]) > 1:
            errors.append(f"{filename}: no connections defined")

    print(f"Validated {checked}/{len(REQUIRED)} required workflows")
    if errors:
        print("FAIL")
        for e in errors:
            print(f"  - {e}")
        return 1

    print("PASS — all workflow checks passed")
    return 0


if __name__ == "__main__":
    sys.exit(main())
