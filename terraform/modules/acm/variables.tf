variable "project_name" {
  description = "The project name"
  type        = string
}

variable "environment" {
  description = "The environment (e.g., production, staging)"
  type        = string
}

variable "domain_name" {
  description = "The domain name to issue the certificate for"
  type        = string
}

variable "alternative_names" {
  description = "The alternative names to include in the certificate"
  type = string
}

variable "route53_zone_id" {
  description = "The Route 53 Hosted Zone ID"
  type        = string
}
