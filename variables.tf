variable "domain_name" {
  type        = string
  description = "Domain name for Certificate"
  default     = null
}

variable "alternate_domain_names" {
  type        = list(string)
  description = "Alternate Domain Names for Certificate"
  default     = []
}

variable "tags" {
  type        = map(string)
  description = "Mapping of Tags of Certificate"
  default     = {}
}

variable "enable_certificate_transparency_log" {
  type        = bool
  description = "Toggle to enable Certificate Transparency Log."
  default     = true
}

variable "route53_zone_id" {
  type        = string
  description = "ID of Route 53 Zone to use for Certificate Validation."
}
