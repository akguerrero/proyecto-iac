variable "Nameproject" {
  description = "Nombre Proyecto"
  type        = string
}
variable "Environment" {
  description = "Ambiente"
  type        = string
}

variable "filename" {
  description = "filename"
  type        = string
}
variable "function_name" {
  description = "function_name"
  type        = string
}
variable "handler" {
  description = "handler"
  type        = string
}
variable "runtime" {
  description = "runtime "
  type        = string
}
variable "timeout" {
  description = "timeout"
  type        = number
}
variable "subnet_ids" {
  description = "subnet_ids"
  type        = list(string)
}
variable "security_group_ids" {
  description = "security_group_ids"
  type        = list(string)
}

variable "description" {
  description = "description"
  type        = string
}
variable "BACKEND_URL" {
  description = "BACKEND_URL"
  type        = string
}
variable "CACHE_FUNCTION" {
  description = "CACHE_FUNCTION"
  type        = string
}
variable "CRYPTO_KEY_SECRET_NAME" {
  description = "CRYPTO_KEY_SECRET_NAME"
  type        = string
}
variable "DECRYPT_FUNCTION" {
  description = "DECRYPT_FUNCTION"
  type        = string
}
variable "ENCRYPT_FUNCTION" {
  description = "DECRYPT_FUNCTION"
  type        = string
}
variable "X_COMPRESSED_COMMUNICATION" {
  description = "X_COMPRESSED_COMMUNICATION"
  type        = bool
}
variable "X_CHANNEL" {
  description = "X_CHANNEL"
  type        = number
}
variable "X_PROTECTED_COMMUNICATION" {
  description = "X_PROTECTED_COMMUNICATION"
  type        = bool
}
variable "X_SESSION_EXPIRATION_TIME" {
  description = "X_SESSION_EXPIRATION_TIME"
  type        = number
}
variable "X_TWR_TOKEN" {
  description = "X_TWR_TOKEN"
  type        = string
}