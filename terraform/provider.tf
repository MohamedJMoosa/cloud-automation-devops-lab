provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Project   = "Cloud-Automation-DevOps-Lab"
      ManagedBy = "Terraform"
      Owner     = "Mohamed-Jaafar"
    }
  }
}