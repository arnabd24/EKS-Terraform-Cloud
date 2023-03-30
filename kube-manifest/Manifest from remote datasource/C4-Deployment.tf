resource "kubernetes_deployment_v1" "mydeploy" {
  metadata {
    name = "myapp1-deployment"
    labels = {
      test = "MyExampleApp"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "myapp1"
      }
    }

    template {
      metadata {
        labels = {
          app = "myapp1"
        }
      }

      spec {
        container {
          image = "stacksimplify/kubenginx:1.0.0"
          name  = "myapp1-deployment"
          port {
            container_port = 80
          }
        }
      }
    }
  }
}