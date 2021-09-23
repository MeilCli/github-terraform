resource "github_repository" "aws-sam-typescript-template" {
  name                   = "aws-sam-typescript-template"
  description            = "This repository is my AWS SAM TypeScript Repository template"
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
  collaborators_aws_sam_typescript_template = ["MeilCli-bot"]
}

resource "github_repository_collaborator" "aws-sam-typescript-template" {
  for_each   = toset(local.collaborators_aws_sam_typescript_template)
  repository = "aws-sam-typescript-template"
  username   = each.value
}
