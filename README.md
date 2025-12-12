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

If you haven't setup an HCP Terraform organization yet, the [Manual Onboarding Setup](#Manual-Onboarding-Setup) section below walks you through the steps to get started.

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
| <a name="module_discovery"></a> [discovery](#module\_discovery) | craigsloggett/discovery/tfe | 0.14.0 |

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

## Manual Onboarding Setup

The following steps can be used as a guide when onboarding a new repository.

### HashiCorp Cloud Platform

1. Create an HCP account.
2. Create an HCP organization.
3. Create an HCP project.

### HCP Terraform

1. Create an HCP Terraform organization.
2. Run `terraform login` to generate a user API token.
3. Update `backend.tf` to use your HCP Terraform organization.
4. Run `terraform init` to create the backend workspace and project.
5. Manually generate a team API token for the "owners" team.
6. Manually create a variable set for the purpose of authenticating the TFE provider.
7. Populate the variable set with the `TFE_TOKEN` environment variable, using the API token as the (sensitive) value.
8. Assign the variable set to the backend workspace (or project).

#### VCS Integration with GitHub

In order to scope the list of repositories shown to users when creating a VCS backed workspace,
it is necessary to either create and install an OAuth App in your GitHub organization or use a
fine-grained personal access token attached to a service account. Using a service account is
not strictly required but is recommended in order to ensure _only_ repositories for an
organization are listed -- and not those belonging to a user.

This steers away from the standard advice of using the pre-installed GitHub App that comes with
HCP Terraform. The reason for this is because of the lack of control for the user experience
as mentioned.

The following sections outline what is needed to setup an OAuth App in your GitHub Organization.

##### Creating a GitHub Service Account

Create a GitHub service account by navigating to https://github.com/signup and creating a new
user with a unique email and username. This user is like any other human user, but will be
configured with a private profile and own no repositories.

When providing permissions for anything accessing the GitHub organization, the following are
required for HCP Terraform's VCS Provider:

- Commit statuses: Read and write
- Contents: Read-only
- Metadata: Read-only
- Webhooks: Read and write

##### Add the Service Account to the GitHub Organization

Once created, add the service account as a member of the GitHub organization being integrated
with HCP Terraform.

##### Create an OAuth App in the GitHub Organization

Navigate to GitHub organization settings -> Developer settings -> OAuth Apps to create a new
OAuth App for the _organization_ (not an individual user).

The Application name, Homepage URL, and Authorization callback URL fields will be populated
with information found in HCP Terraform. Device flow can be enabled if desired, but does
not affect the process either way.

Pause here and open a new window/tab with the HCP Terraform organization open and logged in
as a user with access to add a VCS Provider.

###### Add a VCS Provider

Navigate to HCP Terraform organization settings -> Version Control -> Providers to Add a VCS provider.
Select GitHub -> GitHub.com (Custom) to display the information needed to populate the OAuth application
registration form.

Back in GitHub, within the OAuth App registration window/tab, copy the Application name, Homepage URL,
and Authorization callback URL into the relevant fields in the OAuth App configuration.

Click Register application and copy the Client ID into the Add VCS Provider window in HCP Terraform and
give the VCS Provider the same name as the GitHub organization being configured.

Finally, in the OAuth App, Generate a new client secret, and copy the secret into the Add VCS Provider
window in HCP Terraform.

Click Connect and continue to begin the authorization workflow between HCP Terraform and GitHub. At this
point it is important to be logged into GitHub using your _service account_ created earlier, not your
user account. It is important to note that the email used for the GitHub _service account_ does not need
to be a member of the HCP Terraform organization.
