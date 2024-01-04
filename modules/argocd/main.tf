resource "kubernetes_namespace" "argocd" {
  metadata {
    name = "argocd"
  }
}

resource "helm_release" "argo" {
  name = "argocd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd" 
  namespace  = "argocd" 
  version    = var.argocd_version
  depends_on = [ kubernetes_namespace.argocd ]
}

resource "helm_release" "aws_load_balancer_controller" {
  depends_on = [ 
    module.aws_load_balancer_controller_irsa_role[0]
   ]
  namespace  = "kube-system"
  name       = "aws-load-balancer-controller"
  version    = var.lb_controller_chart_version

  repository = var.lb_controller_chart_repo
  chart      = var.lb_controller_chart_name

  set {
    name  = "replicaCount"
    value = var.lb_replica_count
  }

  set {
    name  = "clusterName"
    value = var.cluster_name
  }

  set {
    name  = "serviceAccount.name"
    value = var.lb_service_account_name
  }

  set {
    name  = "serviceAccount.annotations.eks\\.amazonaws\\.com/role-arn"
    value = module.aws_load_balancer_controller_irsa_role.iam_role_arn
  }
}

module "aws_load_balancer_controller_irsa_role" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"
  version = "5.30.0"

  role_name = "aws-load-balancer-controller-${terraform.workspace}"

  attach_load_balancer_controller_policy = true

  oidc_providers = {
    main = {
      provider_arn               = var.oidc_provider_arn
      namespace_service_accounts = ["kube-system:aws-load-balancer-controller"]
    }
  }
}

resource "kubernetes_manifest" "application" {
  manifest = yamldecode(file("${path.module}/application.yaml"))

  depends_on = [ helm_release.argo ]
}