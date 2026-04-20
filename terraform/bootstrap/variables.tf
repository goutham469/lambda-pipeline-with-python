variable "region" {
  type    = string
  default = "ap-south-1"
}

variable "project_name" {
  type    = string
  default = "lambda-ci-cd-with-python"
}

variable "state_bucket_name" {
  type = string
  # must be globally unique
  default = "goutham469-lambda-ci-cd-with-python-tf-state"
}


variable "lock_table_name" {
  type    = string
  default = "goutham469-lambda-ci-cd-with-python-tf-state"
}
