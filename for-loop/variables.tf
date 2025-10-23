variable "instance_name" {
    # default = ["mongodb", "mysql", "redis", "rabbitmq", "catalogue"]
    default = {
        mongodb = "t3.micro"
        redis = "t3.micro"
        mysql = "t3.small"
        rabbitmq = "t3.small"
    }
}

variable "zone_id" {
    default = "Z10420318WCX06C8HN1Q"
}

variable "domain" {
    default = "kishore-p.space"
}