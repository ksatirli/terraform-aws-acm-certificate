terraform {
  # see https://www.terraform.io/docs/language/settings/index.html#specifying-provider-requirements
  required_providers {
    # see https://registry.terraform.io/providers/hashicorp/aws/4.33.0/
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.33.0, < 5.0.0"

      configuration_aliases = [
        aws.certificate
      ]
    }
  }

  # see https://www.terraform.io/docs/language/settings/index.html#specifying-a-required-terraform-version
  required_version = ">= 1.1.0"
}
