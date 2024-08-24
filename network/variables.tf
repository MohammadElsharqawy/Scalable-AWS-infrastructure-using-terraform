variable cidr {
  type        = string
  default     = "10.0.0.0/16"
  description = "description"
}

variable public_subnet1_cidr{
    type = string
    default     = "10.0.0.0/24"

}

variable public_subnet2_cidr{
    type = string
    default     = "10.0.0.0/24"

}

variable private_subnet1_cidr{
    type = string
    default     = "10.0.0.0/24"

}

variable private_subnet2_cidr{
    type = string
    default     = "10.0.0.0/24"

}

variable region {
  type = string
}

