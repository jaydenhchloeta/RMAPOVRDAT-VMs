variable "environment" {
  type = string

  validation {
    condition = contains(["blue", "green"], var.environment)
    error_message = "Value must contain blue or green"
  }
}

variable "server_vm" {
  description = "Name of the server vm name"
  type = string
}

variable "rdatastore1" {
  description = "name of of the rdatastore vm"
  type = string
}

variable "portal1_vm" {
  description = "Name of the portal1 vm"
  type = string
}

variable "odatastore1" {
  description = "Name of the odatastore1 vm"
  type = string
}

variable "admin_username" {
  description = "Admin account username"
  type = string
}

variable "admin_password" {
  description = "Admin Password"
  type = string
  sensitive = true
}
