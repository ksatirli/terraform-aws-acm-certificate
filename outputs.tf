output "id" {
  value       = aws_acm_certificate.certificate.id
  description = "ID of the Certificate"
  depends_on = [
    aws_acm_certificate.certificate
  ]
}

output "arn" {
  value       = aws_acm_certificate.certificate.arn
  description = "ARN of the Certificate"
  depends_on = [
    aws_acm_certificate.certificate
  ]
}

output "domain_name" {
  value       = aws_acm_certificate.certificate.domain_name
  description = "Domain name for which the certificate is issued"
  depends_on = [
    aws_acm_certificate.certificate
  ]
}
