# see https://www.terraform.io/language/modules/develop/refactoring#moved-block-syntax

moved {
  from = aws_acm_certificate.this
  to   = aws_acm_certificate.main
}

moved {
  from = aws_route53_record.this
  to   = aws_route53_record.main
}

moved {
  from = aws_acm_certificate_validation.this
  to   = aws_acm_certificate_validation.main
}
