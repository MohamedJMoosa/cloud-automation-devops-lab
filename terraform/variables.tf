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