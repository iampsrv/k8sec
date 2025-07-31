package main

# Deployment containers must run as non-root
deny[msg] {
  input.kind == "Deployment"
  some i
  c := input.spec.template.spec.containers[i]
  not c.securityContext.runAsNonRoot
  msg := sprintf("Container %q must set securityContext.runAsNonRoot=true", [c.name])
}

# No privilege escalation
deny[msg] {
  input.kind == "Deployment"
  some i
  c := input.spec.template.spec.containers[i]
  c.securityContext.allowPrivilegeEscalation
  msg := sprintf("Container %q must set allowPrivilegeEscalation=false", [c.name])
}
