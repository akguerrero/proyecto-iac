#--------------------------------------------------------------
# Este modulo crea los recursos necesarios para crear Lambda
# Lambda python
#--------------------------------------------------------------

resource "aws_lambda_function" "lambda_python" {
  # If the file is not in the current working directory you will need to include a
  # path.module in the filename.
  filename      = var.filename
  description   = var.description
  function_name = var.function_name
  role          = var.role
  handler       = var.handler
  runtime       = var.runtime
  timeout       = var.timeout

 #source_code_hash = data.archive_file.lambda.output_base64sha256

  vpc_config {
    subnet_ids         = ""
    security_group_ids = ""
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

  # La parte /*/*/* permite la invocación desde cualquier etapa, método y ruta de recurso
  # dentro de API Gateway REST API.
  #source_arn = "arn:aws:execute-api:us-east-1:*:*/*/*/*"
}