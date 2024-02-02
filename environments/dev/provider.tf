provider "aws"{
    region = "us-east-1"
}
terraform {
  backend "s3" {
    bucket = "tb-onboarding-web-iac-state-dev"
    key    = "lambda/terraform.tfstate"
    region = "us-east-1"
  }
}