# Node + Terraform + AWS Fargate

_created by Austin Poor_

## Requirements

* Docker
* Make
* AWS-CLI
* Terraform

## Instructions to Run

Create a `.env` file with the ECR address. For example:

```bash
ECR_ADDRESS="<some-numbers>.dkr.ecr.<aws-region>.amazonaws.com"
```

Then, to build & push the docker image, run the following:

```bash
$ source .env
$ make -e ECR_ADDRESS=$ECR_ADDRESS
```

