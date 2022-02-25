variable "region" {
	default = "us-east-1"
}

variable "env_name" { 
	default = "ec2"
}

#variable "ami_name" { 
#	default = "ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-20191002"
#}

variable "az" { 
	default = "us-east-1a"
}

variable "instance_count" {
	default = "1"
}

variable "instance_type" {
	default = "t2.medium"

}

variable "volume_size" {
	default = "10"
}
