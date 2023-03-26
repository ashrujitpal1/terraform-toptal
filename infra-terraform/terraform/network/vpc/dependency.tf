module "naming" {
    #source = "../../../../internal-modules/naming"
    source = "git::http://ashrujit-gitlab.com/terraform-iac/internal_modules/naming.git?ref=tags/v1.3"
    AppEnv = var.appenv
    environment = var.environment
}

module "infos" {
    #source = "../../../../internal-modules/infos"
    source = "git::http://ashrujit-gitlab.com/terraform-iac/internal_modules/infos.git?ref=tags/v1.5"
    AppEnv = var.appenv
    environment = var.environment

}