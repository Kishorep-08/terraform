resource "aws_instance" "terraform" {
  ami           = data.aws_ami.devops_ami.id
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow_all.id]
  tags = {
    Name = "terraform"
    Terraform = "true"
    Language = "HCL"
  }

}

resource "aws_security_group" "allow_all" {
  name   = "my_sg"

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
        Name = "my_sg"
    }
}
