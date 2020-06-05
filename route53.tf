data "aws_route53_zone" "domain" {
  count   = var.zone_id != "" ? 1 : 0
  zone_id = var.zone_id
}

module "dns" {
  enabled = var.zone_id != "" ? true : false
  source  = "git::https://github.com/cloudposse/terraform-aws-route53-cluster-hostname.git?ref=tags/0.3.0"
  name    = "${module.label.name}.${module.label.environment}"
  zone_id = var.zone_id
  ttl     = 60
  records = [aws_instance.default.public_dns]
  type    = "CNAME"
}
