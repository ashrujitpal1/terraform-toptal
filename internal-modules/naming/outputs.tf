locals {
  labels_per_env = {
     noprd = {
        SupportContact = "xxx@yyy.com",
        TeamContact = "aaa@bbb.com"
     },
     prd = {
        SupportContact = "xxx@yyy.com",
        TeamContact = "aaa@bbb.com"    
     }   
  }

    soft_instance_id_per_env = {
        dev = "AAAAAA"
        uat = "BBBBBB"
        pre = "CCCCCC"
        prd = "DDDDDD"
    }
}  

output "global_tags" {
  description = "a map of strings containing all official tags for XXX compliance"
  value = {
    AppName         =  var.AppName
    Company         =  var.Company
    SupportContact  = lookup(local.labels_per_env[var.AppEnv], "SupportContact") 
    AwsEnv          = upper(var.environment)
    app-code        = var.appcode
    Terraform       = true
    Project         = var.Project
    AwsId           = var.AwsId
    TeamContact     = lookup(local.labels_per_env[var.AppEnv], "TeamContact")
    Environment     = var.environment
    msp             = var.msp
  }
}

output "global_tags_map" {
  description = "a map of strings containing all official tags for XXX compliance"
  value = {
    AppName         =  var.AppName
    Company         =  var.Company
    SupportContact  = lookup(local.labels_per_env[var.AppEnv], "SupportContact") 
    AwsEnv          = upper(var.environment)
    app-code        = var.appcode
    Terraform       = true
    Project         = var.Project
    #AwsId           = var.AwsId
    TeamContact     = lookup(local.labels_per_env[var.AppEnv], "TeamContact")
    Environment     = var.environment
    map-migrated    = "d-server-46875645"
    msp             = var.msp
  }
}

output "global_tags_dba" {
  description = "a map of strings containing all official tags for XXX compliance"
  value = {
    AppName          =  var.AppName
    Company          =  var.Company
    SupportContact   = lookup(local.labels_per_env[var.AppEnv], "SupportContact") 
    AwsEnv           = upper(var.environment)
    app-code         = var.appcode
    Terraform        = true
    Project          = var.Project
    AwsId            = var.AwsId
    TeamContact      = lookup(local.labels_per_env[var.AppEnv], "TeamContact")
    Environment      = var.environment
    map-migrated     = "d-server-46875645"
    msp              = var.msp
    soft-instance-id = try(local.soft_instance_id_per_env[var.environment], "AAAAAAA")
  }
}

output "naming_pattern" {
  description = "return the naming pattern"
  value       = "${var.Project}-%s-%s"
}

output "pattern" {
  description = "return the naming pattern"
  value       = "${var.Project}-${var.AppEnv}-${var.environment}-%s-%s"
}

