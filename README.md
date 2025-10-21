# 🧭 Secure AI Platform — Meta Repository (`sai-platform-meta`)

[![Build Status](https://img.shields.io/github/actions/workflow/status/EODWeber/sai-platform-meta/ci.yml?branch=main\&label=CI)](https://github.com/EODWeber/sai-platform-meta/actions)
[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](./LICENSE)
[![Project Board](https://img.shields.io/badge/Project%20Board-Secure%20AI%20Platform-9cf?logo=github)](https://github.com/users/EODWeber/projects/4)
[![Security Scans](https://img.shields.io/badge/Security%20Checks-GHAS%20Enabled-success?logo=github)](https://github.com/EODWeber/sai-platform-meta/security)

**[Documentation (via MkDocs)](https://eodweber.github.io/sai-platform-meta/)**

## What is this?

This repository serves as the **program index, governance source, and documentation hub** for the **Secure AI Platform** — a modular, production-grade framework for building, securing, and operating AI systems end-to-end.
It contains the **architecture blueprints**, **reusable scaffolds**, **CI/CD templates**, and **security policies** shared across all platform components.

## Architecture

The Secure AI Platform is an **evolving modular system** spanning the entire AI lifecycle:

> **data → model → API → agent → CI/CD → observability → security**

📘 **Full Platform Definition:**
See [Architecture Overview](./docs/architecture/PLATFORM_OVERVIEW.md) for detailed module and repository definitions.

## Quickstart

Clone this repo and bootstrap the shared developer environment.

```bash
git clone https://github.com/EODWeber/sai-platform-meta.git
cd sai-platform-meta

# Set up local environment (Python-only; creates .venv/)
make setup

# Optional: run hooks across the repo once
. .venv/bin/activate
pre-commit run -a

# Serve docs locally
make docs
```

> Note: Activating the venv (`source .venv/bin/activate`) is optional if you call tools via `$(VENV)/bin/...` in Make targets, but most folks like the shell activation for ad-hoc commands.


### Using the scaffolds

Copy templates and CI configs into a component repo:

```bash
cp -r .github .dev docs/templates ../sai-infra-local/
```

These scaffolds standardize linting, testing, CI gates, and policy checks across all Secure AI Platform projects.

## Security

Security is a **first-class design principle** across the platform.

* **Identity & Access:** JWT-based service auth + RBAC roles
* **Secrets Management:** Vault-issued, short-lived credentials (no `.env` secrets)
* **Code & Artifact Integrity:** SBOMs via Syft, image scanning with Trivy, signing via Cosign
* **Policy Enforcement:** OPA/Conftest gates to ensure builds fail closed
* **Static & Dependency Scanning:** CodeQL and Dependabot security updates

📄 Refer to the [Threat Model Template](./docs/templates/threat-model.md) for the per-component security review format.

## Observability

Each service emits **structured logs, traces, and metrics** using [OpenTelemetry](https://opentelemetry.io/).
The [sai-observability-stack](../sai-observability-stack) repo provides a local Grafana/Loki stack with an OTel Collector pipeline.

* **Traces:** visualize end-to-end request flow
* **Metrics:** measure latency, throughput, and errors
* **Logs:** centralized, structured logs with contextual metadata

## License

[Apache License 2.0](./LICENSE)
© 2025 Jeff Weber. All rights reserved.
