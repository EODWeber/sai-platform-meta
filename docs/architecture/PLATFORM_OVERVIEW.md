# Secure AI Platform — Architectural Overview

Architectural definition of all modules, repos, and interconnections.

## Platform Vision & Goals

The **Secure AI Platform (SAI Platform)** is a modular, producction-style ecosystem designed to demonstrate **secure-by-design AI engineering** across the full lifecycle of machine learning and large language model systems.

> **Vision:** To build a reference architecture that unifies, AI, security, and operations, showcasing how a Staff/Principal-level AI Security Engineer would design, deploy, and defend an AI-driven platform.

### Design Principles

- **Security-first:** Every component integrates identity, logging, secrets management, and compliance.
- **Reproducibility:** All pipelines, models, and deployments can be rebuilt deterministically.
- **Transparency:** Clear observability and auditability across systems.
- **Modularity:** Each function exists in its own repo, but integrates through shared infrastructure.
- **Pragmatism:** Built using open-source, self-hosted, and production-relevant technologies.

<!-- TODO: Build a mermaid chart that is readable
### High-Level Architecture
-->

## Platform Modules

| **Module**                 | **Purpose**                                                   | **Key Tech**                                                | **Repository**        |
| -------------------------- | ------------------------------------------------------------- | ----------------------------------------------------------- | --------------------- |
| Documentation & Governance | Program specifications, architecture, standards, and policies | Markdown, GitHub Actions, MkDocs                            | `sai-platform-meta`   |
| Platform Infrastructure    | Unified infrastructure: Vault, Caddy, Loki, Grafana, MLflow   | Docker Compose, Vault, Caddy, Grafana, Loki, OTel           | `sai-platform-infra`  |
| ML Foundations             | Core machine learning pipelines and datasets                  | PyTorch, scikit-learn, MLflow                               | `sai-ml-foundations`  |
| Inference API              | Secure model-serving API with JWT + RBAC                      | FastAPI, Pydantic, PyTorch, MLflow SDK                      | `sai-inference-api`   |
| Agent SecOps               | Secure LangChain agents for SOC automation                    | LangChain, FastAPI, Vault, OTel                             | `sai-agent-secops`    |
| Adversarial Lab            | Adversarial ML, red-teaming, and security tests               | Adversarial Robustness Toolbox, PyTorch, LLM Red Team tools | `sai-adversarial-lab` |
| MLOps Pipeline             | CI/CD, scanning, SBOMs, and release governance                | GitHub Actions, Trivy, Syft, OPA, Cosign                    | `sai-mlops-pipeline`  |

## Repository Definitions

### `sai-platform-meta`

**Purpose:** Acts as the control plane and governance layer for the entire platform.

- Contains program specifications, templates, CI/CD baselines, and policies.
- Source of truth for architecture, security, and observability standards.
- Provides reusable `.github/` workflows and `.dev/` scaffolds.

**Key Contents:**

- `/docs/` -> specs, architecture, narratives
- `.github/` -> CI/CD and security automation templates
- `.dev/` -> pre-commit hooks, linting, make targets

### `sai-platform-infra`

**Purpose:** Provides local infrastructure for all other services.

- Hosts Vault, Caddy, Loki, Grafana, and MLflow under Compose profiles.
- Exposes telemetry and secret-management endpoints for other repos.

**Key Technologies:**

- Docker Compose (profiles: observability, secrets, registry, proxy)
- Caddy (reverse proxy), Loki/Grafana (logging & metrics), Vault (secrets)
- OTel Collector (traces)

**Deliverables:**

- `docker-compose.yml`, `Caddyfile`, `otel-collector.yaml`, `vault-bootstrap.sh`
- `/docs/tech/runbook.md` (how to operate locally)

### `sai-ml-foundation`

**Purpose:** Reproducible, secure ML training pipelines.

- Demonstrates secure model development lifecycle.
- Integrates MLflow for experiment tracking.
- Documents dataset provenance and lineage.

**Key Technologies:** PyTorch, scikit-learn, MLflow, pre-commit, ruff

**Deliverables:**

- `/src/` -> model training & evaluation
- `/data/` -> dataset cards & manifests
- `/docs/` -> threat model, model cards, architecture

### `sai-inference-api`

**Purpose:** Securely serve ML models as APIs.

- Implements JWT authentication and RBAC.
- Logs inferences with correlation IDs for traceability.
- Integrates with OTel and the observability stack.

**Key Technologies:** FastAPI, Uvicorn, PyTorch, Pydantic, JWT, OTel

**Deliverables:**

- `/src/` -> API code
- `/tests/` -> security and functional tests
- `/docs/` -> OpenAPI spec, runbook, threat model

### `sai-agent-secops`

**Purpose:** Build and secure LangChain agents for SOC automation.

