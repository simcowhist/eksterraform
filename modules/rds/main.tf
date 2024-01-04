module "db" {
  source = "terraform-aws-modules/rds/aws"

  identifier = var.identifier

  engine               = var.db_engine
  major_engine_version = var.db_major_engine_version
  engine_version       = var.db_engine_version
  family               = var.db_family
  instance_class       = var.db_instance_type
  allocated_storage    = var.db_allocated_stroage

  db_name  = var.db_name
  port     = var.db_port
  username = var.db_master_user

  vpc_security_group_ids = [module.database_security_group.security_group_id]
  multi_az               = var.db_multi_az
  db_subnet_group_name   = var.database_subnet_group

  manage_master_user_password = var.db_manage_master_password
  skip_final_snapshot         = var.skip_final_snapshot
}

module "database_security_group" {
  source = "terraform-aws-modules/security-group/aws"

  name        = var.sg_name
  description = "Security group for RDS instances"
  vpc_id      = var.vpc_id

  ingress_with_cidr_blocks = [
    {
      from_port   = var.db_port
      to_port     = var.db_port
      protocol    = var.db_security_group_protocol
      description = "MySQL access from within VPC"
      cidr_blocks = var.cidr_block
    },
  ]
}