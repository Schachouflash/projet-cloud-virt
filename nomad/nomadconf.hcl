job "testcloud" {
  datacenters = ["montagne-verte"]

  group "frontends" {
    count = 1

    network {
      port "frontend" {
        static = 3000
        to = 3000
      }
    }

    task "frontend" {
      driver = "docker"
      config {
        image = "ghcr.io/schachouflash/frontend:latest"
        ports = ["frontend"]
        port_map {
          frontend {
            static = 3000
          }
        }
      }
    }
  }

  group "workers" {
    count = 1

    network {
      port "worker" {
        static = 8080
        to = 8080
      }
    }

    task "worker" {
      driver = "docker"
      config {
        image = "ghcr.io/schachouflash/worker-app"
        ports = ["worker"]
      }
    }
  }

  group "haproxys" {
    count = 3

    network {
      port "haproxy" {
        static = 80
        to = 80
      }
    }

    task "haproxy" {
      driver = "docker"
      config {
        image = "docker.io/library/haproxy"
        ports = ["haproxy"]
      }
    }
  }
}