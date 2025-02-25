output "vpcid" {
  value = aws_vpc.durgadev
}
output "publicip" {
  value = aws_instance.publicinstace.public_ip
}