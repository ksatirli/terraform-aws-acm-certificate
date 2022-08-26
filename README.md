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
* Terraform `1.1.x` or newer.

## Usage

For examples, see the [./examples](https://github.com/ksatirli/terraform-aws-acm-certificate/tree/main/examples) directory.

<!-- BEGIN_TF_DOCS -->
### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| route53_zone_id | ID of Route 53 Zone to use for Certificate Validation. | `string` | n/a | yes |
| alternate_domain_names | Alternate Domain Names for Certificate | `list(string)` | `[]` | no |
| domain_name | Domain name for Certificate | `string` | `null` | no |
| enable_certificate_transparency_log | Toggle to enable Certificate Transparency Log. | `bool` | `true` | no |
| tags | Mapping of Tags of Certificate | `map(string)` | `{}` | no |

### Outputs

| Name | Description |
|------|-------------|
| aws_acm_certificate | Exported Attributes for `aws_acm_certificate.main`. |
| aws_acm_certificate_validation | Exported Attributes for `aws_acm_certificate_validation.main`. |
| aws_route53_record | Exported Attributes for `aws_route53_record.main`. |
<!-- END_TF_DOCS -->

## Author Information

This module is maintained by the contributors listed on [GitHub](https://github.com/ksatirli/terraform-aws-acm-certificate/graphs/contributors).

## License

Licensed under the Apache License, Version 2.0 (the "License").

You may obtain a copy of the License at [apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0).

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an _"AS IS"_ basis, without WARRANTIES or conditions of any kind, either express or implied.

See the License for the specific language governing permissions and limitations under the License.
