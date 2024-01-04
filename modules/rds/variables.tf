variable "db_port" {
  description = "Port to be used for communiation with db"
  type        = string
  default     = "3306"
}

variable "db_security_group_protocol" {
  description = "What protocol the db security group uses"
  default     = "tcp"
  type        = string
}
variable "db_engine" {
  description = "What db to use"
  default     = "mysql"
  type        = string
}

variable "db_major_engine_version" {
  description = "The major version of the db engine"
  default     = "8.0"
  type        = string
}

variable "db_engine_version" {
  description = "The version of the db engine"
  default     = "8.0"
  type        = string
}

variable "db_family" {
  description = "The db family name"
  default     = "mysql8.0"
  type        = string
}

variable "db_instance_type" {
  description = "AWS Instace type of the db"
  default     = "db.r5.large"
  type        = string
}

variable "db_allocated_stroage" {
  description = "Allocated storage of the db in GB"
  default     = 10
  type        = number
}

variable "db_master_user" {
  description = "Name of the master user in the database"
  default     = "admin"
  type        = string
}

variable "db_multi_az" {
  description = "Value to determine if database instance should be across multiple az"
  type        = bool
  default     = true
}

variable "db_manage_master_password" {
  description = "Value to determine if aws should manage the database's master password"
  type        = bool
  default     = true
}

variable "skip_final_snapshot" {
  description = "Value to determine if final snapshot should be skipped or not."
  type        = bool
  default     = false
}

variable "identifier" {
  description = "Identifier for the rds instance"
  type = string
  default = ""
}

variable "db_name" {
  description = "Name of the database"
  type = string
  default = ""
}

variable "sg_name" {
  description = "Name of the rds security group"
  type = string
  default = ""
}

variable "cidr_block" {
  description = "Cidr block for the ingress rule of the database security group"
  type = string
  default = "" 
}

variable "database_subnet_group" {
  description = "Name of the database subnet group"
  type = string
  default = ""
}

variable "vpc_id" {
  description = "Id of the associated VPC"
  type = string
  default = ""
}