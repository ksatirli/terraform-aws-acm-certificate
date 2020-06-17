# Terraform Module: AWS ACM Certificate

> Terraform Module for managing AWS [ACM Certificates](https://docs.aws.amazon.com/acm/latest/userguide/acm-overview.html), using DNS-validation.

## Table of Contents

- [Terraform Module: AWS ACM Certificate](#terraform-module-aws-acm-certificate-dns-records)
  - [Table of Contents](#table-of-contents)
  - [Overview](#overview)
  - [Requirements](#requirements)
  - [Dependencies](#dependencies)
  - [Usage](#usage)
    - [Inputs](#inputs)
    - [Outputs](#outputs)
  - [Author Information](#author-information)
  - [License](#license)

## Overview

![Terraform Module: AWS ACM Certificate](https://github.com/operatehappy/terraform-aws-acm-certificate/blob/master/overview.png "Terraform Module: AWS ACM Certificate")

## Requirements

This module requires Terraform version `0.12.0` or newer.

## Dependencies

This module depends on a correctly configured [AWS Provider](https://www.terraform.io/docs/providers/aws/index.html) in your Terraform codebase.

## Usage

Add the module to your Terraform resources like so:

```hcl
module "acm_certificate" {
  source  = "operatehappy/acm-certificate/aws"
  version = "1.0.0"

  providers = {
    // NOTE: ACM Certificates for usage with CloudFront need to be created in the `us-east-1` region, see https://amzn.to/2TW2J16
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

Then, fetch the module from the [Terraform Registry](https://registry.terraform.io/modules/operatehappy/acm-certificate) using `terraform get`.

Additional usage examples are available in the `examples` directory via [GitHub](https://github.com/operatehappy/terraform-aws-acm-certificate/tree/master/examples).

### Inputs

| Name | Description | Type | Default |
|------|-------------|------|---------|
| domain_name | Domain name for Certificate | `string` | n/a |
| route53_zone_id | ID of Route 53 Zone to use for Certificate Validation | `string` | n/a |
| alternate_domain_names | Alternate Domain Names for Certificate | `list` | `[]` |
| enable_certificate_transparency_log | Toggle to enable Certificate Transparency Log | `bool` | `true` |
| tags | Mapping of Tags of Certificate | `map` | `{}` |
| use_default_tags | Toggle to enable creation of default tags for ACM Certificate, containing Terraform Workspace identifier | `bool` | `true` |

### Outputs

| Name | Description |
|------|-------------|
| arn | ARN of the Certificate |
| domain_name | Domain name for which the certificate is issued |
| id | ID of the Certificate |

## Author Information

This module is maintained by the contributors listed on [GitHub](https://github.com/operatehappy/terraform-aws-acm-certificate/graphs/contributors).

Development of this module was sponsored by [Operate Happy](https://github.com/operatehappy).

## License

Licensed under the Apache License, Version 2.0 (the "License").

You may obtain a copy of the License at [apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0).

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an _"AS IS"_ basis, without WARRANTIES or conditions of any kind, either express or implied.

See the License for the specific language governing permissions and limitations under the License.
