provider "aws" {
  region = var.region
}


resource "aws_lambda_function" "lambda-python-ci-cd-pipeline" {
  function_name = "${var.project-name}-function"
  role          = aws_iam_role.lambda_role.arn
  handler       = "app.handler"
  runtime       = "python3.14"

  filename         = data.archive_file.lambda_function.output_path
  source_code_hash = data.archive_file.lambda_function.output_base64sha256
}

resource "aws_iam_role" "lambda_role" {
  name = "${var.project-name}-lambda-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_policy_attachment" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

data "archive_file" "lambda_function" {
  type        = "zip"
  source_dir  = "${path.root}../lambda"
  output_path = "${path.root}/lambda_function.zip"
}

output "lambda_function_arn" {
  value = aws_lambda_function.lambda-python-ci-cd-pipeline.arn
}