resource "aws_instance" "frontend" {
  ami = "ami-0e0178ba28f354630"
  instance_type = "t3.micro"
  vpc_security_group_ids = ["sg-0d31fd470147fa975"]
  tags = {
    Name = "frontend"
  }
}
resource "aws_route53_record" "frontend" {
  zone_id = "Z00129572MXCH2UU7XB14"
  name    = "frontend-dev"
  type    = "A"
  ttl     = 30
  records = [aws_instance.frontend.private_ip]
}

resource "aws_instance" "backend" {
  ami = "ami-0e0178ba28f354630"
  instance_type = "t3.micro"
  vpc_security_group_ids = ["sg-0d31fd470147fa975"]
  tags = {
    Name = "backend"
  }
}

resource "aws_route53_record" "backend" {
  zone_id = "Z00129572MXCH2UU7XB14"
  name    = "backend-dev"
  type    = "A"
  ttl     = 30
  records = [aws_instance.backend.private_ip]
}


resource "aws_instance" "mysql" {
  ami = "ami-0e0178ba28f354630"
  instance_type = "t3.micro"
  vpc_security_group_ids = ["sg-0d31fd470147fa975"]
  tags = {
    Name = "mysql"
  }
}

resource "aws_route53_record" "mysql" {
  zone_id = "Z00129572MXCH2UU7XB14"
  name    = "mysql-dev"
  type    = "A"
  ttl     = 30
  records = [aws_instance.mysql.private_ip]
}

