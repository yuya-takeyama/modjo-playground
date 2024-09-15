resource "aws_apprunner_service" "hello_world" {
  service_name = "hello-world"

  source_configuration {
    image_repository {
      image_configuration {
        port = "8080"
      }

      image_identifier      = "615299752259.dkr.ecr.ap-northeast-1.amazonaws.com/mobb/hello-world:latest"
      image_repository_type = "ECR"
    }

    authentication_configuration {
      access_role_arn = "arn:aws:iam::615299752259:role/service-role/AppRunnerECRAccessRole"
    }

    auto_deployments_enabled = false
  }

  instance_configuration {
    cpu    = "256"
    memory = "512"
  }
}
