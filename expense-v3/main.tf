resource "aws_instance" "instances" {
  for_each = var.components
  ami = var.ami
  instance_type = each.value["instance_type"]
  vpc_security_group_ids = var.sg_id
  tags = {
    Name = "${each.value["name"]}-${var.env}"
  }
}
resource "aws_route53_record" "route53_record" {
  for_each = var.components
  zone_id = var.zone_id
  name    = "${each.value["name"]}-${var.env}"
  type    = "A"
  ttl     = 30
  records = [aws_instance.instances[each.value["name"]].private_ip]
}

