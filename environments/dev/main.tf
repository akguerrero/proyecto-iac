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
  role          = module.role.role_arn
  Nameproject = var.Nameproject
  Environment = var.Environment
    depends_on = [
      module.role
  ] 
}

module "api" {
  source = "../../modules/api"  
  name_rol = "api_role"
  uri = module.lambda.lambda_invoke_arn
  path1 = "path001"
  path2 = "anime-quote"
  depends_on = [
      module.lambda
  ] 
}