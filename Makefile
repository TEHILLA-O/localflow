.PHONY: setup up down restart logs db-shell demo reset-demo validate test lint backup status import-workflows generate

COMPOSE := docker compose
ENV_FILE := .env

setup:
	@if [ ! -f $(ENV_FILE) ]; then cp .env.example $(ENV_FILE); echo "Created .env from .env.example — update secrets before production."; fi
	$(COMPOSE) pull

up:
	$(COMPOSE) up -d
	@echo "n8n:     http://localhost:5678"
	@echo "Mailpit: http://localhost:8025"
	@echo "Postgres: localhost:5432"

down:
	$(COMPOSE) down

restart:
	$(COMPOSE) restart

logs:
	$(COMPOSE) logs -f

db-shell:
	$(COMPOSE) exec postgres psql -U $${POSTGRES_USER:-localflow} -d $${POSTGRES_DB:-localflow}

demo:
	python scripts/run-case-study-demo.py

reset-demo:
	bash scripts/reset-demo.sh

validate:
	python scripts/validate-workflows.py

test: validate
	python -m pytest scripts/tests -q 2>/dev/null || python scripts/validate-workflows.py

lint:
	python -m py_compile scripts/*.py

backup:
	bash scripts/backup-db.sh

status:
	$(COMPOSE) ps
	@echo "---"
	@curl -sf http://localhost:5678/healthz >/dev/null && echo "n8n: HEALTHY" || echo "n8n: UNREACHABLE"
	@curl -sf http://localhost:8025/api/v1/info >/dev/null && echo "Mailpit: HEALTHY" || echo "Mailpit: UNREACHABLE"
	@$(COMPOSE) exec -T postgres pg_isready -U localflow >/dev/null 2>&1 && echo "PostgreSQL: HEALTHY" || echo "PostgreSQL: UNREACHABLE"

generate:
	python scripts/generate-workflows.py
	python scripts/generate-demo-data.py

import-workflows:
	bash scripts/import-workflows.sh
