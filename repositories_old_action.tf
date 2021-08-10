locals {
  old_action_repositories = {
    "setup-crystal-action" = {
      description = "setup Crystal action for GitHub Actions.",
      topics      = ["crystal", "actions", "shards", "github-actions"]
    }
    "danger-action" = {
      description = "Execute danger action for GitHub Actions.",
      topics      = ["danger", "actions", "github-actions"]
    }
    "slack-upload-file" = {
      description = "upload file to slack action",
      topics      = ["slack", "slack-api", "github-actions"]
    }
    "android-lint-statistics" = {
      description = "Generate android lint statistics action",
      topics      = ["android", "android-lint", "github-actions"]
    }
    "detekt-statistics" = {
      description = "Generate detekt statistics action",
      topics      = ["detekt", "github-actions"]
    }
    "bump-release-action" = {
      description = "Bump version and publish release action",
      topics      = ["release-notes", "bump-version", "tag-manager", "github-actions"]
    }
    "npm-update-check-action" = {
      description = "npm new package version check action for GitHub Actions.",
      topics      = ["npm", "npm-package", "actions", "github-actions"]
    }
    "nuget-update-check-action" = {
      description = "nuget new package version check action for GitHub Actions.",
      topics      = ["nuget", "actions", "nuget-package", "github-actions"]
    }
    "gradle-update-check-action" = {
      description = "gradle maven new package version check action for GitHub Actions.",
      topics      = ["gradle", "maven", "actions", "github-actions"]
    }
    "cocoapods-update-check-action" = {
      description = "CocoaPods new package version check action for GitHub Actions.",
      topics      = ["cocoapods", "actions", "github-actions"]
    }
    "swiftpm-update-check-action" = {
      description = "SwiftPM new package version check action for GitHub Actions.",
      topics      = ["swift-package-manager", "actions", "github-actions"]
    }
    "carthage-update-check-action" = {
      description = "Carthage new package version check action for GitHub Actions.",
      topics      = ["carthage", "actions", "github-actions"]
    }
    "test-command-action" = {
      description = "testing command action for GitHub Actions.",
      topics      = ["actions", "github-actions"]
    }
  }
}

resource "github_repository" "old-action" {
  for_each               = local.old_action_repositories
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
}

resource "github_repository_collaborator" "old-action" {
  for_each   = local.old_action_repositories
  repository = each.key
  username   = "MeilCli-bot"
}

resource "github_branch_protection" "old-action-master" {
  for_each      = local.old_action_repositories
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

resource "github_branch_protection" "old-action-v" {
  for_each      = local.old_action_repositories
  repository_id = each.key
  pattern       = "v*"
}

resource "github_issue_label" "old-action-Action" {
  for_each    = local.old_action_repositories
  repository  = each.key
  name        = "Action"
  color       = "92efb4"
  description = ""
}

resource "github_issue_label" "old-action-BreakingChange" {
  for_each    = local.old_action_repositories
  repository  = each.key
  name        = "BreakingChange"
  color       = "db3b4d"
  description = ""
}

resource "github_issue_label" "old-action-Bug" {
  for_each    = local.old_action_repositories
  repository  = each.key
  name        = "Bug"
  color       = "d73a4a"
  description = "Something isn't working"
}

resource "github_issue_label" "old-action-Dependencies" {
  for_each    = local.old_action_repositories
  repository  = each.key
  name        = "Dependencies"
  color       = "abc43e"
  description = ""
}

resource "github_issue_label" "old-action-Development" {
  for_each    = local.old_action_repositories
  repository  = each.key
  name        = "Development"
  color       = "fef2c0"
  description = ""
}

resource "github_issue_label" "old-action-Documentation" {
  for_each    = local.old_action_repositories
  repository  = each.key
  name        = "Documentation"
  color       = "1d76db"
  description = ""
}

resource "github_issue_label" "old-action-Feature" {
  for_each    = local.old_action_repositories
  repository  = each.key
  name        = "Feature"
  color       = "a2eeef"
  description = "New feature or request"
}

resource "github_issue_label" "old-action-Maintenance" {
  for_each    = local.old_action_repositories
  repository  = each.key
  name        = "Maintenance"
  color       = "4d6eb7"
  description = ""
}

resource "github_issue_label" "old-action-Question" {
  for_each    = local.old_action_repositories
  repository  = each.key
  name        = "Question"
  color       = "d876e3"
  description = "Further information is requested"
}
