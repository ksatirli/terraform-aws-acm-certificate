# The AWS Provider is set to retrieve configuration from the executing environment
# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs#schema
provider "aws" {
  region = "us-east-1"
}

# The AWS Provider is set to retrieve configuration from the executing environment
# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs#schema
# This aliased version of the provider is specifically limited to the `us-east-1`
# region to allow for lifecycle operations for ACM resources.
provider "aws" {
  alias  = "us-east-1"
  region = "us-east-1"
}
