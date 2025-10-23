resource "aws_instance" "first_resource" {
  ami           = "ami-09c813fb71547fc4f"
  instance_type = local.instance_type
  vpc_security_group_ids = [aws_security_group.allow_all.id]
   

  tags = local.ec2_tags
    
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
        Name = "${local.common_name}-my_sg"
    }
}
