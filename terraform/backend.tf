terraform {
  backend "s3" {
    bucket         = "test-kyrylo"
    key            = "terraform/terraform.tfstate"
    region         = "us-east-1"
  }
}