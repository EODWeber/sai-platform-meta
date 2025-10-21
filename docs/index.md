# Secure AI Platform – Meta Repository

Welcome to the **Secure AI Platform (SAI Platform)** documentation hub.
This site is powered by **MkDocs** and serves as the single source of truth for all documentation, architecture, and governance resources that guide the Secure AI Platform project.

## 🌐 Overview

The Secure AI Platform is an open-source initiative that demonstrates how to **build, deploy, and secure AI systems** in a real-world, production-style environment.
It combines modern MLOps practices with DevSecOps principles to showcase the **secure design of AI infrastructure, APIs, and agents**.

This repository — `sai-platform-meta` — acts as the **governance and documentation layer** of the entire platform. It defines how each module is built, tested, secured, and documented.

## 🧭 What You’ll Find Here

| Category                  | Description                                                                   |
| ------------------------- | ----------------------------------------------------------------------------- |
| **Architecture**          | High-level platform designs, diagrams, and specifications.                    |
| **Narrative**             | Plain-language explanations, project stories, and educational write-ups.      |
| **Technical**             | In-depth engineering references, configuration notes, and security baselines. |
| **Workflows & Templates** | Shared GitHub Actions, issue templates, and contribution standards.           |

## 🧩 Platform Modules

Each major component of the Secure AI Platform lives in its own repository and integrates through shared standards defined here.

| Module                  | Purpose                                                              |
| ----------------------- | -------------------------------------------------------------------- |
| **sai-platform-meta**   | Central documentation, governance, CI/CD templates.                  |
| **sai-platform-infra**  | Local and cluster infrastructure (Vault, Loki, Grafana, OTel, etc.). |
| **sai-ml-foundations**  | Machine learning pipelines and experiment tracking.                  |
| **sai-inference-api**   | Secure model serving API with JWT and RBAC.                          |
| **sai-agent-secops**    | Secure AI agents and automation for SOC workflows.                   |
| **sai-adversarial-lab** | Adversarial testing, red teaming, and model robustness validation.   |
| **sai-mlops-pipeline**  | Central CI/CD, scanning, and signing pipelines.                      |

> For an architectural overview of how these modules connect, see
> [Platform Overview](architecture/PLATFORM_OVERVIEW.md).

## ⚙️ Getting Started Locally

You can set up the local environment entirely with Python — no system-level dependencies required.

```bash
# Clone the repository
git clone https://github.com/EODWeber/sai-platform-meta.git
cd sai-platform-meta

# Set up local virtual environment and dependencies
make setup

# Run all pre-commit checks
. .venv/bin/activate
pre-commit run -a

# Serve documentation locally
make docs
```

When you’re ready, open `http://127.0.0.1:8000` in your browser to explore the site.

## 🛠 Documentation Structure

```
docs/
├── index.md                 # You are here
├── architecture/            # Technical structure and diagrams
│   └── PLATFORM_OVERVIEW.md
├── narrative/               # Project stories and accessible explanations
│   ├── PLATFORM_STORY.md
│   └── REPO_STORY.md
└── tech/                    # Deep dives, baselines, and configuration notes
```

Each section can be read independently, or as part of the full story:

- Start with Platform Story for an accessible overview.
- Explore Architecture Overview for technical depth.
- Drill down into module-specific docs as they’re added.

## 🧱 Building and Publishing Docs

This site is built with MkDocs Material.

```bash
# Serve locally
make docs

# Build static site
.venv/bin/mkdocs build
```

Docs are published automatically through GitHub Actions to:

```bash
https://<your-username>.github.io/sai-platform-meta/
```

> If you’re contributing or running locally, the only requirement is **Python 3.11+**.

## 🧩 Contributing

This project follows a security-first and open documentation model.
Before submitting changes:

1. Run pre-commit run -a to lint and scan your code.
2. Ensure documentation follows the existing format and voice.
3. Include or update relevant architecture diagrams when adding new modules or workflows.

## 🧠 Learn More

- Platform Story – High-level explanation in plain language.
- Architecture Overview – System structure and relationships.
- Meta Repo Story – Why this repository exists and how to use it.

Secure AI Platform (SAI Platform)
© 2025 Jeff Weber — Licensed under Apache 2.0
