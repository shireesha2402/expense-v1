resource "aws_instance" "frontend" {
  ami = var.ami
  instance_type = var.instance_type
  vpc_security_group_ids = var.sg_id
  tags = {
    Name = "frontend-${var.env}"
  }
}
resource "aws_route53_record" "frontend" {
  zone_id = var.zone_id
  name    = "frontend-${var.env}"
  type    = "A"
  ttl     = 30
  records = [aws_instance.frontend.private_ip]
}

resource "aws_instance" "backend" {
  ami = var.ami
  instance_type = var.instance_type
  vpc_security_group_ids = var.sg_id
  tags = {
    Name = "backend-${var.env}"
  }
}

resource "aws_route53_record" "backend" {
  zone_id = var.zone_id
  name    = "backend-${var.env}"
  type    = "A"
  ttl     = 30
  records = [aws_instance.backend.private_ip]
}


resource "aws_instance" "mysql" {
  ami = var.ami
  instance_type = var.instance_type
  vpc_security_group_ids = var.sg_id
  tags = {
    Name = "mysql-${var.env}"
  }
}

resource "aws_route53_record" "mysql" {
  zone_id = var.zone_id
  name    = "mysql-${var.env}"
  type    = "A"
  ttl     = 30
  records = [aws_instance.mysql.private_ip]
}

