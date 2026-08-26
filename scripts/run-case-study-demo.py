#!/usr/bin/env python3
"""Run LocalFlow case study demonstration scenarios."""

import json
import os
import sys
import urllib.error
import urllib.request
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent


def check_url(name: str, url: str) -> str:
    try:
        req = urllib.request.Request(url, method="GET")
        with urllib.request.urlopen(req, timeout=5) as resp:
            return "HEALTHY" if resp.status < 500 else "UNHEALTHY"
    except Exception:
        return "UNREACHABLE"


def pg_count(table: str) -> int | None:
    try:
        import subprocess
        result = subprocess.run(
            [
                "docker", "compose", "exec", "-T", "postgres",
                "psql", "-U", "localflow", "-d", "localflow", "-t", "-A",
                "-c", f"SELECT COUNT(*) FROM {table};",
            ],
            cwd=ROOT,
            capture_output=True,
            text=True,
            timeout=15,
        )
        if result.returncode == 0:
            return int(result.stdout.strip())
    except Exception:
        pass
    return None


def post_json(url: str, payload: dict) -> tuple[int, dict]:
    data = json.dumps(payload).encode()
    req = urllib.request.Request(url, data=data, headers={"Content-Type": "application/json"}, method="POST")
    try:
        with urllib.request.urlopen(req, timeout=15) as resp:
            body = json.loads(resp.read().decode())
            return resp.status, body
    except urllib.error.HTTPError as e:
        body = json.loads(e.read().decode()) if e.fp else {}
        return e.code, body


def main() -> int:
    n8n_base = os.environ.get("N8N_WEBHOOK_BASE", "http://localhost:5678/webhook")

    print("LOCALFLOW CASE STUDY DEMONSTRATION")
    print("=" * 36)
    print("\nEnvironment")
    print("-" * 11)
    print(f"n8n:           {check_url('n8n', 'http://localhost:5678/healthz')}")
    print(f"Mailpit:       {check_url('mailpit', 'http://localhost:8025/api/v1/info')}")

    customers = pg_count("customers")
    leads = pg_count("leads")
    if customers is not None:
        print(f"PostgreSQL:    HEALTHY (customers={customers}, leads={leads})")
    else:
        print("PostgreSQL:    UNREACHABLE (is Docker running?)")

    print("\nScenario 1 — Normal plumbing enquiry")
    print("-" * 40)
    payload = {
        "first_name": "Sarah",
        "last_name": "Williams",
        "email": "sarah.williams.demo@example.demo",
        "phone": "07700 900123",
        "postcode": "NN3 8AB",
        "service_required": "PLUMBING",
        "description": "Kitchen tap dripping constantly, would like repair this week.",
        "preferred_date": "2026-09-01",
        "preferred_time": "10:00",
        "urgency": "NORMAL",
        "consent_to_contact": True,
        "source": "DEMO_SCRIPT",
    }
    status, body = post_json(f"{n8n_base}/lead-intake", payload)
    if status == 404:
        print("Lead intake webhook: NOT CONFIGURED (import & activate WF-01 in n8n)")
    elif status in (200, 201):
        print(f"Lead created:      {body.get('lead_reference', 'see n8n execution')}")
        print(f"Qualification:     {body.get('qualification_score')} — {body.get('qualification_rating')}")
        print(f"Service area:      {body.get('service_area')}")
    else:
        print(f"Response ({status}): {body}")

    print("\nScenario 2 — Duplicate enquiry")
    print("-" * 28)
    status2, body2 = post_json(f"{n8n_base}/lead-intake", payload)
    if status2 == 404:
        print("Duplicate test:      SKIPPED (workflow not active)")
    else:
        print(f"Duplicate detected:  {body2.get('duplicate', False)}")
        print(f"New lead created:    {'NO' if body2.get('duplicate') else 'YES'}")

    print("\nScenario 3 — Outside service area")
    print("-" * 33)
    outside = {**payload, "email": "outside.demo@example.demo", "postcode": "PE25 8XX"}
    status3, body3 = post_json(f"{n8n_base}/lead-intake", outside)
    if status3 != 404:
        print(f"Service area:        {body3.get('service_area', 'see workflow')}")

    print("\nScenario 4 — Invalid form")
    print("-" * 22)
    invalid = {"first_name": "Test", "consent_to_contact": False}
    status4, body4 = post_json(f"{n8n_base}/lead-intake", invalid)
    if status4 != 404:
        print(f"Validation errors:   {body4.get('errors', body4)}")

    print("\nDatabase snapshot")
    print("-" * 18)
    for table in ["customers", "leads", "bookings", "jobs", "communications", "workflow_errors"]:
        c = pg_count(table)
        if c is not None:
            print(f"  {table}: {c}")

    print("\nDemo complete.")
    print("Note: Full E2E requires WF-01 imported, credentials configured, and workflow activated in n8n.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
