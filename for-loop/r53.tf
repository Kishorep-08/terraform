resource "aws_route53_record" "route53_record" {
  for_each = aws_instance.terraform
  zone_id = var.zone_id
  name    = "${each.key}.${var.domain}"   #mongodb.kishore-p.space
  type    = "A"
  ttl     = 1
  records = [each.value.private_ip]
  allow_overwrite = true

}