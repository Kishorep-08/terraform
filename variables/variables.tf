variable "ami_id" {
    type = string
    default = "ami-09c813fb71547fc4f"
}

variable "instance_type" {
    type = string
    default = "t3.micro"
}

variable "tags" {
    type = map
    default = {
        Name = "terraform_test"
        Environment = "dev"
        Language = "HCL"
    }
}

variable "sg_name" {
    type = string
    default = "my_sg"   
}

variable "cidr" {
    type = list
    default = ["0.0.0.0/0"]
}

variable "egress_to_port" {
    default = 0
}

variable "egress_from_port" {
    default = 0
}

variable "ingress_to_port" {
    default = 0
}

variable "ingress_from_port" {
    default = 0
}

variable "protocol" {
    default = "-1"
}