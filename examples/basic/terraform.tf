terraform {
  required_providers {
    # see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_zone
    aws = {
      source  = "hashicorp/aws"
      version = "4.27.0"
    }
  }
}
