output "id" {
  value       = aws_acm_certificate.this.id
  description = "ID of the Certificate"
  depends_on = [
    aws_acm_certificate.this
  ]
}

output "arn" {
  value       = aws_acm_certificate.this.arn
  description = "ARN of the Certificate"
  depends_on = [
    aws_acm_certificate.this
  ]
}

output "domain_name" {
  value       = aws_acm_certificate.this.domain_name
  description = "Domain name for which the certificate is issued"
  depends_on = [
    aws_acm_certificate.this
  ]
}
