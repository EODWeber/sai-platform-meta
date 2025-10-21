# Repo Story - `sai-platform-meta`

The **`sai-platform-meta`** repository acts as the foundation and coordination layer for the entire Secure AI Platform.
It contains the program’s documentation, standards, templates, and shared assets used by all other modules.

This repository does not host application code — instead, it defines **how the platform works, how it’s governed, and how it’s built**.
In production terms, this is the platform’s *source of truth* for documentation, security policies, and CI/CD templates.

## Summary

The `sai-platform-meta` repository provides:

- **Documentation & Architecture**
  - All platform-level specifications, diagrams, and whitepapers.
  - Reference architectures and security threat models.
- **Governance**
  - Templates and baselines for code quality, repository standards, and contribution guidelines.
  - Shared `.github/` workflows for security scanning, dependency updates, and changelog generation.
- **Engineering Utilities**
  - Developer setup scripts, Make targets, and pre-commit hooks used across repositories.
- **Narrative & Writing**
  - Plain-language and technical documentation for public sharing (like this narrative).

In short, this repository defines *the way* every other Secure AI Platform module is built, documented, and operated.

## Scaffold

A simplified structure of this repository:

```tree
sai-platform-meta/
├── .github/
│   ├── workflows/             # Shared CI/CD templates for other repos
│   ├── ISSUE_TEMPLATE/        # (Optional) Issue and PR templates
│   └── PULL_REQUEST_TEMPLATE.md
│
├── .dev/
│   ├── hooks/                 # Pre-commit hooks and development helpers
│   └── lint/                  # Configuration for ruff, black, mypy, etc.
│
├── docs/
│   ├── architecture/          # Diagrams, platform blueprints, and specs
│   │   ├── PLATFORM_OVERVIEW.md
│   │   └── architecture-diagram.mmd
│   ├── narrative/             # Public-facing project narratives
│   │   ├── PLATFORM_STORY.md
│   │   └── REPO_STORY.md
│   └── tech/                  # Internal technical references and deep dives
│
├── scripts/
│   ├── make_init.sh           # Bootstrap dev environment
│   └── sync_workflows.sh      # Sync shared GitHub workflows to other repos
│
├── LICENSE
├── README.md                  # Repository overview, badges, and links
└── Makefile                   # High-level commands for setup and sync
```

### Folder Notes

- **`.github/`**
  - Centralized automation hub.
    Includes reusable workflows for linting, scanning, and dependency checks.
  - Templates for issues and PRs standardize the contribution process across all repositories.

- **`.dev/`**
  - Local development configuration — hooks, code style tools, and environment setup.
  - Ensures consistency when working across different modules.

- **`docs/`**
  - The documentation backbone of the project.
  - Split into:
    - `architecture/`: high-level technical structure and specifications.
    - `narrative/`: layman-readable project explanations and blog-ready stories.
    - `tech/`: deeper implementation notes or security deep dives.

- **`scripts/`**
  - Utility scripts to set up developer environments, synchronize CI/CD templates, or bootstrap other repos.
  - These scripts are referenced from the `Makefile` for easy execution.

- **`Makefile`**
  - Provides short, memorable commands to automate tasks like:
    - `make setup` → Initialize the dev environment.
    - `make sync` → Push shared workflows to other repositories.
    - `make docs` → Build or preview documentation.

## Other Relevant Information

### Usage Across the Platform

All other Secure AI Platform repositories reference this repo for shared standards.
For example:
- The **ML Foundations** repo uses the pre-commit and lint configs from `.dev/`.
- The **Inference API** repo imports the shared CI/CD workflows from `.github/workflows/`.
- The **Adversarial Lab** repo inherits security scanning workflows for container builds.

### Documentation Strategy

Each document in this repo is designed to support **both internal development and public presentation**:
- *Architecture docs* → for engineers and contributors.
- *Narrative docs* → for blog readers and hiring managers.
- *Technical deep dives* → for future whitepapers or research publications.

### Maintenance & Versioning

- Each update or new capability in the platform should include corresponding updates here:
  - Diagrams in `docs/architecture`
  - Narratives in `docs/narrative`
  - CI/CD templates in `.github/workflows`
- Changes should be tagged using **semantic versioning** (`vX.Y.Z`).
- The repository itself may issue changelog entries (even though it has no runtime code) to reflect new standards, templates, or documentation updates.

### Future Additions

Planned extensions for `sai-platform-meta` include:
- **MkDocs or Docusaurus site** generation for publishing all documentation.
- **Centralized policy definitions** (OPA or YAML schemas) for consistency across CI/CD pipelines.
- **Architecture blueprints** exported as versioned documents for external readers.

**In short:**
The `sai-platform-meta` repository is the *command center* of the Secure AI Platform — defining the standards, structures, and documentation that unify every module into a coherent, secure, and maintainable system.
