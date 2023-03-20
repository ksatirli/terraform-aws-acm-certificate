terraform {
  # see https://developer.hashicorp.com/terraform/language/settings#specifying-provider-requirements
  required_providers {
    # see https://registry.terraform.io/providers/hashicorp/aws/4.59.0/
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.59.0, < 5.0.0"

      # see https://developer.hashicorp.com/terraform/language/providers/configuration#alias-multiple-provider-configurations
      configuration_aliases = [
        aws.certificate
      ]
    }
  }

  # see https://developer.hashicorp.com/terraform/language/settings#specifying-a-required-terraform-version
  required_version = ">= 1.1.0"
}
