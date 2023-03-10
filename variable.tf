# AWS region
variable "aws_region" {
  type = string
  default = "us-west-2"
}

# AWS instance type
variable "instance_type" {
  type = string
  default = "t2.micro"
}

# AWS key pair name
variable "key_name" {
  type = string
  default = "mykeypair"
}

# AWS AMI ID
variable "ami_id" {
  type = string
  default = "ami-005f9685cb30f234b"
}

# EBS volume size in GB
variable "volume_size" {
  type = number
  default = 1
}

# EBS volume type
variable "volume_type" {
  type = string
  default = "gp2"
}

# Elastic IP address allocation ID
variable "eip_allocation_id" {
  type = string
  default = ""
}

# CIDR blocks for HTTP ingress rule
variable "http_cidr_blocks" {
  type = list(string)
  default = ["0.0.0.0/0"]
}

# CIDR blocks for SSH ingress rule
variable "ssh_cidr_blocks" {
  type = list(string)
  default = ["0.0.0.0/0"]
}
