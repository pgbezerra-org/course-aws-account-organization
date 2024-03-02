output "zones" {
  value = {
    zone_name = aws_route53_zone.test-my-zone.name
    zone_id   = aws_route53_zone.test-my-zone.id
  }
}
