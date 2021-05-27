all: build push clean

build:
	@echo Building docker container locally
	docker build -t fargate-terraform-test .
push:
	@echo "Tagging & pushing images to ECR"
	aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin ${ECR_ADDRESS}
	docker tag fargate-terraform-test:latest ${ECR_ADDRESS}/fargate-terraform-test:latest
	docker push ${ECR_ADDRESS}/fargate-terraform-test:latest
clean:
	@echo Removing local images
	docker rmi fargate-terraform-test:latest ${ECR_ADDRESS}/fargate-terraform-test:latest

help:
	@echo "+---------+----------------------------------------+"
	@echo "| COMMAND | DESCRIPTION                            |"
	@echo "+---------+----------------------------------------+"
	@echo "| build   | Build the docker container locally     |"
	@echo "| push    | Tag the local image and push it to ECR |"
	@echo "| clean   | Remove local images                    |"
	@echo "| all     | Run build, push, then clean            |"
	@echo "+---------+----------------------------------------+"
