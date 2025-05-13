resource "spacelift_stack" "main" {
  name     = "main"
  space_id = "root"

  repository   = "slonboard"
  branch       = "main"
  project_root = "chaws"

  terraform_version                = "1.5.7"
  terraform_workflow_tool          = "TERRAFORM_FOSS"
  terraform_smart_sanitization     = true
  enable_well_known_secret_masking = true
  github_action_deploy             = false
}

resource "spacelift_context_attachment" "firstcontext" {
  context_id = "firstcontext"
  stack_id   = spacelift_stack.main.id
}