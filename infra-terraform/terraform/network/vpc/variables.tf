variable "region" {
    description = "The AWS region"
    type = string
    default = "us-east-1"
}

variable "environment" {
    description = "The environment where to be created"
    type = string
    default = "dev"
}


variable "cidr_vpc" {
    description = "The cidr range for the VPC"
    type = string
    default = "10.0.0.0/16"
}

variable "private_subnets" {
    description = "The cidr range for the private subnet"
    type = list(string)
    default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "public_subnets" {
    description = "The cidr range for the public subnet"
    type = list(string)
    default = ["10.0.11.0/24", "10.0.12.0/24", "10.0.13.0/24"]
}

variable "database_subnets" {
    description = "The cidr range for the database subnet"
    type = list(string)
    default = ["10.0.21.0/24", "10.0.22.0/24", "10.0.23.0/24"]
}

variable "profile" {
  description = "AWS Profile Name"
  type = string
  default = "development"
}

variable "appenv" {
  description = "Environment name"
  type = string
  default = "development"
}
