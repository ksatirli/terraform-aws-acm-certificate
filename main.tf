# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate
resource "aws_acm_certificate" "main" {
  domain_name               = var.domain_name
  subject_alternative_names = var.alternate_domain_names
  validation_method         = "DNS"
  tags                      = var.tags

  options {
    certificate_transparency_logging_preference = var.enable_certificate_transparency_log ? "ENABLED" : "DISABLED"
  }

  # see https://www.terraform.io/language/meta-arguments/lifecycle
  lifecycle {
    create_before_destroy = true
  }
}

# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record
resource "aws_route53_record" "main" {
  for_each = {
    for certificate in aws_acm_certificate.main.domain_validation_options : certificate.domain_name => {
      name   = certificate.resource_record_name
      record = certificate.resource_record_value
      type   = certificate.resource_record_type
    }
  }

  # this is required for Certificate Validation
  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = var.route53_zone_id

  #  depends_on = [
  #    aws_acm_certificate.main
  #  ]
}

# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate_validation
resource "aws_acm_certificate_validation" "main" {
  certificate_arn         = aws_acm_certificate.main.arn
  validation_record_fqdns = [for record in aws_route53_record.main : record.fqdn]

  timeouts {
    create = "60m"
  }
}
