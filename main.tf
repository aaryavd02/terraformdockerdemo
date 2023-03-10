terraform {
    required_providers {
        docker = {
            source = "kreuzwerker/docker"
            version = "~> 2.13.0"
        }
    }
}

resource "docker_image" "nginx" {
    name = "nginx:latest"
    keep_locally = false
}

provider "docker" {
    version = "~> 2.7"
  host    = "npipe:////.//pipe//docker_engine"
}

resource "docker_container" "nginx" {
    image = docker_image.nginx.latest
    name = "terraform-nginx-demo"
    ports {
        internal = 80
        external = 8000
    }
}