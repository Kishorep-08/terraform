resource "aws_instance" "devops_ec2" {
    ami = local.ami_id
    instance_type = "t3.micro"
    vpc_security_group_ids = [aws_security_group.devops_sg.id]
    tags = {
        Name = "devops-handson"
        Purpose = "devops-practice"
    }
    subnet_id = aws_subnet.public.id

    user_data = file("user_data.sh")

    root_block_device {
    volume_size = var.volume_size     # GB
    volume_type = "gp3"
    encrypted   = true
  }
}

resource "aws_subnet" "public" {
  vpc_id                  = var.vpc_id
  cidr_block              = "172.31.2.0/24"
  map_public_ip_on_launch = true
}


resource "aws_security_group" "devops_sg" {
    name = "devops-allow-all"

        egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
    }

    ingress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
    }

    tags = {
        name = "devops-allow-all"
        purpose = "devops-practice"
    }

}