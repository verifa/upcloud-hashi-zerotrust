# Manage auth methods broadly across Vault
path "auth/*"
{
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# Create, update, and delete auth methods
path "sys/auth/*"
{
  capabilities = ["create", "update", "delete", "sudo"]
}

# List auth methods
path "sys/auth"
{
  capabilities = ["read"]
}

# Create and manage ACL policies
path "sys/policies/acl/*"
{
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# List ACL policies
path "sys/policies/acl"
{
  capabilities = ["list"]
}

# Create and manage secrets engines broadly across Vault.
path "sys/mounts/*"
{
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# List enabled secrets engines
path "sys/mounts"
{
  capabilities = ["read", "list"]
}

# List, create, update, and delete key/value secrets at secrets/
path "secrets/*"
{
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# Manage transit secrets engine
path "transit/*"
{
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# Manage SSH secrets engine mounted at path ssh-client-signer/
path "ssh-client-signer/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}

# Manage database secrets engine at path postgres/
path "postgres/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}

# Read health checks
path "sys/health"
{
  capabilities = ["read", "sudo"]
}
