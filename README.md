# Flask + Postgres Helm Chart (DevSecOps checks)

This package organizes your provided Kubernetes manifests into a Helm chart and adds a minimal CI workflow to validate and scan the manifests.

## Structure
- `flaskpgchart/Chart.yaml`, `values.yaml`
- `flaskpgchart/templates/` (your Deployment/Service/StatefulSet files)
- `policies/` (optional OPA policies)
- `.github/workflows/k8s-checks.yml` (schema, lint, Trivy, OPA)

## CI
On PRs and pushes to `master`, the workflow renders the chart, runs kubeconform, kube-linter, Trivy config scan, and optional Conftest policies.
