module "AppCryp_Access_Security_Version" {
  source = "../../modules/AppCryp_Access_Security_Version"  
  filename      = "lambda_function.zip"
  description   = "Identifica la versión mínima de la aplicación que debe proveerse desde el frontal para ser compatible con las APIs dispobibles"
  function_name = "AppCryp_Access_Security_Version"
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.8"
  timeout       = 125
  subnet_ids         = ["subnet-0d311169443103688", "subnet-0889172aa899a25d0"]
  security_group_ids = ["sg-0fd370852a4ae84c5"]
  Nameproject = var.Nameproject
  Environment = var.Environment
}

module "AppCryp_Access_Security_Login" {
  source = "../../modules/AppCryp_Access_Security_Login"  
  filename      = "lambda_function.zip"
  description   = "Permite autenticar al usuario"
  function_name = "AppCryp_Access_Security_Login"
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
module "AppCryp_Access_Security_Encrypt" {
  source = "../../modules/AppCryp_Access_Security_Encrypt"  
  filename      = "lambda_function.zip"
  description   = "Encripta un texto plano mediante una clave KMS"
  function_name = "AppCryp_Access_Security_Encrypt"
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.8"
  timeout       = 120
  subnet_ids         = ["subnet-0d311169443103688", "subnet-0889172aa899a25d0"]
  security_group_ids = ["sg-0fd370852a4ae84c5"]
  KMS_KEY_ID                    = "arn:aws:kms:us-east-1:023655688218:key/44c5ffa6-cc4b-481a-b99e-3a73242c4296"
  Nameproject = var.Nameproject
  Environment = var.Environment
}
module "AppCryp_Access_Security_Decrypt" {
  source = "../../modules/AppCryp_Access_Security_Decrypt"  
  filename      = "lambda_function.zip"
  description   = "Encripta un texto plano mediante una clave KMS"
  function_name = "AppCryp_Access_Security_Decrypt"
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.9"
  timeout       = 120
  subnet_ids         = ["subnet-0d311169443103688", "subnet-0889172aa899a25d0"]
  security_group_ids = ["sg-0fd370852a4ae84c5"]
  KMS_KEY_ID                    = "arn:aws:kms:us-east-1:023655688218:key/44c5ffa6-cc4b-481a-b99e-3a73242c4296"
  Nameproject = var.Nameproject
  Environment = var.Environment
}

module "AppCryp_Access_Security_RefreshToken" {
  source = "../../modules/AppCryp_Access_Security_RefreshToken"  
  filename      = "lambda_function.zip"
  description   = "Extiende la duración del token de sesión"
  function_name = "AppCryp_Access_Security_RefreshToken"
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.8"
  timeout       = 120
  subnet_ids         = ["subnet-0d311169443103688", "subnet-0889172aa899a25d0"]
  security_group_ids = ["sg-0fd370852a4ae84c5"]
  BACKEND_URL        = "https://https://tbfc01-okbfp01.towerbank.interno/PA_Towerbank_ICBanking.WebApi.BO/api/Framework/CryptoCustom/RefreshToken"
  DECRYPT_FUNCTION   = "AppCryp_Access_Security_Decrypt"
  X_CHANNEL          = "100"
  Nameproject = var.Nameproject
  Environment = var.Environment
}

module "AppCryp_Access_Security_RevokeToken" {
  source = "../../modules/AppCryp_Access_Security_RevokeToken"  
  filename      = "lambda_function.zip"
  description   = "Caduca la validez del token"
  function_name = "AppCryp_Access_Security_RevokeToken"
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.8"
  timeout       = 120
  subnet_ids         = ["subnet-0d311169443103688", "subnet-0889172aa899a25d0"]
  security_group_ids = ["sg-0fd370852a4ae84c5"]
  BACKEND_URL        = "https://tbfc01-okbfp01.towerbank.interno/PA_Towerbank_ICBanking.WebApi.BO/api/Framework/CryptoCustom/RevokeToken"
  DECRYPT_FUNCTION  = "AppCryp_Access_Security_Decrypt"
  X_CHANNEL         = "100"
  Nameproject = var.Nameproject
  Environment = var.Environment
}

module "AppCryp_Access_Condition_TermsAndConditions" {
  source = "../../modules/AppCryp_Access_Condition_TermsAndConditions"  
  filename      = "lambda_function.zip"
  description   = "Almacena el estado de aceptación del usuario de los términos y condiciones"
  function_name = "AppCryp_Access_Condition_TermsAndConditions"
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.8"
  timeout       = 120
  subnet_ids         = ["subnet-0d311169443103688", "subnet-0889172aa899a25d0"]
  security_group_ids = ["sg-0fd370852a4ae84c5"]
  BACKEND_URL       = "https://towerbank.appiancloud.com/suite/webapi/contents/terms-and-conditions"
  CLIENT_FUNCTION   = "AppCryp_Access_Security_Client"
  DECRYPT_FUNCTION  = "AppCryp_Access_Security_Decrypt"
  Nameproject = var.Nameproject
  Environment = var.Environment
}

module "AppCryp_Access_Condition_PrivacyPolicy" {
  source = "../../modules/AppCryp_Access_Condition_PrivacyPolicy"  
  filename      = "lambda_function.zip"
  description   = "Almacena el estado de aceptación del usuario de las condiciones de privacidad del usuario"
  function_name = "AppCryp_Access_Condition_PrivacyPolicy"
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.8"
  timeout       = 120
  subnet_ids         = ["subnet-0d311169443103688", "subnet-0889172aa899a25d0"]
  security_group_ids = ["sg-0fd370852a4ae84c5"]
  BACKEND_URL       = "https://towerbank.appiancloud.com/suite/webapi/contents/privacy-policy"
  CLIENT_FUNCTION   = "AppCryp_Access_Security_Client"
  DECRYPT_FUNCTION  = "AppCryp_Access_Security_Decrypt"
  Nameproject = var.Nameproject
  Environment = var.Environment
}

module "AppCryp_Global_Balance_FIAT" {
  source = "../../modules/AppCryp_Global_Balance_FIAT"  
  filename      = "lambda_function.zip"
  description   = "Ofrece el desglose de las cuentas y productos FIAT que tiene contratado el usuario"
  function_name = "AppCryp_Global_Balance_FIAT"
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.8"
  timeout       = 120
  subnet_ids         = ["subnet-0d311169443103688", "subnet-0889172aa899a25d0"]
  security_group_ids = ["sg-0fd370852a4ae84c5"]
  BACKEND_URL       = "https://ni4s38gul5.execute-api.us-east-1.amazonaws.com/qa/v1/orchestrator/position-consolidate"
  CLIENT_FUNCTION   = "AppCryp_Access_Security_Client"
  DECRYPT_FUNCTION  = "AppCryp_Access_Security_Decrypt"
  Nameproject = var.Nameproject
  Environment = var.Environment
}
module "AppCryp_Global_Crypto_Conversion" {
  source = "../../modules/AppCryp_Global_Crypto_Conversion"  
  filename      = "lambda_function.zip"
  description   = "AppCryp_Global_Crypto_Conversion."
  function_name = "AppCryp_Global_Crypto_Conversion"
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.8"
  timeout       = 120
  subnet_ids         = ["subnet-0d311169443103688", "subnet-0889172aa899a25d0"]
  security_group_ids = ["sg-0fd370852a4ae84c5"]
  BACKEND_URL       =  "https://towerbank.appiancloud.com/suite/webapi/crypto-conversion"
  CLIENT_FUNCTION    = "AppCryp_Access_Security_Client"
  Nameproject = var.Nameproject
  Environment = var.Environment
}
module "AppCryp_Global_Balance_Crypto" {
  source = "../../modules/AppCryp_Global_Balance_Crypto"  
  filename      = "lambda_function.zip"
  description   = "Ofrece el desglose de las cuentas y productos CRYPTO que tiene contratado el usuario"
  function_name = "AppCryp_Global_Balance_Crypto"
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.8"
  timeout       = 120
  subnet_ids         = ["subnet-0d311169443103688", "subnet-0889172aa899a25d0"]
  security_group_ids = ["sg-0fd370852a4ae84c5"]
  BACKEND_URL   = "https://towerbank.appiancloud.com/suite/webapi/crypto-balance"
  CLIENT_FUNCTION= "AppCryp_Access_Security_Client"
  DECRYPT_FUNCTION = "AppCryp_Access_Security_Decrypt"
  Nameproject = var.Nameproject
  Environment = var.Environment
}

module "AppCryp_Global_InfoCryp_Allowed" {
  source = "../../modules/AppCryp_Global_InfoCryp_Allowed"  
  filename      = "lambda_function.zip"
  description   = "Ofrece la información de las Cryptos con las que podemos operar"
  function_name = "AppCryp_Global_InfoCryp_Allowed"
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.8"
  timeout       = 120
  subnet_ids         = ["subnet-0d311169443103688", "subnet-0889172aa899a25d0"]
  security_group_ids = ["sg-0fd370852a4ae84c5"]
  BACKEND_URL   = "https://towerbank.appiancloud.com/suite/webapi/coins"
  CLIENT_FUNCTION= "AppCryp_Access_Security_Client"
  DECRYPT_FUNCTION = "AppCryp_Access_Security_Decrypt"
  Nameproject = var.Nameproject
  Environment = var.Environment
}

module "AppCryp_Global_InfoCryp_Other" {
  source = "../../modules/AppCryp_Global_InfoCryp_Other"  
  filename      = "lambda_function.zip"
  description   = "Ofrece la información de las Cryptos que se ofrecen únicamente en modo consultivo"
  function_name = "AppCryp_Global_InfoCryp_Other"
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.8"
  timeout       = 120
  subnet_ids         = ["subnet-0d311169443103688", "subnet-0889172aa899a25d0"]
  security_group_ids = ["sg-0fd370852a4ae84c5"]
  CLIENT_FUNCTION  = "AppCryp_Access_Security_Client"
  Nameproject = var.Nameproject
  Environment = var.Environment
}

module "AppCryp_Global_InfoCryp_Detail" {
  source = "../../modules/AppCryp_Global_InfoCryp_Detail"  
  filename      = "lambda_function.zip"
  description   = "Ofrece la información detallada de una cryptomoneda: parámetros específicos, tendencias, market stats."
  function_name = "AppCryp_Global_InfoCryp_Detail"
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.8"
  timeout       = 120
  subnet_ids         = ["subnet-0d311169443103688", "subnet-0889172aa899a25d0"]
  security_group_ids = ["sg-0fd370852a4ae84c5"]
  BACKEND_URL      = "https://towerbank.appiancloud.com/suite/webapi/coins"
  CLIENT_FUNCTION  = "AppCryp_Access_Security_Client"
  DECRYPT_FUNCTION = "AppCryp_Access_Security_Decrypt"
  Nameproject = var.Nameproject
  Environment = var.Environment
}

module "AppCryp_Global_Transac_History" {
  source = "../../modules/AppCryp_Global_Transac_History"  
  filename      = "lambda_function.zip"
  description   = "Ofrece las últimas N transacciones (finalizadas o pendientes, se utilizará un filtro) que se solicitan ordenadas cronologicamente."
  function_name = "AppCryp_Global_Transac_History"
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.8"
  timeout       = 120
  subnet_ids         = ["subnet-0d311169443103688", "subnet-0889172aa899a25d0"]
  security_group_ids = ["sg-0fd370852a4ae84c5"]
  BACKEND_URL       = "https://towerbank.appiancloud.com/suite/webapi/transactions"
  CLIENT_FUNCTION   = "AppCryp_Access_Security_Client"
  DECRYPT_FUNCTION  = "AppCryp_Access_Security_Decrypt"
  Nameproject = var.Nameproject
  Environment = var.Environment
}

module "AppCryp_Global_Transac_CancelPending" {
  source = "../../modules/AppCryp_Global_Transac_CancelPending"  
  filename      = "lambda_function.zip"
  description   = "Permite cancelar una operación pendiente, siempre que se den las condiciones para ello."
  function_name = "AppCryp_Global_Transac_CancelPending"
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.8"
  timeout       = 120
  subnet_ids         = ["subnet-0d311169443103688", "subnet-0889172aa899a25d0"]
  security_group_ids = ["sg-0fd370852a4ae84c5"]
  BACKEND_URL        = "https://towerbank.appiancloud.com/suite/webapi/operations"
  CLIENT_FUNCTION    = "AppCryp_Access_Security_Client"
  DECRYPT_FUNCTION   = "AppCryp_Access_Security_Decrypt"
  Nameproject = var.Nameproject
  Environment = var.Environment
}

module "AppCryp_Global_Notify" {
  source = "../../modules/AppCryp_Global_Notify"  
  filename      = "lambda_function.zip"
  description   = "Obtiene un listado con las últimas N notificaciones. Las notificaciones deben tener un flag para indicar si están leídas."
  function_name = "AppCryp_Global_Notify"
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.8"
  timeout       = 120
  subnet_ids         = ["subnet-0d311169443103688", "subnet-0889172aa899a25d0"]
  security_group_ids = ["sg-0fd370852a4ae84c5"]
  BACKEND_URL        = "https://towerbank.appiancloud.com/suite/webapi/notifications"
  CLIENT_FUNCTION    = "AppCryp_Access_Security_Client"
  DECRYPT_FUNCTION   = "AppCryp_Access_Security_Decrypt"
  Nameproject = var.Nameproject
  Environment = var.Environment
}

module "AppCryp_Global_Notify_MarkAsRead" {
  source = "../../modules/AppCryp_Global_Notify_MarkAsRead"  
  filename      = "lambda_function.zip"
  description   = "Permite marcar un conjunto de notificaciones como leídas a través del id de notificación."
  function_name = "AppCryp_Global_Notify_MarkAsRead"
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.8"
  timeout       = 120
  subnet_ids         = ["subnet-0d311169443103688", "subnet-0889172aa899a25d0"]
  security_group_ids = ["sg-0fd370852a4ae84c5"]
  BACKEND_URL        = "https://towerbank.appiancloud.com/suite/webapi/notifications"
  CLIENT_FUNCTION    = "AppCryp_Access_Security_Client"
  DECRYPT_FUNCTION   = "AppCryp_Access_Security_Decrypt"
  Nameproject = var.Nameproject
  Environment = var.Environment
}

module "AppCryp_Operative_Crypto_buy" {
  source = "../../modules/AppCryp_Operative_Crypto_buy"  
  filename      = "lambda_function.zip"
  description   = "Permite indicar un tipo de Crypto, una cantidad en dólares y ejecutar una transacción de compra de dicha moneda"
  function_name = "AppCryp_Operative_Crypto_buy"
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.8"
  timeout       = 120
  subnet_ids         = ["subnet-0d311169443103688", "subnet-0889172aa899a25d0"]
  security_group_ids = ["sg-0fd370852a4ae84c5"]
  BACKEND_URL       =  "https://towerbank.appiancloud.com/suite/webapi/quote"
  CLIENT_FUNCTION   = "AppCryp_Access_Security_Client"
  DECRYPT_FUNCTION  = "AppCryp_Access_Security_Decrypt"
  Nameproject = var.Nameproject
  Environment = var.Environment
}

module "AppCryp_Operative_Crypto_ConvertCryptoToCrypto" {
  source = "../../modules/AppCryp_Operative_Crypto_ConvertCryptoToCrypto"  
  filename      = "lambda_function.zip"
  description   = "Permite indicar un tipo de Cryptoa adquirir, una cantidad en otra crypto y ejecutar una transacción de compra de dicha moneda"
  function_name = "AppCryp_Operative_Crypto_ConvertCryptoToCrypto"
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.8"
  timeout       = 120
  subnet_ids         = ["subnet-0d311169443103688", "subnet-0889172aa899a25d0"]
  security_group_ids = ["sg-0fd370852a4ae84c5"]
  CLIENT_FUNCTION    = "AppCryp_Access_Security_Client"
  Nameproject = var.Nameproject
  Environment = var.Environment
}

module "AppCryp_Operative_Crypto_CurrentValueOfAPurchase" {
  source = "../../modules/AppCryp_Operative_Crypto_CurrentValueOfAPurchase"  
  filename      = "lambda_function.zip"
  description   = "Permite indicar unos valores de moneda (crypto o dólares) de origen y destino para calcular el cambio. Debe indicarse también el valor de los fees aplicados"
  function_name = "AppCryp_Operative_Crypto_CurrentValueOfAPurchase"
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.8"
  timeout       = 120
  subnet_ids         = ["subnet-0d311169443103688", "subnet-0889172aa899a25d0"]
  security_group_ids = ["sg-0fd370852a4ae84c5"]
  CLIENT_FUNCTION    = "AppCryp_Access_Security_Client"
  Nameproject = var.Nameproject
  Environment = var.Environment
}
module "AppCryp_Operative_Crypto_CurrentValue" {
  source = "../../modules/AppCryp_Operative_Crypto_CurrentValue"  
  filename      = "lambda_function.zip"
  description   = "Permite indicar un tipo de Crypto, una cantidad en dólares y ejecutar una transacción de compra de dicha moneda"
  function_name = "AppCryp_Operative_Crypto_CurrentValue"
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.8"
  timeout       = 120
  subnet_ids         = ["subnet-0d311169443103688", "subnet-0889172aa899a25d0"]
  security_group_ids = ["sg-0fd370852a4ae84c5"]
  BACKEND_URL       = "https://towerbank.appiancloud.com/suite/webapi/quote"
  CLIENT_FUNCTION   = "AppCryp_Access_Security_Client"
  DECRYPT_FUNCTION  = "AppCryp_Access_Security_Decrypt"
  Nameproject = var.Nameproject
  Environment = var.Environment
}

module "AppCryp_Operative_Crypto_CryptoToExternalAddress" {
  source = "../../modules/AppCryp_Operative_Crypto_CryptoToExternalAddress"  
  filename      = "lambda_function.zip"
  description   = "Permite enviar cantidad una crypto a una address externa"
  function_name = "AppCryp_Operative_Crypto_CryptoToExternalAddress"
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.8"
  timeout       = 120
  subnet_ids         = ["subnet-0d311169443103688", "subnet-0889172aa899a25d0"]
  security_group_ids = ["sg-0fd370852a4ae84c5"]
  CLIENT_FUNCTION    = "AppCryp_Access_Security_Client"
  Nameproject = var.Nameproject
  Environment = var.Environment
}

module "AppCryp_Operative_Crypto_SellCrypto" {
  source = "../../modules/AppCryp_Operative_Crypto_SellCrypto"  
  filename      = "lambda_function.zip"
  description   = "Permite convertir una cantidad determinada de una crypto en el valor correspondiente en dólares."
  function_name = "AppCryp_Operative_Crypto_SellCrypto"
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.8"
  timeout       = 120
  subnet_ids         = ["subnet-0d311169443103688", "subnet-0889172aa899a25d0"]
  security_group_ids = ["sg-0fd370852a4ae84c5"]
  BACKEND_URL       =  "https://towerbank.appiancloud.com/suite/webapi/quote"
  CLIENT_FUNCTION   = "AppCryp_Access_Security_Client"
  DECRYPT_FUNCTION  = "AppCryp_Access_Security_Decrypt"
  Nameproject = var.Nameproject
  Environment = var.Environment
}

module "AppCryp_Operative_Crypto_ValidateOpetation" {
  source = "../../modules/AppCryp_Operative_Crypto_ValidateOpetation"  
  filename      = "lambda_function.zip"
  description   = "Permite confirmar la ejecución de una operación indicada a través de un id de operación."
  function_name = "AppCryp_Operative_Crypto_ValidateOpetation"
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.8"
  timeout       = 120
  subnet_ids         = ["subnet-0d311169443103688", "subnet-0889172aa899a25d0"]
  security_group_ids = ["sg-0fd370852a4ae84c5"]
  BACKEND_URL        = "https://towerbank.appiancloud.com/suite/webapi/operations"
  CLIENT_FUNCTION    = "AppCryp_Access_Security_Client"
  Nameproject = var.Nameproject
  Environment = var.Environment
}

module "AppCryp_Operative_Config_Profile_MyProfile" {
  source = "../../modules/AppCryp_Operative_Config_Profile_MyProfile"  
  filename      = "lambda_function.zip"
  description   = "Obtiene la información del perfil del usuario indicando datos de contacto, email, información relevante…"
  function_name = "AppCryp_Operative_Config_Profile_MyProfile"
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.8"
  timeout       = 120
  subnet_ids         = ["subnet-0d311169443103688", "subnet-0889172aa899a25d0"]
  security_group_ids = ["sg-0fd370852a4ae84c5"]
  BACKEND_URL        = "https://towerbank.appiancloud.com/suite/webapi/users/profile"
  CLIENT_FUNCTION    = "AppCryp_Access_Security_Client"
  DECRYPT_FUNCTION   = "AppCryp_Access_Security_Decrypt"
  Nameproject = var.Nameproject
  Environment = var.Environment
}

module "AppCryp_Operative_Config_Profile_MyAddresses" {
  source = "../../modules/AppCryp_Operative_Config_Profile_MyAddresses"  
  filename      = "lambda_function.zip"
  description   = "Lista los valores los addresses de las monedas vinculadas a la cuenta crypto-friendly."
  function_name = "AppCryp_Operative_Config_Profile_MyAddresses"
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.8"
  timeout       = 120
  subnet_ids         = ["subnet-0d311169443103688", "subnet-0889172aa899a25d0"]
  security_group_ids = ["sg-0fd370852a4ae84c5"]
  BACKEND_URL        = "https://towerbank.appiancloud.com/suite/webapi/users/own-addresses"
  CLIENT_FUNCTION    = "AppCryp_Access_Security_Client"
  DECRYPT_FUNCTION   = "AppCryp_Access_Security_Decrypt"
  Nameproject = var.Nameproject
  Environment = var.Environment
}

module "AppCryp_Operative_Config_FavoriteAddresses_Get" {
  source = "../../modules/AppCryp_Operative_Config_FavoriteAddresses_Get"  
  filename      = "lambda_function.zip"
  description   = "Recuerpa el listado de addresses favoritos"
  function_name = "AppCryp_Operative_Config_FavoriteAddresses_Get"
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.8"
  timeout       = 120
  subnet_ids         = ["subnet-0d311169443103688", "subnet-0889172aa899a25d0"]
  security_group_ids = ["sg-0fd370852a4ae84c5"]
  CLIENT_FUNCTION    = "AppCryp_Access_Security_Client"
  Nameproject = var.Nameproject
  Environment = var.Environment
}

module "AppCryp_Operative_Config_FavoriteAddresses_Create" {
  source = "../../modules/AppCryp_Operative_Config_FavoriteAddresses_Create"  
  filename      = "lambda_function.zip"
  description   = "Crea un nuevo address"
  function_name = "AppCryp_Operative_Config_FavoriteAddresses_Create"
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.8"
  timeout       = 120
  subnet_ids         = ["subnet-0d311169443103688", "subnet-0889172aa899a25d0"]
  security_group_ids = ["sg-0fd370852a4ae84c5"]
  CLIENT_FUNCTION    = "AppCryp_Access_Security_Client"
  Nameproject = var.Nameproject
  Environment = var.Environment
}

module "AppCryp_Operative_Config_FavoriteAddresses_Delete" {
  source = "../../modules/AppCryp_Operative_Config_FavoriteAddresses_Delete"  
  filename      = "lambda_function.zip"
  description   = "Borra un address favorito"
  function_name = "AppCryp_Operative_Config_FavoriteAddresses_Delete"
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.8"
  timeout       = 120
  subnet_ids         = ["subnet-0d311169443103688", "subnet-0889172aa899a25d0"]
  security_group_ids = ["sg-0fd370852a4ae84c5"]
  CLIENT_FUNCTION    = "AppCryp_Access_Security_Client"
  Nameproject = var.Nameproject
  Environment = var.Environment
}

module "AppCryp_Operative_Config_FavoriteAddresses_Put" {
  source = "../../modules/AppCryp_Operative_Config_FavoriteAddresses_Put"  
  filename      = "lambda_function.zip"
  description   = "Actualiza un address favorito"
  function_name = "AppCryp_Operative_Config_FavoriteAddresses_Put"
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.8"
  timeout       = 120
  subnet_ids         = ["subnet-0d311169443103688", "subnet-0889172aa899a25d0"]
  security_group_ids = ["sg-0fd370852a4ae84c5"]
  CLIENT_FUNCTION    = "AppCryp_Access_Security_Client"
  Nameproject = var.Nameproject
  Environment = var.Environment
}
module "AppCryp_Access_Security_Client" {
  source = "../../modules/AppCryp_Access_Security_Client"  
  filename      = "lambda_function.zip"
  description   = "Realiza la validacion del token y la consulta al backend"
  function_name = "AppCryp_Access_Security_Client"
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.8"
  timeout       = 120
  subnet_ids         = ["subnet-0d311169443103688", "subnet-0889172aa899a25d0"]
  security_group_ids = ["sg-0fd370852a4ae84c5"]
  API_KEY           = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiI2M2FlYmFkYy0zNDdhLTRhOWItOGM0Yi1kNWQzZGMwYzk2NWYifQ.TzEoJGDk7koUKI2KoNmByJlInTg2kQ0TogWGyrflGvM"
  REFRESH_TOKEN_FUNCTION = "AppCryp_Access_Security_RefreshToken"
  Nameproject = var.Nameproject
  Environment = var.Environment
}

module "AppCryp_Access_Security_Login-test" {
  source = "../../modules/AppCryp_Access_Security_Login-test"  
  filename      = "lambda_function.zip"
  description   = "Permite autenticar al usuario"
  function_name = "AppCryp_Access_Security_Login-test"
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