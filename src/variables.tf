variable "email" {
  default = "default-email@gmail.com"
  description = "Email to be used for Git configuration and key generation."
  type        = string
  validation {
    condition     = length(var.email) > 0
    error_message = "Email is empty, please populate a file named config.auto.tfvars with `email=...`."
  }
}

variable "name" {
  default     = "Panos Lantavos-Stratigakis"
  description = "Name to be used for Git configuration and key generation."
  type        = string
}