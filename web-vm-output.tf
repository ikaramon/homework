output "vm_linux_server_instance_id" {
  value = aws_instance.web-server.id
}

output "vm_linux_server_instance_public_dns" {
  value = aws_instance.web-server.public_dns
}

output "vm_linux_server_instance_public_ip" {
  value = aws_instance.web-server.public_ip
}

output "vm_linux_server_instance_private_ip" {
  value = aws_instance.web-server.private_ip
}
