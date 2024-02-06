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
variable "ENCRYPT_FUNCTION" {
  description = "ENCRYPT_FUNCTION"
  type        = string
}
variable "X_CHANNEL" {
  description = "X_CHANNEL"
  type        = string
}
variable "X_TWR_TOKEN" {
  description = "X_TWR_TOKEN"
  type        = string
}