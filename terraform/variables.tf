variable "aws_region" {
  description = "AWS region used for the project"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Name used to identify project resources"
  type        = string
  default     = "cloud-automation-devops-lab"
}

variable "instance_type" {
  description = "EC2 instance type used for the application server"
  type        = string
  default     = "t3.micro"
}




variable "github_owner" {
  description = "GitHub account owner"
  type        = string
  default     = "MohamedJMoosa"
}

variable "github_repository" {
  description = "GitHub repository name"
  type        = string
  default     = "cloud-automation-devops-lab"
}

variable "github_owner_id" {
  description = "Immutable GitHub owner ID"
  type        = string
  default     = "323336647"
}

variable "github_repository_id" {
  description = "Immutable GitHub repository ID"
  type        = string
  default     = "1393405849"
}