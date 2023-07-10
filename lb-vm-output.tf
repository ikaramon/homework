output "vm_lb_server_instance_id" {
  value = aws_instance.lb-server.id
}

output "vm_lb_server_instance_public_dns" {
  value = aws_instance.lb-server.public_dns
}

output "vm_lb_server_instance_public_ip" {
  value = aws_instance.lb-server.public_ip
}

output "vm_lb_server_instance_private_ip" {
  value = aws_instance.lb-server.private_ip
}
