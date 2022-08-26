# The AWS Provider is set to retrieve configuration from the executing environment
# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs#schema
provider "aws" {
  region = "us-east-1"
}

#
provider "aws" {
  alias  = "us-east-1"
  region = "us-east-1"
}
