provider "aws" {
  region = var.region
}


resource "aws_lambda_function" "lambda-python-ci-cd-pipeline" {
  function_name = "${var.project-name}-function"
  role          = aws_iam_role.lambda_role.arn
  handler       = "handler.lambda_handler"
  runtime       = "python3.11"

  filename         = "${path.module}/../lambda.zip"
  source_code_hash = filebase64sha256("${path.module}/../lambda.zip")
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


output "lambda_function_arn" {
  value = aws_lambda_function.lambda-python-ci-cd-pipeline.arn
}

output "lambda_function_invocation_url" {
  value = aws_lambda_function.lambda-python-ci-cd-pipeline.invoke_arn
}