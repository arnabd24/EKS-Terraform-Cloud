resource "kubernetes_service_v1" "lb_service" {
  metadata {
    name = "myapp1-deployment"
    annotations = {
      "service.beta.kubernetes.io/aws-load-balancer-type" = "nlb"
    }
  }
  spec {
    selector = {
      app = kubernetes_deployment_v1.mydeploy.spec.0.selector.0.match_labels.app
      /*while you are defining map of string (match_labels) , you should not use 0 , otherwise while using block
      we should mention the block section by 0/1/2 etc. */
    }
    port {
      name        = "http"
      port        = 80
      target_port = 80
    }

    type = "LoadBalancer"
  }
}