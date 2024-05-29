variable "iam-role" {
  description = "IAM Role for the Jumphost Server"
  type        = string
  default     = "Jumphost-iam-role"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default     = "ami-04b70fa74e45c3917"
}

variable "public_subnet_az1_id" {
  description = "Public subnet ID for the EC2 instance in AZ1"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.medium"
}

variable "key_name" {
  description = "EC2 keypair"
  type        = string
  default     = "esocial"
}

variable "instance_name" {
  description = "EC2 Instance name for the jumphost server"
  type        = string
  default     = "Jumphost-server"
}

variable "security-group_id" {
  description = "Security group ID for the EC2 instance"
  type        = string
}
