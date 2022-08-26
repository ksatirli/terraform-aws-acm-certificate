# AWS ACM Certificate

> This Terraform Module manages the lifecycle of DNS-validated [ACM Certificates](https://docs.aws.amazon.com/acm/latest/userguide/acm-overview.html).

## Table of Contents

- [AWS ACM Certificate](#aws-acm-certificate)
  - [Table of Contents](#table-of-contents)
  - [Overview](#overview)
  - [Requirements](#requirements)
  - [Usage](#usage)
  - [Author Information](#author-information)
  - [License](#license)

## Overview

![Terraform Module: AWS ACM Certificate](https://raw.githubusercontent.com/ksatirli/terraform-aws-acm-certificate/main/overview.png "Terraform Module: AWS ACM Certificate")

## Requirements

* Amazon Web Services (AWS) [Account](https://aws.amazon.com/account/)
* Terraform `1.0.x` or newer.

## Usage

Add the module to your Terraform resources like so:

```hcl
module "acm_certificate" {
  source  = "ksatirli/acm-certificate/aws"
  version = "2.0.0"

  providers = {
    # NOTE: ACM Certificates for usage with CloudFront need to be created in the `us-east-1` region, see https://amzn.to/2TW2J16
    aws.certificate = aws.us-east-1
  }

  domain_name            = var.domain_name
  alternate_domain_names = var.alternate_domain_names

  use_default_tags = true
  tags = {
    website = "https://example.com/"
  }

  route53_zone_id = "Z3P5QSUBK4POTI"
}
```

Then, fetch the module from the [Terraform Registry](https://registry.terraform.io/modules/ksatirli/acm-certificate) using `terraform get`.

Additional usage examples are available in the `examples` directory via [GitHub](https://github.com/ksatirli/terraform-aws-acm-certificate/tree/main/examples).

## Usage

<!-- BEGIN_TF_DOCS -->
### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| route53_zone_id | ID of Route 53 Zone to use for Certificate Validation | `string` | n/a | yes |
| alternate_domain_names | Alternate Domain Names for Certificate | `list` | `[]` | no |
| domain_name | Domain name for Certificate | `string` | `null` | no |
| enable_certificate_transparency_log | Toggle to enable Certificate Transparency Log | `bool` | `true` | no |
| tags | Mapping of Tags of Certificate | `map` | `{}` | no |
| use_default_tags | Toggle to enable creation of default tags for ACM Certificate, containing Terraform Workspace identifier | `bool` | `true` | no |

### Outputs

| Name | Description |
|------|-------------|
| arn | ARN of the Certificate |
| domain_name | Domain name for which the certificate is issued |
| id | ID of the Certificate |
<!-- END_TF_DOCS -->

## Author Information

This module is maintained by the contributors listed on [GitHub](https://github.com/ksatirli/terraform-aws-acm-certificate/graphs/contributors).

## License

Licensed under the Apache License, Version 2.0 (the "License").

You may obtain a copy of the License at [apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0).

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an _"AS IS"_ basis, without WARRANTIES or conditions of any kind, either express or implied.

See the License for the specific language governing permissions and limitations under the License.
