# AWS AZ
variable "aws_az" {
  type        = string
  description = "Available zones"
  default     = "us-east-2a"
}

# VPC Variables
variable "vpc_cidr" {
  type        = string
  description = "CIDR for the VPC"
  default     = "192.168.0.0/16"
}

# Subnet Variables
variable "public_subnet_cidr" {
  type        = string
  description = "CIDR for the public subnet"
  default     = "192.168.0.0/24"
}
