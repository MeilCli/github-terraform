resource "github_repository" "notion-db-notification" {
  name                   = "notion-db-notification"
  description            = "This cli tool is that notify created or updated page of notion database"
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
  collaborators_notion_db_notification = ["MeilCli-bot"]
}

resource "github_repository_collaborator" "notion_db_notification" {
  depends_on = [github_repository.notion-db-notification]
  for_each   = toset(local.collaborators_notion_db_notification)
  repository = "notion-db-notification"
  username   = each.value
}


resource "github_branch_protection" "notion_db_notification" {
  depends_on    = [github_repository.notion-db-notification]
  repository_id = "notion-db-notification"
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

resource "github_issue_label" "notion-db-notification-BreakingChange" {
  depends_on  = [github_repository.notion-db-notification]
  repository  = "notion-db-notification"
  name        = "BreakingChange"
  color       = "db3b4d"
  description = ""
}

resource "github_issue_label" "notion-db-notification-Bug" {
  depends_on  = [github_repository.notion-db-notification]
  repository  = "notion-db-notification"
  name        = "Bug"
  color       = "d73a4a"
  description = "Something isn't working"
}

resource "github_issue_label" "notion-db-notification-Dependencies" {
  depends_on  = [github_repository.notion-db-notification]
  repository  = "notion-db-notification"
  name        = "Dependencies"
  color       = "abc43e"
  description = ""
}

resource "github_issue_label" "notion-db-notification-Development" {
  depends_on  = [github_repository.notion-db-notification]
  repository  = "notion-db-notification"
  name        = "Development"
  color       = "fef2c0"
  description = ""
}

resource "github_issue_label" "notion-db-notification-Documentation" {
  depends_on  = [github_repository.notion-db-notification]
  repository  = "notion-db-notification"
  name        = "Documentation"
  color       = "1d76db"
  description = ""
}

resource "github_issue_label" "notion-db-notification-Feature" {
  depends_on  = [github_repository.notion-db-notification]
  repository  = "notion-db-notification"
  name        = "Feature"
  color       = "a2eeef"
  description = "New feature or request"
}

resource "github_issue_label" "notion-db-notification-Maintenance" {
  depends_on  = [github_repository.notion-db-notification]
  repository  = "notion-db-notification"
  name        = "Maintenance"
  color       = "4d6eb7"
  description = ""
}

resource "github_issue_label" "notion-db-notification-Question" {
  depends_on  = [github_repository.notion-db-notification]
  repository  = "notion-db-notification"
  name        = "Question"
  color       = "d876e3"
  description = "Further information is requested"
}
