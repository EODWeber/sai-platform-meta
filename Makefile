# Makefile (root)
PYTHON ?= python3
VENV   ?= .venv
PIP    := $(VENV)/bin/pip
PY     := $(VENV)/bin/python

.SILENT:  # keep output tidy

.PHONY: help
help:
	@echo "Targets:"
	@echo "  setup        Create venv, install deps, install pre-commit hooks"
	@echo "  venv         Create .venv if missing"
	@echo "  install      Install Python requirements"
	@echo "  hooks        Install pre-commit hooks"
	@echo "  docs         Serve docs locally with MkDocs"
	@echo "  test         Run pytest"
	@echo "  lint         Run ruff/bandit"
	@echo "  clean        Remove venv and build artifacts"

$(VENV)/bin/activate:  ## internal: venv presence
	$(PYTHON) -m venv $(VENV)
	$(PIP) install --upgrade pip

.PHONY: venv
venv: $(VENV)/bin/activate

.PHONY: install
install: venv
	$(PIP) install -r requirements.txt

.PHONY: hooks
hooks: venv
	$(VENV)/bin/pre-commit install

.PHONY: setup
setup: install hooks
	@echo "✅ Environment ready."
	@echo "To activate: source $(VENV)/bin/activate"

.PHONY: docs
docs: venv
	$(VENV)/bin/mkdocs serve

.PHONY: test
test: venv
	$(VENV)/bin/pytest -q

.PHONY: lint
lint: venv
	$(VENV)/bin/ruff check .
	$(VENV)/bin/bandit -r . || true

.PHONY: clean
clean:
	rm -rf $(VENV) site __pycache__ */__pycache__