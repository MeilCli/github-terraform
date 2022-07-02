resource "github_repository" "ripple-text" {
  name                   = "RippleText"
  description            = "Ripple effect for clickable text on android view and composable function"
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
  collaborators_ripple_text = ["MeilCli-bot"]
}

resource "github_repository_collaborator" "ripple_text" {
  depends_on = [github_repository.ripple-text]
  for_each   = toset(local.collaborators_ripple_text)
  repository = "RippleText"
  username   = each.value
}


resource "github_branch_protection" "ripple_text" {
  depends_on    = [github_repository.ripple-text]
  repository_id = "RippleText"
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

resource "github_issue_label" "ripple-text-BreakingChange" {
  depends_on  = [github_repository.ripple-text]
  repository  = "RippleText"
  name        = "BreakingChange"
  color       = "db3b4d"
  description = ""
}

resource "github_issue_label" "ripple-text-Bug" {
  depends_on  = [github_repository.ripple-text]
  repository  = "RippleText"
  name        = "Bug"
  color       = "d73a4a"
  description = "Something isn't working"
}

resource "github_issue_label" "ripple-text-Dependencies" {
  depends_on  = [github_repository.ripple-text]
  repository  = "RippleText"
  name        = "Dependencies"
  color       = "abc43e"
  description = ""
}

resource "github_issue_label" "ripple-text-Development" {
  depends_on  = [github_repository.ripple-text]
  repository  = "RippleText"
  name        = "Development"
  color       = "fef2c0"
  description = ""
}

resource "github_issue_label" "ripple-text-Documentation" {
  depends_on  = [github_repository.ripple-text]
  repository  = "RippleText"
  name        = "Documentation"
  color       = "1d76db"
  description = ""
}

resource "github_issue_label" "ripple-text-Feature" {
  depends_on  = [github_repository.ripple-text]
  repository  = "RippleText"
  name        = "Feature"
  color       = "a2eeef"
  description = "New feature or request"
}

resource "github_issue_label" "ripple-text-Maintenance" {
  depends_on  = [github_repository.ripple-text]
  repository  = "RippleText"
  name        = "Maintenance"
  color       = "4d6eb7"
  description = ""
}

resource "github_issue_label" "ripple-text-Question" {
  depends_on  = [github_repository.ripple-text]
  repository  = "RippleText"
  name        = "Question"
  color       = "d876e3"
  description = "Further information is requested"
}
