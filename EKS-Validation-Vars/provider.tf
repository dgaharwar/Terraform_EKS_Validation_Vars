provider "aws" {
  region     = var.region  # Change this to your desired AWS region
  access_key = var.access_key  # Change this to your desired Access Key
  secret_key = var.secret_key  # Change this to your desired Secret Key
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "desired_capacity" {
  description = "Desired number of worker nodes"
  type        = number
  validation {
    condition     = var.desired_capacity > 0 && var.desired_capacity <= 10
    error_message = "Desired capacity must be between 1 and 10"
  }
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = var.cluster_name
  subnets         = ["subnet-12e7ae4d", "subnet-37a1ea16"]  # Replace with your subnet IDs
  vpc_id          = "vpc-33ac354e"  # Replace with your VPC ID
  desired_capacity = var.desired_capacity
  # Add other necessary parameters as needed
}
