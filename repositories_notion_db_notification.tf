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
