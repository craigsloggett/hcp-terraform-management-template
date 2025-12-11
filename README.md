# hcp-terraform-management

An infrastructure as code repository to manage the "MYORG" HCP Terraform organization.

## Usage

The following files require your attention immediately after creating a
repository from this template:

- [ ] .github/CODEOWNERS
- [ ] .github/dependabot.yml
- [ ] .github/workflows/lint.yml
- [ ] backend.tf
- [ ] README.md

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.5 |
| <a name="requirement_tfe"></a> [tfe](#requirement\_tfe) | 0.71.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_tfe"></a> [tfe](#provider\_tfe) | 0.71.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_discovery"></a> [discovery](#module\_discovery) | git::https://github.com/craigsloggett-lab/terraform-tfe-discovery | v0.14.0 |

## Inputs

No inputs.

## Resources

| Name | Type |
|------|------|
| [tfe_organization.this](https://registry.terraform.io/providers/hashicorp/tfe/0.71.0/docs/resources/organization) | resource |
| [tfe_organization_membership.this](https://registry.terraform.io/providers/hashicorp/tfe/0.71.0/docs/resources/organization_membership) | resource |
| [tfe_project.default](https://registry.terraform.io/providers/hashicorp/tfe/0.71.0/docs/resources/project) | resource |
| [tfe_team.owners](https://registry.terraform.io/providers/hashicorp/tfe/0.71.0/docs/resources/team) | resource |
| [tfe_team_organization_members.owners](https://registry.terraform.io/providers/hashicorp/tfe/0.71.0/docs/resources/team_organization_members) | resource |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
