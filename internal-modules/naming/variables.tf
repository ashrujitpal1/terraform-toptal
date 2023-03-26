variable "AppName" {
    description = "The application name"
    type = string
    default = "ecommerce"
}

variable "Company" {
    description = "Company label"
    type = string
    default = "XXXX"
}

variable "AppEnv" {
    description = "Application Environments(noprd, prd)"
    type = string
    /*validation {
      condition = contains(["noprd", "prd"], var.AppEnv)
      error_message = "Valid values are: (noprd, prd)"
    }*/
    default = "noprd"
}

variable "Project" {
    description = "Project label"
    type = string
    default = "eCommerce"
}

variable "AwsId" {
  description = "AWSId project"
  type = string
  default = "676$35456465"
}


variable "environment" {
    description = "Environments(dev, int,sta,qua,uat,pre,prd,san)"
    type = string
    /*validation {
      condition = contains(["dev", "int","sta","qua","uat","pre","prd","san"], var.environment)
      error_message = "Valid values are: (dev, int,sta,qua,uat,pre,prd,san)"
    }*/
    default = "dev"
}

variable "appcode" {
    description = "Application code common for all the resources"
    type = string
    default = "XXXXXXXX"
}

variable "msp" {
    description = "msp common for all resources"
    type = string
    default = "eCommerce"
}