provider "aws" {
  region = "eu-west-1"
  version = "~> 4.10.0"
  default_tags {
    tags = {
      Environment     = var.env
      ManagedBy       = var.managed_by
      Project         = var.project
    }
  }
}
