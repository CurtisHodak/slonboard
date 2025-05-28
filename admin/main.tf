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

resource "spacelift_stack" "compute-storage" {
  name     = "compute-storage"
  space_id = "root"

  repository   = "slonboard"
  branch       = "main"
  project_root = "compute-storage"

  terraform_version                = "1.5.7"
  terraform_workflow_tool          = "TERRAFORM_FOSS"
  terraform_smart_sanitization     = true
  enable_well_known_secret_masking = true
  github_action_deploy             = false
}

resource "spacelift_stack" "database" {
  name     = "database"
  space_id = "providers-01JVZD87T4ZCCXZTWPV3SM39CB"

  repository   = "slonboard"
  branch       = "main"
  project_root = "database"

  terraform_version                = "1.5.7"
  terraform_workflow_tool          = "TERRAFORM_FOSS"
  terraform_smart_sanitization     = true
  enable_well_known_secret_masking = true
  github_action_deploy             = false
}

resource "spacelift_stack" "dependency1" {
  name     = "dependency1"
  space_id = "root"

  repository   = "slonboard"
  branch       = "main"
  project_root = "d1"

  terraform_version                = "1.5.7"
  terraform_workflow_tool          = "TERRAFORM_FOSS"
  terraform_smart_sanitization     = true
  enable_well_known_secret_masking = true
  github_action_deploy             = false
  additional_project_globs         = ["provider.tf"]
}

resource "spacelift_stack" "dependency2" {
  name     = "dependency2"
  space_id = "root"

  repository   = "slonboard"
  branch       = "main"
  project_root = "d2"

  terraform_version                = "1.5.7"
  terraform_workflow_tool          = "TERRAFORM_FOSS"
  terraform_smart_sanitization     = true
  enable_well_known_secret_masking = true
  github_action_deploy             = false
  additional_project_globs         = ["provider.tf"]
}

resource "spacelift_stack" "dependency3" {
  name     = "dependency3"
  space_id = "root"

  repository   = "slonboard"
  branch       = "main"
  project_root = "d3"

  terraform_version                = "1.5.7"
  terraform_workflow_tool          = "TERRAFORM_FOSS"
  terraform_smart_sanitization     = true
  enable_well_known_secret_masking = true
  github_action_deploy             = false
  additional_project_globs         = ["provider.tf"]
}


resource "spacelift_context_attachment" "firstcontext" {
  context_id = "firstcontext"
  stack_id   = spacelift_stack.main.id
}

resource "spacelift_context_attachment" "firstcontext1" {
  context_id = "firstcontext"
  stack_id   = spacelift_stack.compute-storage.id
}

resource "spacelift_context_attachment" "firstcontext2" {
  context_id = "firstcontext"
  stack_id   = spacelift_stack.database.id   
}

resource "spacelift_environment_variable" "tfTestVar" {
  name        = "tftestvar"
  stack_id    = "admin"
  value       = "/project/spacelift/kubeconfig"
  write_only  = false
  description = "testvar"
}
# resource "spacelift_policy" "pr_comment_plan" {
#   name = "pr_comment_plan"
#   body = file("./test.rego")
#   type = "NOTIFICATION"
#   description = "Comment on PRs with the plan"
#   labels = [
#     "policy:pr_comment_plan",
#     "policy:scope:all_spaces",
#   ]
# }