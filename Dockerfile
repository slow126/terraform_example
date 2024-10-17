FROM python:3.9-slim-buster

WORKDIR /app

COPY ./src/terraform_aws_example_slow126/ /app/terraform_aws_example_slow126/
COPY ./src/terraform_aws_example_slow126/docker_test.py .

RUN mkdir -p /app/.aws/ 
RUN --mount=type=secret,id=aws_keys,dst=/tmp/aws_keys cat /tmp/aws_keys > /app/.aws/credentials

ENV AWS_SHARED_CREDENTIALS_FILE=/app/.aws/credentials

RUN ls -la 
RUN pwd

RUN apt-get update && \
    apt-get install -y curl && \
    pip install awscli && \
    apt-get -y install git && \
    apt-get -y install unzip && \
    apt-get -y install wget && \
    wget https://releases.hashicorp.com/terraform/1.9.8/terraform_1.9.8_linux_arm64.zip && \
    unzip terraform_1.9.8_linux_arm64.zip && \
    mv terraform /usr/local/bin/ && \
    ls -la /usr/local/bin/terraform && \
    cd /app/terraform_aws_example_slow126/terraform_aws_instance && \
    ls -la && \
    terraform init && \
    terraform fmt && \
    terraform validate && \
    terraform apply -auto-approve



CMD ["python", "docker_test.py"]