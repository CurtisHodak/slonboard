resource "spacelift_stack" "onboard1" {
  name     = "Onboard1"
  space_id = "root"

  #   namespace = "CurtisHodak"
  repository   = "slonboard"
  branch       = "main"
  project_root = "chaws"

  terraform_version            = "1.5.7"
  terraform_workflow_tool      = "TERRAFORM_FOSS"
  terraform_smart_sanitization = true

  description                      = "Created for support onboarding tasks first stack"
  additional_project_globs         = [""]
  enable_well_known_secret_masking = true
  github_action_deploy             = false
}

resource "spacelift_environment_variable" "TF_VAR_spacelift_api_key_id" {
  name        = "TF_VAR_spacelift_api_key_id"
  description = "key id!"
  write_only  = true
  stack_id    = spacelift_stack.onboard1.id
  value       = "<secret-to-fill>"
}

resource "spacelift_environment_variable" "TF_VAR_spacelift_api_key_secret" {
  name       = "TF_VAR_spacelift_api_key_secret"
  write_only = true
  stack_id   = spacelift_stack.onboard1.id
  value      = "<secret-to-fill>"
}

resource "spacelift_environment_variable" "TF_VAR_worker_pool_config" {
  name        = "TF_VAR_worker_pool_config"
  description = "worker-pool-id.config"
  write_only  = true
  stack_id    = spacelift_stack.onboard1.id
  value       = "<secret-to-fill>"
}

resource "spacelift_environment_variable" "TF_VAR_worker_pool_id" {
  name       = "TF_VAR_worker_pool_id"
  write_only = false
  stack_id   = spacelift_stack.onboard1.id
  value      = "01JTTTH31F1KDXDPQZWH46GQKP"
}

resource "spacelift_environment_variable" "TF_VAR_worker_pool_private_key" {
  name        = "TF_VAR_worker_pool_private_key"
  description = "cat spacelift.key | base64 -b 0 | pbcopy"
  write_only  = true
  stack_id    = spacelift_stack.onboard1.id
  value       = "<secret-to-fill>"
}

resource "spacelift_context_attachment" "firstcontext" {
  context_id = "firstcontext"
  stack_id   = spacelift_stack.onboard1.id
}