# 🧭 Secure AI Platform — Meta Repository (`sai-platform-meta`)

[![Build Status](https://img.shields.io/github/actions/workflow/status/EODWeber/sai-platform-meta/ci.yml?branch=main\&label=CI)](https://github.com/EODWeber/sai-platform-meta/actions)
[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](./LICENSE)
[![Project Board](https://img.shields.io/badge/Project%20Board-Secure%20AI%20Platform-9cf?logo=github)](https://github.com/users/EODWeber/projects/4)
[![Security Scans](https://img.shields.io/badge/Security%20Checks-GHAS%20Enabled-success?logo=github)](https://github.com/EODWeber/sai-platform-meta/security)

## What is this?

This repository serves as the **program index, governance source, and documentation hub** for the **Secure AI Platform** — a modular, production-grade framework for building, securing, and operating AI systems end-to-end.
It contains the **architecture blueprints**, **reusable scaffolds**, **CI/CD templates**, and **security policies** shared across all platform components.

## Architecture

The Secure AI Platform is an **evolving modular system** spanning the entire AI lifecycle:

> **data → model → API → agent → CI/CD → observability → security**

Each component lives in its own repository under the `sai-` prefix.

| Domain         | Repository                                            | Purpose                                    |
| -------------- | ----------------------------------------------------- | ------------------------------------------ |
| Foundation     | [sai-infra-local](../sai-infra-local)                 | Local Docker/K8s infrastructure stack      |
| Observability  | [sai-observability-stack](../sai-observability-stack) | OpenTelemetry → Loki/Grafana stack         |
| Secrets        | [sai-secrets-vault](../sai-secrets-vault)             | HashiCorp Vault baseline for secrets       |
| ML Foundations | [sai-ml-foundations](../sai-ml-foundations)           | Reproducible ML pipelines and datasets     |
| Inference      | [sai-inference-api](../sai-inference-api)             | Secure FastAPI inference service           |
| Agent          | [sai-agent-secops](../sai-agent-secops)               | Secure LangChain automation agent          |
| Adversarial    | [sai-adversarial-lab](../sai-adversarial-lab)         | AI red teaming and adversarial ML          |
| MLOps          | [sai-mlops-pipeline](../sai-mlops-pipeline)           | Model registry, CI/CD, SBOMs, OPA policies |

📘 **Reference:**
See [`/docs/index.md`](./docs/index.md) for the full **program specification and architecture overview**.

## Quickstart

Clone this repo and bootstrap the shared developer environment.

```bash
git clone https://github.com/<your-username>/sai-platform-meta.git
cd sai-platform-meta
make setup
pre-commit run -a
```

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

## Status & Roadmap

### 🟢 Active Phase — Foundation Setup

* [x] Define project charter and program spec
* [x] Create Notion tracking system
* [x] Generate scaffolds, CI templates, and policies
* [ ] Initialize component repositories
* [ ] Validate CI and branch protections
* [ ] Publish “Day 1” foundation blog post

### 🔜 Upcoming Phases

* [ ] ML Foundations — reproducible training pipelines (`sai-ml-foundations`)
* [ ] Secure Inference API (`sai-inference-api`)
* [ ] Secure Agent (`sai-agent-secops`)
* [ ] Adversarial Lab (`sai-adversarial-lab`)
* [ ] Secure MLOps Pipeline (`sai-mlops-pipeline`)

📅 See [`/docs/index.md`](./docs/index.md) for the full roadmap and deliverables.

## License

[Apache License 2.0](./LICENSE)
© 2025 Jeff Weber. All rights reserved.
