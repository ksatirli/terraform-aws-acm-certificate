variable "domain_name" {
  type        = string
  description = "Domain name for Certificate"
  default     = null
}

variable "alternate_domain_names" {
  type        = list
  description = "Alternate Domain Names for Certificate"
  default     = []
}

variable "use_default_tags" {
  type        = bool
  description = "Toggle to enable creation of default tags for ACM Certificate, containing Terraform Workspace identifier"
  default     = true
}

variable "tags" {
  type        = map
  description = "Mapping of Tags of Certificate"
  default     = {}
}

variable "enable_certificate_transparency_log" {
  type        = bool
  description = "Toggle to enable Certificate Transparency Log"
  default     = true
}

variable "route53_zone_id" {
  type        = string
  description = "ID of Route 53 Zone to use for Certificate Validation"
}

locals {
  default_tags = {
    TerraformManaged   = true
    TerraformWorkspace = terraform.workspace
  }

  // if `use_default_tags` is set to `true`, merge `tags` with `default_tags`
  // otherwise, use user-supplied `tags` mapping
  merged_tags = var.use_default_tags ? merge(var.tags, local.default_tags) : var.tags
}
