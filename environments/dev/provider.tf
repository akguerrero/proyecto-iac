provider "aws"{
    region = "us-east-1"
}
terraform {
  backend "s3" {
    bucket = "terraform-state-mdw"
    key    = "iac/terraform.tfstate"
    region = "us-east-1"
  }
}