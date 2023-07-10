# Create Elastic IP for the EC2 instance
resource "aws_eip" "lb-eip" {
  vpc = true
  tags = {
    Name        = "${lower(var.app_name)}-${var.app_environment}-lb-eip"
    Environment = var.app_environment
  }
}

# Generates a secure private key and encodes it as PEM
resource "tls_private_key" "key_pair_lb" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Create the Key Pair
resource "aws_key_pair" "key_pair_lb" {
  key_name   = "${lower(var.app_name)}-${lower(var.app_environment)}-${lower(var.app_type1)}-${lower(var.aws_region)}"
  public_key = tls_private_key.key_pair_lb.public_key_openssh
}

# Save file
resource "local_file" "ssh_key_lb" {
  filename = "${aws_key_pair.key_pair_lb.key_name}.pem"
  content  = tls_private_key.key_pair_lb.private_key_pem
}

# Create EC2 Instance
resource "aws_instance" "lb-server" {
  ami                         = data.aws_ami.ubuntu-linux-1604.id
  instance_type               = var.linux_instance_type
  subnet_id                   = aws_subnet.public-subnet.id
  vpc_security_group_ids      = [aws_security_group.aws-lb-sg.id]
  associate_public_ip_address = true
  private_ip                  = "192.168.0.11"
  source_dest_check           = false
  key_name                    = aws_key_pair.key_pair_lb.key_name

  # root disk
  root_block_device {
    volume_size           = var.linux_root_volume_size
    volume_type           = var.linux_root_volume_type
    delete_on_termination = true
    encrypted             = true
  }

  # extra disk
  ebs_block_device {
    device_name           = "/dev/xvda"
    volume_size           = var.linux_data_volume_size
    volume_type           = var.linux_data_volume_type
    encrypted             = true
    delete_on_termination = true
  }

  tags = {
    Name        = "${lower(var.app_name)}-${var.app_environment}-lb-server"
    Environment = var.app_environment
  }
}

# Associate Elastic IP to Linux Server
resource "aws_eip_association" "lb-eip-association" {
  instance_id   = aws_instance.lb-server.id
  allocation_id = aws_eip.lb-eip.id
}

# Define the security group for the Linux server
resource "aws_security_group" "aws-lb-sg" {
  name        = "${lower(var.app_name)}-${var.app_environment}-lb-sg"
  description = "Allow incoming connections"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["16.171.148.57/32"]
    description = "Allow incoming HTTP connections from MGMT IP"
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["16.171.148.57/32"]
    description = "Allow incoming SSH connections from MGMT IP"
  }

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "all"
    cidr_blocks = ["192.168.0.0/24"]
    description = "Allow all traffic from assigned VPC subnet"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${lower(var.app_name)}-${var.app_environment}-lb-sg"
    Environment = var.app_environment
  }
}
