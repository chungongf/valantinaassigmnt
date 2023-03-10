# Output the public IP address of the instance
output "public_ip" {
  value = aws_eip.webvm.public_ip
}