variable "volume_size" {
    description = "Size of the root EBS volume in GB"
    default = "50"
}

variable "vpc_id" {
    description = "The ID of the VPC where the resources will be created"
    type        = string
    default = "vpc-0ed35976870464f0d"
}