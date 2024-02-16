variable "desired_capacity" {
  description = "Desired number of worker nodes"
  type        = number
  validation {
    condition     = var.desired_capacity != 0 && var.desired_capacity <= 3
    error_message = "Desired capacity must be between 1 and 10"
  }
}