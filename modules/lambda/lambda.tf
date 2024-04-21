resource "aws_lambda_function" "lambda_python" {

  filename      = var.filename
  description   = var.description
  function_name = var.function_name
  role          = var.role
  handler       = var.handler
  runtime       = var.runtime
  timeout       = var.timeout

  vpc_config {
    subnet_ids         = [""]
    security_group_ids = [""]
  }

  environment {
    variables = {}
  }

}

resource "aws_lambda_permission" "lambda_permission" {
  statement_id_prefix =var.function_name
  action        = "lambda:InvokeFunction"
  function_name = var.function_name
  principal     = "apigateway.amazonaws.com"
}