variable "argocd_version" {
  default = "5.51.6"
  type = string
  description = "Version for the argocd helm chart"
}

variable "lb_controller_chart_version" {
  default = "1.6.2"
  type = string
  description = "lb controller version"
}

variable "lb_controller_chart_repo" {
  default = "https://aws.github.io/eks-charts"
  type = string
  description = "repo for tbe load balancer"
}

variable "lb_controller_chart_name" {
  default = "aws-load-balancer-controller"
  type = string
  description = "chart name for the load balacer"
}

variable "lb_replica_count" {
  default = 1
  type = number
}

variable "lb_service_account_name" {
  default = "aws-load-balancer-controller"
  type = string
}

variable "oidc_provider_arn" {
  type = string
  default = ""
}

variable "cluster_name" {
  type = string
  default = ""
}