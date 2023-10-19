# data "aws_ami" "ubuntu" {
#   most_recent = true
#   owners      = ["099720109477"]  # Canonical's AWS account ID, which owns the official Ubuntu AMIs.

#   filter {
#     name   = "name"
#     values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
#   }

#   filter {
#     name   = "virtualization-type"
#     values = ["hvm"]
#   }

# }

# resource "aws_key_pair" "stage_keypair" {
#   key_name   = "stage_keypair"
#   # public_key = file("./key/stage.pub")  # Path to your public key file
#   public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDNxKDmD98VN6dHMFRAZtt1o4/i3Il+wjpdFwo2FAiual6ArnvnmNt6el/Nx+Q+IiGkCuHUHruqk8x60O+3Q3h1FbJ7POeSA2dR9FRHpiEV1PfpbT+UNwXIyOfroGaIDx3l3pLywPTGrAIJ/OoDvHlgxP2YRi4kiypWOLvgUIQye/9mW8OUy+TQZVF9ytV7kd/El8Hd7+666cAKch4+w3a+SvAB64OlA7gMsdSPVKGQQGfP+x3fiHd/gNRnYQjx+0HoV+8jViX878M+iNTIcO88pzNlvvf9Uo8jYo7ddnrcgVuSCax7GNZNhg4W8/khKB5kyDI1MRO/epP5rXeCOp6hEf555mxdzVpbmKyqimzIQ5xhFjOt71kcPYGSRi8eV2JnQ/7PBMlWgEJ17ppJymI5TVDap4AEUS+me82nYheeoKRUjOLKYatql98wa0wzuD1awv+9/XyWTY6TwYDhkjqkSKMWYsrILnEWKs4chtq+2cm8D1Gypc1jQII2Y/VUB3k= mind@dhrumil"
# }


# resource "aws_instance" "my_ec2" {
#   ami                = data.aws_ami.ubuntu.id
#   instance_type      = "t3.micro"
#   key_name = aws_key_pair.stage_keypair.id
#   vpc_security_group_ids = [aws_security_group.instance.id]

#   tags = {
#     Name = "stage_server"
#   }
# #   user_data = <<-EOF
# #               #!/bin/bash
# #               cat <<EOF2 >> /home/ubuntu/.ssh/known_hosts
# #               $(cat /home/mind/.ssh/id_rsa.pub)
# #               EOF2
# #               EOF
#  }

# resource "aws_eip" "stage_ip" {
#   instance = aws_instance.my_ec2.id
#   tags = {
#     Name = "stage_elastic_ip"
#   }
# }