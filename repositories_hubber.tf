resource "github_repository" "hubber" {
  name                   = "hubber"
  description            = "playground android architecture"
  has_projects           = false
  has_wiki               = false
  has_downloads          = true
  has_issues             = true
  is_template            = false
  allow_rebase_merge     = false
  delete_branch_on_merge = true
  vulnerability_alerts   = true
}

locals {
  collaborators_hubber = ["MeilCli-bot"]
}

resource "github_repository_collaborator" "hubber" {
  depends_on = [github_repository.hubber]
  for_each   = toset(local.collaborators_hubber)
  repository = "hubber"
  username   = each.value
}


resource "github_branch_protection" "hubber" {
  depends_on    = [github_repository.hubber]
  repository_id = "hubber"
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

resource "github_issue_label" "hubber-BreakingChange" {
  depends_on  = [github_repository.hubber]
  repository  = "hubber"
  name        = "BreakingChange"
  color       = "db3b4d"
  description = ""
}

resource "github_issue_label" "hubber-Bug" {
  depends_on  = [github_repository.hubber]
  repository  = "hubber"
  name        = "Bug"
  color       = "d73a4a"
  description = "Something isn't working"
}

resource "github_issue_label" "hubber-Dependencies" {
  depends_on  = [github_repository.hubber]
  repository  = "hubber"
  name        = "Dependencies"
  color       = "abc43e"
  description = ""
}

resource "github_issue_label" "hubber-Development" {
  depends_on  = [github_repository.hubber]
  repository  = "hubber"
  name        = "Development"
  color       = "fef2c0"
  description = ""
}

resource "github_issue_label" "hubber-Documentation" {
  depends_on  = [github_repository.hubber]
  repository  = "hubber"
  name        = "Documentation"
  color       = "1d76db"
  description = ""
}

resource "github_issue_label" "hubber-Feature" {
  depends_on  = [github_repository.hubber]
  repository  = "hubber"
  name        = "Feature"
  color       = "a2eeef"
  description = "New feature or request"
}

resource "github_issue_label" "hubber-Maintenance" {
  depends_on  = [github_repository.hubber]
  repository  = "hubber"
  name        = "Maintenance"
  color       = "4d6eb7"
  description = ""
}

resource "github_issue_label" "hubber-Question" {
  depends_on  = [github_repository.hubber]
  repository  = "hubber"
  name        = "Question"
  color       = "d876e3"
  description = "Further information is requested"
}
