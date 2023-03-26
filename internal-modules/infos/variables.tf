
variable "region" {
    description = "The AWs region"
    type = string
    default = "us-east-1"
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

variable "environment" {
    description = "Application Environments(development, production)"
    type = string
    default = "development"
    /*validation {
      condition = contains(["dev", "int","sta","qua","uat","pre","prd","san"], var.environment)
      error_message = "Valid values are: (dev, int,sta,qua,uat,pre,prd,san)"
    default = "noprd"
    }*/
}

variable "resources" {
    description = "A list of resource values"
    type = list(string)
    default = []
}

variable "prefix_lists" {
    description = "A list of name of the prefix-list"
    type = list(string)
    default = []
}

variable "security_groups" {
    description = "A list of the name of security_groups "
    type = list(string)
    default = []
}

variable "kms_key_aliases" {
    description = "A list of the kms ket aliases "
    type = list(string)
    default = []
}

variable "network_tier_tag_value" {
    description = "A list of the network tier tag alias"
    type = list(string)
    default = ["private-non-routed"]
}
