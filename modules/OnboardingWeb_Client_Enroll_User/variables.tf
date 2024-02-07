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
variable "X_COMPRESSED_COMMUNICATION" {
  description = "X_COMPRESSED_COMMUNICATION"
  type        = string
}
variable "X_CHANNEL" {
  description = "X_CHANNEL"
  type        = string
}
variable "X_PROTECTED_COMMUNICATION" {
  description = "X_PROTECTED_COMMUNICATION"
  type        = string
}
variable "X_SESSION_EXPIRATION_TIME" {
  description = "X_SESSION_EXPIRATION_TIME"
  type        = string
}
variable "X_TWR_TOKEN" {
  description = "X_TWR_TOKEN"
  type        = string
}