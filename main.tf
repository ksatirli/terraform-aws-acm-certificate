resource "aws_acm_certificate" "this" {
  domain_name               = var.domain_name
  subject_alternative_names = var.alternate_domain_names
  validation_method         = "DNS"

  tags = local.merged_tags

  options {
    certificate_transparency_logging_preference = var.enable_certificate_transparency_log ? "ENABLED" : "DISABLED"
  }
}

resource "aws_route53_record" "this" {
  for_each = {
    for certificate in aws_acm_certificate.this.domain_validation_options : certificate.domain_name => {
      name   = certificate.resource_record_name
      record = certificate.resource_record_value
      type   = certificate.resource_record_type
    }
  }

  allow_overwrite = true // NOTE: this is required for Certificate Validation
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = var.route53_zone_id

  depends_on = [
    aws_acm_certificate.this
  ]
}

resource "aws_acm_certificate_validation" "this" {
  certificate_arn         = aws_acm_certificate.this.arn
  validation_record_fqdns = [for record in aws_route53_record.this : record.fqdn]

  timeouts {
    create = "60m"
  }
}