- Enforces tool allowlists, RBAC, and policy-based prompt filtering.
- Integrates Vault for secret injection and audit logging.
- Provides auditability of prompt, tool, and result chains.

**Key Technologies:** LangChain, FastAPI, Vault, OTel, RegexGuard

**Deliverables:**

- `/src/agent/` -> core agent logic
- `/src/security/` -> guardrails & filters
- `/docs/` -> security controls, chain visualization

### `sai-adversarial-lab`

**Purpose:** Adversarial testing and AI red teaming.

- Tests model and agent resilience using adversarial attacks.
- Simulates prompt injections, jailbreaks, and data poisoning.
- Produces structured attack reports and metrics.

**Key Technologies:** Adversarial Robustness Toolbox (ART), PyTorch, LangChain Red Team tools

**Deliverables:**

- `/attacks/` -> attack harness
- `/tests/` -> regression and defense tests
- `/reports/` -> structured output
- `/docs/tech/threat-model.md` -> red team findings

### `sai-mlops-pipeline`

**Purpose:** Centralized CI/CD pipelines and policy enforcement.

- Provides reusable GitHub Actions workflows.
- Automates SBOM generation, container scanning, and artifact signing.
- Integrates OPA policies to enforce security gates.

**Key Technologies:** GitHub Actions, Trivy, Syft, Cosign, OPA/Conftest

**Deliverables:**

- `.github/workflows/` -> reusable CI/CD templates
- `/policy/` -> OPA policy bundles
- `/docs/` -> CI/CD standards and release governance

## Security & Compliance Foundations

**Security Architecture Principles:**

- Identity-first (JWT + RBAC on all APIs)
- Secrets in Vault only; short-lived tokens, no `.env` files committed
- SBOMs and signing enforced for every image (Trivy + Cosign)
- CI/CD policies enforced by OPA (fail closed)
- Static and dependency scanning (CodeQL, Dependabot)

**Threat Modeling:** Each repo maintains `/docs/tech/threat-model.md` following a shared template.
Platform-level threat models aggregate into: `/docs/architecture/THREAT_MODEL.md` within `sai-platform-meta`.

## Observability & Operations

**Telemetry Standard:** OpenTelemetry (OTel) is instrumented across every service.

| **Signal** | **Collector**                   | **Sink**        |
| ---------- | ------------------------------- | --------------- |
| Logs       | Loki                            | Grafana Loki UI |
| Metrics    | Prometheus exporters -> Grafana | Dashboards      |
| Traces     | OTel Collector                  | Grafana Tempo   |

**Key Dashboards:**

- API latency and inference errors
- Model accuracy vs drift
- Agent tool usage statistics
- Adversarial lab attack outcomes

**Runbook:** `/docs/tech/runbook.md` in `sai-platform-infra` describes log/trace collection.

## Integration Topology

**Trust Zones:**

- `public` -> API Gateway / Agent endpoints (JWT auth)
- `internal` -> MLflow, Vault, Observability, CI/CD
- `secure` -> Signing keys, OPA policies, SBOM registry

**Secrets Flow:**

1. Vault issues short-lived tokens for APIs and CI/CD.
2. Services retrieve secrets dynamically via OIDC or AppRole.
3. No static keys or `.env` files under version control.

**Network Summary:**

| **Service**    | **Port**    | **Description**  |
| -------------- | ----------- | ---------------- |
| Grafana        | 3000        | Observability UI |
| Loki           | 3100        | Logs ingestion   |
| OTel Collector | 4317 / 4318 | Telemetry input  |
| Vault          | 8200        | Secrets API      |
| Caddy          | 80 / 443    | Reverse proxy    |

## Development Lifecycle

**Flow Overview:**

> Code -> Lint/Test -> SBOM -> Scan -> Sign -> Deploy -> Monitor -> Feedback -> Retrain

**Stages:**

1. **Code & Commit** -> pre-commit hooks enforce lint, typing, and secret scan.
2. **CI Build** -> SBOM generation (Syft) + scanning (Trivy).
3. **Policy Gate** -> OPA checks; fail if HIGH/CRITICAL unwaived.
4. **Sign & Release** -> Cosign signature, Git tag, changelog update.
5. **Deploy** -> Compose or K8s.
6. **Monitor** -> OTel + Grafana dashboards.
7. **Feedback Loop** -> retraining, adversarial testing, or model updates.

**Versioning:** Semantic (`v<major>.<minor>.<patch>`)

## Future Expansion

**Planned Enhancements:**

- Containerized K8s Helm deployment
- SOC Integration: alert triage bot and LLM-driven response workflows
- Compliance-as-code via Open Policy Agent extensions
- Distributed tracing with Grafana Tempo
- Public documentation site via MkDocs or Docusaurus

**Long-term Goals:**

- Demonstrate full AI security lifecycle: **design -> defense -> detection -> governance**
- Publish the architecture as a public reference for secure MLOps.
