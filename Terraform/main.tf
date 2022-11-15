provider "aws" {
  region = "us-east-1"
}

resource "aws_ecs_cluster" "app_cluster" {
  name = "flask-app-cluster"
}

resource "aws_ecs_task_definition" "app_task" {
  family                   = "flask-app-task"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"

  container_definitions = jsonencode([{
    name  = "flask-app"
    image = "${aws_ecr_repository.app_repo.repository_url}:latest"
    essential = true
    portMappings = [{
      containerPort = 5000
      protocol      = "tcp"
    }]
  }])
}

resource "aws_ecs_service" "app_service" {
  name            = "flask-app-service"
  cluster         = aws_ecs_cluster.app_cluster.id
  task_definition = aws_ecs_task_definition.app_task.arn
  desired_count   = 1

  launch_type = "FARGATE"

  network_configuration {
    subnets         = ["subnet-12345678", "subnet-87654321"] # Replace with real subnet IDs
    security_groups = ["sg-12345678"]                       # Replace with real security group ID
  }
}