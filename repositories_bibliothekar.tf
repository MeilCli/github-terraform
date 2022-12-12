resource "github_repository" "bibliothekar" {
  name                   = "Bibliothekar"
  description            = "Licenses of dependencies tool"
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
  collaborators_bibliothekar = ["MeilCli-bot"]
}

resource "github_repository_collaborator" "bibliothekar" {
  depends_on = [github_repository.bibliothekar]
  for_each   = toset(local.collaborators_bibliothekar)
  repository = "Bibliothekar"
  username   = each.value
}


resource "github_branch_protection" "bibliothekar" {
  depends_on    = [github_repository.bibliothekar]
  repository_id = "Bibliothekar"
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

resource "github_issue_label" "bibliothekar-BreakingChange" {
  depends_on  = [github_repository.bibliothekar]
  repository  = "Bibliothekar"
  name        = "BreakingChange"
  color       = "db3b4d"
  description = ""
}

resource "github_issue_label" "bibliothekar-Bug" {
  depends_on  = [github_repository.bibliothekar]
  repository  = "Bibliothekar"
  name        = "Bug"
  color       = "d73a4a"
  description = "Something isn't working"
}

resource "github_issue_label" "bibliothekar-Dependencies" {
  depends_on  = [github_repository.bibliothekar]
  repository  = "Bibliothekar"
  name        = "Dependencies"
  color       = "abc43e"
  description = ""
}

resource "github_issue_label" "bibliothekar-Development" {
  depends_on  = [github_repository.bibliothekar]
  repository  = "Bibliothekar"
  name        = "Development"
  color       = "fef2c0"
  description = ""
}

resource "github_issue_label" "bibliothekar-Documentation" {
  depends_on  = [github_repository.bibliothekar]
  repository  = "Bibliothekar"
  name        = "Documentation"
  color       = "1d76db"
  description = ""
}

resource "github_issue_label" "bibliothekar-Feature" {
  depends_on  = [github_repository.bibliothekar]
  repository  = "Bibliothekar"
  name        = "Feature"
  color       = "a2eeef"
  description = "New feature or request"
}

resource "github_issue_label" "bibliothekar-Maintenance" {
  depends_on  = [github_repository.bibliothekar]
  repository  = "Bibliothekar"
  name        = "Maintenance"
  color       = "4d6eb7"
  description = ""
}

resource "github_issue_label" "bibliothekar-Question" {
  depends_on  = [github_repository.bibliothekar]
  repository  = "Bibliothekar"
  name        = "Question"
  color       = "d876e3"
  description = "Further information is requested"
}
