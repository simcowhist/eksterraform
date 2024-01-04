terraform {
  backend "s3" {
    bucket         = "eks-tf-bknd-dev"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "eks-tf-locks-dev"
  }
}