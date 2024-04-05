
module "OnboardingWeb_Client_Enroll_User" {
  source = "../../modules/OnboardingWeb_Client_Enroll_User"  
  filename      = "lambda_function.zip"
  description   = "Permite hacer enroll a un usuario."
  function_name = "OnboardingWeb_Client_Enroll_User"
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.8"
  timeout       = 120
  subnet_ids         = ["subnet-0d8db9708e1609466", "subnet-0e7c71fdd626cc2c6"]
  security_group_ids = ["sg-0882a0fa4894124db"]
  BACKEND_URL                    = "https://tbfc01-ic06bk20.towerbank.interno/PA_Towerbank_ICBanking.WebApi.BO/api/framework/cryptocustom/UserEnroll"
  CACHE_FUNCTION                 = "AppCryp_Cache"
  CRYPTO_KEY_SECRET_NAME         = "CIPHER_KEY_VALUE"
  DECRYPT_FUNCTION               = "AppCryp_Build38_Security_Decrypt"
  ENCRYPT_FUNCTION               = "AppCryp_Build38_Security_Encrypt"
  X_COMPRESSED_COMMUNICATION     = false
  X_CHANNEL                      = 100
  X_PROTECTED_COMMUNICATION      = false
  X_SESSION_EXPIRATION_TIME      = 0
  X_TWR_TOKEN                    = "3F2504E0-4F89-11D3-9A0C-0305E82C3301"
  Nameproject = var.Nameproject
  Environment = var.Environment
}
module "OnboardingWeb_Client_Validate_User" {
  source = "../../modules/OnboardingWeb_Client_Validate_User"  
  filename      = "lambda_function.zip"
  description   = "Permite validar un usuario."
  function_name = "OnboardingWeb_Client_Validate_User"
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.8"
  timeout       = 120
  subnet_ids         = ["subnet-0d8db9708e1609466", "subnet-0e7c71fdd626cc2c6"]
  security_group_ids = ["sg-0882a0fa4894124db"]
  BACKEND_URL                    = "https://tbfc01-ic06bk20.towerbank.interno/PA_Towerbank_ICBanking.WebApi.BO/api/framework/cryptocustom/validateuserdata"
  X_COMPRESSED_COMMUNICATION     = false
  X_CHANNEL                      = 100
  X_PROTECTED_COMMUNICATION      = false
  X_SESSION_EXPIRATION_TIME      = 0
  X_TWR_TOKEN                    = "3F2504E0-4F89-11D3-9A0C-0305E82C3301"
  Nameproject = var.Nameproject
  Environment = var.Environment
}