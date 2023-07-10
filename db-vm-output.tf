output "vm_db_server_instance_id" {
  value = aws_instance.db-server.id
}

output "vm_db_server_instance_public_dns" {
  value = aws_instance.db-server.public_dns
}

output "vm_db_server_instance_public_ip" {
  value = aws_instance.db-server.public_ip
}

output "vm_db_server_instance_private_ip" {
  value = aws_instance.db-server.private_ip
}
