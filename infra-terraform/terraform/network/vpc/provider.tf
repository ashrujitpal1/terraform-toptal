provider "aws" {
  region = var.region
  #profile = "default"

  default_tags {
    tags = module.naming.global_tags_map
  }
}

terraform{
    required_version = ">= 1.0.11"

    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = ">= 3.74.2"
        }
    }

    backend "s3" {  
      region = "us-east-1"  
      encrypt = true
    }
  }