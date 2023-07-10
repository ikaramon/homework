# homework
#Homework
#Terraform configuration files to create:
# - A VPC for the x3 application servers based on Ubuntu 16.04 Servers
# - A Subnet for the application servers
# - Security Groups, to later apply to the application servers, that will enforce the following network segmentation:
#    * Allow from the workstation to the LB server on port 80
#    * Allow from the workstation to all the servers on port 22
#    * Allow any internal communication in the subnet
#    * Block everything else
# - An internet gateway and routes to allow assignment servers to access the internet.
# - Create an Ubuntu LB node, with the IP 192.168.0.11, and a public IP address.
# - Create an Ubuntu WEB node, with the IP 192.168.0.12, and a public IP address.
# - Create an Ubuntu DB node, with the IP 192.168.0.13, and a public IP address.
# - curl http://<LB-PUBLIC-IP>/Test/ from the workstation returns:
# <html>
# <head><title>RandoMongo</title></head>
# <body>
#  
#      <h2>Connecting to MongoDB Server <i>(192.168.0.13)</i>...</h2>
#  
#      <h2>Bravo!</h2>
# </body>
# </html>
