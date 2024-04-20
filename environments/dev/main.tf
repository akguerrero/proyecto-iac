module "role" {
  source = "../../modules/role"  
  name_rol = "lambda_role"
}

module "lambda" {
  source = "../../modules/lambda"  
  filename      = "lambda_function.zip"
  description   = ""
  function_name = "mdw-lambda"
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.8"
  timeout       = 120
  role = "lambda_role"
  Nameproject = var.Nameproject
  Environment = var.Environment
    depends_on = [
      module.role
  ] 
}

module "api" {
  source = "../../modules/api"  
  name_rol = "api"
  depends_on = [
      module.lambda
  ] 
}