locals {
  action_repositories = {
    "regex-match" = {
      description = "regex match action",
      topics      = ["regex-match", "github-actions"]
    }
    "hidable-comment-action" = {
      description = "Create, update or delete comment by action argument",
      topics      = ["actions", "github-actions"]
    }
    "check-run-auto" = {
      description = "Action of github commit status",
      topics      = []
    }
    "common-lint-reporter" = {
      description = "generalized lint reporter action",
      topics      = ["lint", "reporting", "github-actions"]
    }
    "review-state-action" = {
      description = "",
      topics      = []
    }
  }
}

resource "github_repository" "action" {
  for_each               = local.action_repositories
  name                   = each.key
  description            = each.value.description
  topics                 = each.value.topics
  homepage_url           = "https://github.com/MeilCli/actions"
  has_projects           = false
  has_wiki               = false
  has_downloads          = true
  has_issues             = true
  is_template            = false
  allow_rebase_merge     = false
  delete_branch_on_merge = true
  vulnerability_alerts   = true
  template {
    owner      = "MeilCli"
    repository = "action-template"
  }
}

resource "github_repository_collaborator" "action" {
  depends_on = [github_repository.action]
  for_each   = local.action_repositories
  repository = each.key
  username   = "MeilCli-bot"
}

resource "github_branch_protection" "action-master" {
  depends_on    = [github_repository.action]
  for_each      = local.action_repositories
  repository_id = each.key
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

resource "github_branch_protection" "action-v" {
  depends_on    = [github_repository.action]
  for_each      = local.action_repositories
  repository_id = each.key
  pattern       = "v*"
}

resource "github_issue_label" "action-Action" {
  depends_on  = [github_repository.action]
  for_each    = local.action_repositories
  repository  = each.key
  name        = "Action"
  color       = "92efb4"
  description = ""
}

resource "github_issue_label" "action-BreakingChange" {
  depends_on  = [github_repository.action]
  for_each    = local.action_repositories
  repository  = each.key
  name        = "BreakingChange"
  color       = "db3b4d"
  description = ""
}

resource "github_issue_label" "action-Bug" {
  depends_on  = [github_repository.action]
  for_each    = local.action_repositories
  repository  = each.key
  name        = "Bug"
  color       = "d73a4a"
  description = "Something isn't working"
}

resource "github_issue_label" "action-Dependencies" {
  depends_on  = [github_repository.action]
  for_each    = local.action_repositories
  repository  = each.key
  name        = "Dependencies"
  color       = "abc43e"
  description = ""
}

resource "github_issue_label" "action-Development" {
  depends_on  = [github_repository.action]
  for_each    = local.action_repositories
  repository  = each.key
  name        = "Development"
  color       = "fef2c0"
  description = ""
}

resource "github_issue_label" "action-Documentation" {
  depends_on  = [github_repository.action]
  for_each    = local.action_repositories
  repository  = each.key
  name        = "Documentation"
  color       = "1d76db"
  description = ""
}

resource "github_issue_label" "action-Feature" {
  depends_on  = [github_repository.action]
  for_each    = local.action_repositories
  repository  = each.key
  name        = "Feature"
  color       = "a2eeef"
  description = "New feature or request"
}

resource "github_issue_label" "action-Maintenance" {
  depends_on  = [github_repository.action]
  for_each    = local.action_repositories
  repository  = each.key
  name        = "Maintenance"
  color       = "4d6eb7"
  description = ""
}

resource "github_issue_label" "action-Question" {
  depends_on  = [github_repository.action]
  for_each    = local.action_repositories
  repository  = each.key
  name        = "Question"
  color       = "d876e3"
  description = "Further information is requested"
}
