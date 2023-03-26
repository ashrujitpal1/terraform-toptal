variable "bucket-name" {
    description = "The name of the bucket"
    type = string
    default = "tfstate-ashrujitpal-toptal"
}

variable "dynamodb-name" {
    description = "The name of the dynamotable"
    type = string
    default = "app-state"
}

variable "dynamodb-hashkey" {
    description = "The name of the dynamodb hash key"
    type = string
    default = "LockID"
}

variable "dynamodb-type" {
    description = "The name of the dynamodb type"
    type = string
    default = "S"
}

variable "read_capacity" {
    description = "The name of the dynamodb read capacity"
    type = number
    default = 1
}

variable "write_capacity" {
    description = "The name of the dynamodb write capacity"
    type = number
    default = 1
}

variable "region" {
  description = "AWS region"
  type = string
  default = "us-east-1"
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

variable "environment" {
  description = "Environment name"
  type = string
  default = "dev"
}