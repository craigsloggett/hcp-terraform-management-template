terraform {
  # Version v1.6.0 is the first version to introduce the `terraform test` command.
  # Version v1.5.0 is the first version to introduce `import` blocks.
  required_version = "~> 1.5"

  required_providers {
    tfe = {
      source  = "hashicorp/tfe"
      version = "0.71.0"
    }
  }
}
