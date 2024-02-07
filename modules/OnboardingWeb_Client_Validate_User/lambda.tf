#--------------------------------------------------------------
# Este modulo crea los recursos necesarios para crear Lambda
# Lambda python
#--------------------------------------------------------------

data "aws_iam_role" "data_role_lambda" {
  name = "Rol_lambda_${var.Nameproject}_${var.Environment}"
}

resource "aws_lambda_function" "lambda_python" {
  # If the file is not in the current working directory you will need to include a
  # path.module in the filename.
  filename      = var.filename
  description   = var.description
  function_name = var.function_name
  role          = data.aws_iam_role.data_role_lambda.arn
  handler       = var.handler
  runtime       = var.runtime
  timeout       = var.timeout

 #source_code_hash = data.archive_file.lambda.output_base64sha256

  vpc_config {
    subnet_ids         = var.subnet_ids
    security_group_ids = var.security_group_ids
  }

  environment {
    variables = {
      BACKEND_URL                = "${var.BACKEND_URL}"
      X_COMPRESSED_COMMUNICATION = "${var.X_COMPRESSED_COMMUNICATION}"
      X_CHANNEL                  = "${var.X_CHANNEL}"
      X_PROTECTED_COMMUNICATION  = "${var.X_PROTECTED_COMMUNICATION}"
      X_SESSION_EXPIRATION_TIME  = "${var.X_SESSION_EXPIRATION_TIME}"
      X_TWR_TOKEN                = "${var.X_TWR_TOKEN}"
    }
  }

}
# This is to optionally manage the CloudWatch Log Group for the Lambda Function.
# If skipping this resource configuration, also add "logs:CreateLogGroup" to the IAM policy below.
resource "aws_cloudwatch_log_group" "cloudwatch_log_lambda" {
  name              = "/aws/lambda/${var.function_name}"
  retention_in_days = 14
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