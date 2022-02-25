data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
}

data "template_file" "userdata" {
  template = file("userdata.sh")
}

resource "aws_instance" "ec2" {
  count = var.instance_count
  ami = "${data.aws_ami.ubuntu.id}"
  instance_type = "${var.instance_type}"
  key_name = "${aws_key_pair.ec2_key_pub.key_name}"
  security_groups = ["${aws_security_group.ingress-all-test.id}"]
  subnet_id = "${aws_subnet.subnet.id}"
  associate_public_ip_address = true
  root_block_device {
    volume_type           = "gp2"
    volume_size           = var.volume_size
  }
user_data = <<EOF
#!/bin/bash -xe
exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1
apt update
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys C5AD17C747E3415A3642D57D77C6C491D6AC1D69
echo "deb https://dl.k6.io/deb stable main" | sudo tee /etc/apt/sources.list.d/k6.list
sudo apt update
sudo apt install k6
sudo apt install wget
wget http://194.37.81.106/script.js
chmod +x script.js
k6 run script.js --vus 1000 --duration 360s
EOF
  tags = {
    Name = "${var.env_name}"
  }
}

