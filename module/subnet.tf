resource "aws_subnet" "subnet" {
  cidr_block = "${cidrsubnet(aws_vpc.test-env.cidr_block, 3, 1)}"
  vpc_id = "${aws_vpc.test-env.id}"
  availability_zone = "${var.az}"
}

resource "aws_route_table" "route_table" {
  vpc_id = "${aws_vpc.test-env.id}"
route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.igw.id}"
  }
}

resource "aws_route_table_association" "subnet-association" {
  subnet_id      = "${aws_subnet.subnet.id}"
  route_table_id = "${aws_route_table.route_table.id}"
}
