variable "environment" {
  description = "Name of the environment"
  type        = string
  default     = "development"
}

variable "region" {
  description = "Name of the aws region"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Name of the project, to be used as a prefix for resource names"
  type        = string
  default     = "eks"
}

variable "vpc_cidr" {
  description = "VPC cider to use"
  type        = string
  default     = "10.1.0.0/16"
}

variable "database_subnets" {
  description = "IP ranges for database subnets"
  type        = list(string)
  default     = ["10.1.201.0/24", "10.1.202.0/24"]
}


variable "public_subnets" {
  description = "IP ranges for public subnets"
  type        = list(string)
  default     = ["10.1.101.0/24", "10.1.102.0/24"]
}

variable "private_subnets" {
  description = "IP ranges for public subnets"
  type        = list(string)
  default     = ["10.1.1.0/24", "10.1.2.0/24"]
}

variable "create_database_subnet_group" {
  description = "Value to determine if to create a database subnet group"
  default     = true
  type        = bool
}

variable "enable_nat_gateway" {
  description = "Value to determine if to create a nat gateway"
  default     = true
  type        = bool
}

variable "desired_node_count" {
  default     = 2
  description = "Amount of desired nodes to run"
  type        = number
}

variable "min_node_count" {
  default     = 2
  description = "Minimum nodes to run"
  type        = number
}

variable "max_node_count" {
  default     = 4
  description = "Maximum nodes to run"
}

variable "instance_types" {
  description = "Instace types to be used in eks cluster"
  type        = list(string)
  default     = ["t3.large"]
}

variable "k8s_version" {
  description = "K8s version for EKS"
  type        = string
  default     = "1.28"
}