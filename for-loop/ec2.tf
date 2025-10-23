resource "aws_instance" "terraform" {
  for_each = var.instance_name
  ami           = "ami-09c813fb71547fc4f"
  instance_type = each.value
  vpc_security_group_ids = [aws_security_group.allow_all.id]
   

  tags = {
    Name = each.key
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
