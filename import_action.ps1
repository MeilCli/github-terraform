$name = $args[0]

terraform import "github_repository.action[\`"$name\`"]" $name
terraform import "github_repository_collaborator.action[\`"$name\`"]" "${name}:MeilCli-bot"
terraform import "github_branch_protection.action-master[\`"$name\`"]" "${name}:master"
terraform import "github_branch_protection.action-v[\`"$name\`"]" "${name}:v*"
terraform import "github_issue_label.action-Action[\`"$name\`"]" "${name}:Action"
terraform import "github_issue_label.action-BreakingChange[\`"$name\`"]" "${name}:BreakingChange"
terraform import "github_issue_label.action-Bug[\`"$name\`"]" "${name}:Bug"
terraform import "github_issue_label.action-Dependencies[\`"$name\`"]" "${name}:Dependencies"
terraform import "github_issue_label.action-Development[\`"$name\`"]" "${name}:Development"
terraform import "github_issue_label.action-Documentation[\`"$name\`"]" "${name}:Documentation"
terraform import "github_issue_label.action-Feature[\`"$name\`"]" "${name}:Feature"
terraform import "github_issue_label.action-Maintenance[\`"$name\`"]" "${name}:Maintenance"
terraform import "github_issue_label.action-Question[\`"$name\`"]" "${name}:Question"