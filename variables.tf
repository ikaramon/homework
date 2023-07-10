# AWS connection & authentication

variable "aws_access_key" {
  type        = string
  description = "My AWS Access Key"
}

variable "aws_secret_key" {
  type        = string
  description = "My AWS Secret Key"
}

variable "aws_region" {
  type        = string
  description = "Selected AWS Region"
}

variable "app_name" {
  type        = string
  description = "homework"
}

variable "app_environment" {
  type        = string
  description = "test"
}

variable "app_type1" {
  type        = string
  description = "LB"
}

variable "app_type2" {
  type        = string
  description = "web"
}

variable "app_type3" {
  type        = string
  description = "DB"
}
