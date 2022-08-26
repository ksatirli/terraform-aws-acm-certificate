# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_zone
resource "aws_route53_zone" "example" {
  # AWS reserves `domain.com` and the commonly-known alternative TLDs
  # `.example` is considered a safe space according to RFC 2606.
  name = "domain.example"
}

module "acm_certificate" {
  source = "../.."

  providers = {
    # NOTE: ACM Certificates for usage with CloudFront need to be created in the `us-east-1` region, see https://amzn.to/2TW2J16
    aws.certificate = aws.us-east-1
  }

  domain_name = aws_route53_zone.example.name

  alternate_domain_names = [
    "www.${aws_route53_zone.example.name}",
  ]

  route53_zone_id = aws_route53_zone.example.id
}
