# 인증서 생성
# weplat 도메인을 생성했고, weplat 도메인 인증
# 도메인 인증서 소유자 확인
# email 방법이 있고, domain으로 하는 방법이 있다. 여기서는 domain으로 한다.
resource "aws_acm_certificate" "cert" {
    domain_name       = "*.weplat.site"
    validation_method = "DNS"

    tags = {
        Name = "awesome-cert"
    }
    # 이미 만들어져 있으면, 새로 만들기전에 destroy 한 후 생성한다.
    lifecycle {
        create_before_destroy = true
    }
}

# 인증서 검증
resource "aws_route53_record" "route53_ssl" {
  for_each = {
    for dvo in aws_acm_certificate.cert.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = aws_route53_zone.route53.zone_id
}