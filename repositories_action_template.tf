resource "github_repository" "action-template" {
  name                   = "action-template"
  description            = "This repository is my GitHub Action Repository template"
  has_projects           = false
  has_wiki               = false
  has_downloads          = true
  has_issues             = true
  is_template            = true
  allow_rebase_merge     = false
  delete_branch_on_merge = true
  vulnerability_alerts   = true
}

locals {
  collaborators_action_template = ["MeilCli-bot"]
}

resource "github_repository_collaborator" "action-template" {
  for_each   = toset(local.collaborators_action_template)
  repository = "action-template"
  username   = each.value
}

resource "github_branch_protection" "action-template_master" {
  repository_id = "action-template"
  pattern       = "master"
  required_pull_request_reviews {
    dismiss_stale_reviews           = true
    require_code_owner_reviews      = true
    required_approving_review_count = 1
  }
  required_status_checks {
    strict   = false
    contexts = ["build"]
  }
}

locals {
  labels_action_template = {
    "Action"         = { color = "92efb4", description = "" }
    "BreakingChange" = { color = "db3b4d", description = "" }
    "Bug"            = { color = "d73a4a", description = "Something isn't working" }
    "Dependencies"   = { color = "abc43e", description = "" }
    "Development"    = { color = "fef2c0", description = "" }
    "Documentation"  = { color = "1d76db", description = "" }
    "Feature"        = { color = "a2eeef", description = "New feature or request" }
    "Maintenance"    = { color = "4d6eb7", description = "" }
    "Question"       = { color = "d876e3", description = "Further information is requested" }
  }
}

resource "github_issue_label" "action-template" {
  for_each    = local.labels_action_template
  repository  = "action-template"
  name        = each.key
  color       = each.value.color
  description = each.value.description
}
