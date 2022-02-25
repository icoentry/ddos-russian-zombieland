resource "aws_security_group" "ingress-all-test" {
  name = "terraform-22-80-443"
  vpc_id = "${aws_vpc.test-env.id}"

  ingress {
      cidr_blocks = [
        "0.0.0.0/0"
      ]
      from_port = 22
      to_port = 22
      protocol = "tcp"
    }

  ingress {
      cidr_blocks = [
        "0.0.0.0/0"
      ]
      from_port = 80
      to_port = 80
      protocol = "tcp"
    }
  

  ingress {
      cidr_blocks = [
        "0.0.0.0/0"
      ]
      from_port = 443
      to_port = 443
      protocol = "tcp"
    }
  
  egress {
     from_port = 0
     to_port = 0
     protocol = "-1"
     cidr_blocks = ["0.0.0.0/0"]
   }
}
