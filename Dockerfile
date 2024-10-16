FROM python:3.9-slim-buster

WORKDIR /app

COPY ./src/terraform_aws_example_slow126/docker_test.py .

CMD ["python", "docker_test.py"]