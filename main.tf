
# Create a security group to allow incoming HTTP and SSH traffic. For the SSH ingress we can limit it to my IP instead of having it exposed to the internet
resource "aws_security_group" "webvm" {
  name_prefix = "webvm_sg_"
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = var.http_cidr_blocks
  }
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = var.http_cidr_blocks
  }
}

# Create an elastic IP address to associate with the instance
resource "aws_eip" "webvm" {
  instance = aws_instance.webvm.id
}

# Create an EC2 instance with an attached 1GB EBS volume and provision it
resource "aws_instance" "webvm" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  # Attach the 1GB EBS volume and create a single partition with a filesystem
  ebs_block_device {
    device_name = "/dev/sdf"
    volume_size = 1
    volume_type = var.volume_type
  }
  provisioner "remote-exec" {
    inline = [
      "sudo mkfs.ext4 /dev/sdf1",
      "sudo mkdir /mnt/data",
      "sudo mount /dev/sdf1 /mnt/data",
      "sudo echo 'Hello GR World' > /mnt/data/index.html"
    ]
  }

  # Automatically mount the attached volume upon reboot
  user_data = <<-EOF
              #!/bin/bash
              echo '/dev/sdf1  /mnt/data  ext4  defaults  0  0' >> /etc/fstab
              EOF

  # Associate the instance with the security group and elastic IP
  vpc_security_group_ids = [aws_security_group.webvm.id]
  associate_public_ip_address = true
  network_interface {
    device_index = 0
    network_interface_id = aws_network_interface.webvm.id
  }
}

# Create a network interface to associate with the instance
resource "aws_network_interface" "webvm" {
  subnet_id = "subnet-0123456789abcdef0"
}

