output "lambda_invoke_arn" {
  value = aws_lambda_function.lambda_python.invoke_arn
}