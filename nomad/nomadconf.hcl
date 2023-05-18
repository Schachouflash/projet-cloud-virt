job "testcloud" {
  datacenters = ["montagne-verte"]

  group "testcloud" {
    count = 2

    network {
      port "frontend" {
        static = 3000
        to = 8080
      }

      port "worker/frontend"{
        static = 8080
        to = 8081
      }
    }
    task "frontend" {
      driver = "docker"
      config {
        image = "ghrc.io/schachouflash/frontend"
        ports = ["frontend"]
        args  = ["--port", "3000"]
      }

      resources {
        cpu    = 100
        memory = 128
      }
    }

    task "worker" {
      driver = "docker"
      config {
        image = "ghrc.io/schachouflash/worker-app"
        ports = ["worker/frontend"]
        args  = ["--port", "8080"]
      }

      resources {
        cpu    = 100
        memory = 128
      }
    }
  }
}