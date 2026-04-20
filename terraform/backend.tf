terraform {
  backend "s3" {
    bucket         = "goutham469-lambda-ci-cd-with-python-tf-state"
    key            = "blog-backup/main/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "goutham469-lambda-ci-cd-with-python-tf-state"
    encrypt        = true
  }
}
