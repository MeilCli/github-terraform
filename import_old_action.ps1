$name = $args[0]

terraform import "github_repository.old-action[\`"$name\`"]" $name
terraform import "github_repository_collaborator.old-action[\`"$name\`"]" "${name}:MeilCli-bot"
terraform import "github_branch_protection.old-action-master[\`"$name\`"]" "${name}:master"
terraform import "github_branch_protection.old-action-v[\`"$name\`"]" "${name}:v*"
terraform import "github_issue_label.old-action-Action[\`"$name\`"]" "${name}:Action"
terraform import "github_issue_label.old-action-BreakingChange[\`"$name\`"]" "${name}:BreakingChange"
terraform import "github_issue_label.old-action-Bug[\`"$name\`"]" "${name}:Bug"
terraform import "github_issue_label.old-action-Dependencies[\`"$name\`"]" "${name}:Dependencies"
terraform import "github_issue_label.old-action-Development[\`"$name\`"]" "${name}:Development"
terraform import "github_issue_label.old-action-Documentation[\`"$name\`"]" "${name}:Documentation"
terraform import "github_issue_label.old-action-Feature[\`"$name\`"]" "${name}:Feature"
terraform import "github_issue_label.old-action-Maintenance[\`"$name\`"]" "${name}:Maintenance"
terraform import "github_issue_label.old-action-Question[\`"$name\`"]" "${name}:Question"