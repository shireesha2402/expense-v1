env = "dev"
ami = "ami-0e0178ba28f354630"
sg_id = ["sg-0d31fd470147fa975"]
zone_id = "Z00129572MXCH2UU7XB14"
components = {
  frontend = {
    name = "frontend"
    instance_type="t3.micro"
  }
  backend = {
    name = "backend"
    instance_type="t3.micro"
  }
  mysql = {
    name = "mysql"
    instance_type="t3.micro"
  }
}
