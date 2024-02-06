
module "OnboardingWeb_Client_Enroll_User" {
  source = "../../modules/OnboardingWeb_Client_Enroll_User"  
  filename      = "lambda_function.zip"
  description   = "Permite hacer enroll a un usuario."
  function_name = "OnboardingWeb_Client_Enroll_User"
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.8"
  timeout       = 120
  subnet_ids         = ["subnet-0d311169443103688", "subnet-0889172aa899a25d0"]
  security_group_ids = ["sg-0fd370852a4ae84c5"]
  BACKEND_URL          = "https://tbfc01-okbfp01.towerbank.interno/PA_Towerbank_ICBanking.WebApi.BO/api/Framework/CryptoCustom/Login"
  ENCRYPT_FUNCTION     = "AppCryp_Access_Security_Encrypt"
  X_CHANNEL            = "100"
  X_TWR_TOKEN          = "3F2504E0-4F89-11D3-9A0C-0305E82C3301"

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
  subnet_ids         = ["subnet-0d311169443103688", "subnet-0889172aa899a25d0"]
  security_group_ids = ["sg-0fd370852a4ae84c5"]
  BACKEND_URL          = "https://tbfc01-ic06bk20.towerbank.interno/PA_Towerbank_ICBanking.WebApi.BO/api/Framework/CryptoCustom/Login"
  ENCRYPT_FUNCTION     = "AppCryp_Access_Security_Encrypt"
  X_CHANNEL            = "10000"
  X_TWR_TOKEN          = "3F2504E0-4F89-11D3-9A0C-0305E82C3301"

  Nameproject = var.Nameproject
  Environment = var.Environment
}