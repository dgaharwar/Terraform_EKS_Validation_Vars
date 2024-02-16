variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "desired_capacity" {
  description = "Desired number of worker nodes"
  type        = number
  validation {
    condition     = var.desired_capacity != 0 && var.desired_capacity <= 3
    error_message = "Desired capacity must be between 1 and 10"
  }
}

variable "region" {}

variable "access_key" {}
  
variable "secret_key" {}
