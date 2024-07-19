terraform {
  backend "s3" {
    bucket         = "test-kyrylo"
    key            = "terraform/terraform.tfstate" ### This Must be UNIQUE PATH
    region         = "us-east-1"
  }
}