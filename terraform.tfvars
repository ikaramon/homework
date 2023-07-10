# Application Definition 
app_name        = "homework" # Name
app_environment = "test"     #

app_type1 = "lb"
app_type2 = "web"
app_type3 = "db"

# Network
vpc_cidr           = "192.168.0.0/16"
public_subnet_cidr = "192.168.0.0/24"

# AWS Settings
aws_access_key = "*******removed******"
aws_secret_key = "*******removed******"
aws_region     = "us-east-2"

# Linux Virtual Machine
linux_instance_type               = "t2.micro"
linux_associate_public_ip_address = true
linux_root_volume_size            = 20
linux_root_volume_type            = "gp2"
linux_data_volume_size            = 10
linux_data_volume_type            = "gp2"
