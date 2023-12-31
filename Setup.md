# Pipeline Project - Installation and Configuration

CI/CD Pipeline using Jenkins, Terraform, AWS services, and Docker

## Github Repository

Reference:

https://github.com/raogaru/project/blob/main/project.md

https://github.com/raogaru/project.git

clone git repo:

mkdir -p $HOME/GitHub

cd $HOME/GitHub

git clone https://github.com/raogaru/project.git

## Install GitHub Desktop 

Reference:

https://desktop.github.com/

File -> Clone Repository -> https://github.com/raogaru/project.git -> Clone

## Install Docker Desktop

Reference: 

https://docs.docker.com/desktop/install/mac-install/

Download Docker.dmg

## Install AWS CLI

Reference: 

https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html

https://awscli.amazonaws.com/AWSCLIV2.pkg

Download AWSCLIV2.pkg

Find AWSCLIV2.pkg on Finder

Execute AWSCLIV2.pkg

which aws

aws --version

## Install Docker

Reference:

https://docs.docker.com/desktop/install/mac-install/

https://docs.docker.com/desktop/install/linux-install/

## Install Terraform

Reference: 

https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli

brew tap hashicorp/tap

brew install hashicorp/tap/terraform

brew update

brew upgrade hashicorp/tap/terraform

terraform version

## Install kubectl

Reference: 

https://kubernetes.io/docs/tasks/tools/install-kubectl-macos/

https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/

brew install kubectl

kubectl version

## Install eksctl

brew install eksctl

eksctl version

## Install Helm

Reference: 

https://helm.sh/docs/intro/install/

brew install helm

helm version

 
## Install Maven

brew install maven

mvn --version


## Create Jenkins server

Reference: 

https://www.jenkins.io/download/lts/macos/

brew install jenkins-lts

brew upgrade jenkins-lts

brew services start jenkins-lts

-- Browse Jenkins server

http://localhost:8080

Enter admin password provided by vagrant-up command

## Configure AWS CLI

Reference:

https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html


aws configure

AWS Access Key ID [None]: EXAMPLERAOGARUINCKEY

AWS Secret Access Key [None]: ExampleRaogaruIncKey/SecretAccessKeyHere

Default region name [None]: us-east-1

Default output format [None]: text

## AWS CLI Usage

Command reference:

https://docs.aws.amazon.com/cli/latest/reference/index.html

aws s3 ls

## Configure Jenkins

### Install Plugins

Reference:

https://www.jenkins.io/doc/book/managing/plugins/

Dashboard -> Manage Jenkins -> Plugins -> Available Plugins

Git
GitHub
Docker Commons
AWS Secrets Manager Credentials Provider


### Configure github password in credentials

Reference:

https://www.jenkins.io/doc/book/using/using-credentials/

Dashboard -> Manage Jenkins ->  Credentials -> System -> Global credentials -> Add Credentials 

Kind: Username with Password
username: <example-username>
Password: <example-password>
ID: <example-id>

### Configure Environment Variables

Reference: 

https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html

Dashboard -> Manage Jenkins ->  System -> Global properties -> Environment Variables -> Add

**Name:** PATH+EXTRA (important to be named this so Jenkins can work with Docker + other technologies)

**Value:** /opt/homebrew/bin

**Name:** AWS_ACCESS_KEY_ID

**Value:** exampleAWSAccessKeyID

**Name:** AWS_SECRET_ACCESS_KEY

**Value:** exampleSecretAccessKey/exampleKeySuffix

**Name:** AWS_ACCOUNT_NUMBER

**Value:** 000000000000

**Name:** AWS_DEFAULT_REGION

**Value:** us-east-1

**Name:** APP1_NAME

**Value:** app1-httpd

**Name:** APP2_NAME

**Value:** app2-nginx

**Name:** APP3_NAME

**Value:** app3-tomcat

**Name:** AWS_ECR_REPO_NAME

**Value:** raogaru-ecr

**Name:** AWS_ECR_URL

**Value:** ${AWS_ACCOUNT_NUMBER}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com

**Name:** AWS_EKS_CLUSTER_NAME

**Value:** raogaru-eks

**Name:** AWS_EKS_ARN

**Value:** arn:aws:eks:${AWS_DEFAULT_REGION}:${AWS_ACCOUNT_NUMBER}:cluster/${AWS_EKS_CLUSTER_NAME}

**Name:** EKS_NAMESPACE

**Value:** production

## Configure Kubectl 

Reference:

https://kubernetes.io/docs/reference/kubectl/cheatsheet/

check current Kubernetes cluster :

kubectl config current-context

use docker-desktop context for development :

kubectl config use-context docker-desktop

use docker-desktop context for production :

kubectl config use-context arn:aws:eks:us-east-1:999999999999:cluster/example-eks-cluster-name

## Create AWS ECR Repository

```
AWS_ECR_REPO_NAME=raogaru-ecr
aws ecr create-repository --region us-east-1 --repository-name $AWS_ECR_REPO_NAME
```

## Create AWS EKS Cluster


##### use terraform to create EKS cluster 

``` 
cd $HOME/GitHub/project/eks/ 
```

##### initialize terraform

```
terraform init
```

##### verify execution plan

```
terraform plan
```

##### kick-off execution

```
terraform apply -auto-approve
```

## Build Application


Build Java code using Maven






## Build Docker Image

Build docker image:

cd project/app1-httpd

docker build -t app1-httpd .

Identify the docker image id:

IMAGE_ID=$(docker images app1-httpd --quiet)

## Push Docker Image to AWS ECR

**Reference:**

https://docs.aws.amazon.com/AmazonECR/latest/userguide/docker-push-ecr-image.html
aw

##### Obtain ECR TOKEN :

> ECR_TOKEN=$(aws ecr get-login-password --region us-east-1)
> 
> AWS_ECR_URL: 999999999999.dkr.ecr.region.amazonaws.com

**Login to ECR with token:**

echo $ECR_TOKEN| docker login --username AWS --password-stdin $AWS_ECR_URL

**Tag the docker image:**

docker tag $IMAGE_ID $AWS_ECR_URL/$AWS_ECR_REPO_NAME:app1-httpd-v1

**Push docker image to ECR:**

docker push $AWS_ECR_URL/$AWS_ECR_REPO_NAME:app1-httpd-v1

## Deploy Docker Image from ECR to EKS Cluster


kubectl config use-context arn:aws:eks:us-east-1:999999999999:cluster/example-eks-cluster-name

cd $HOME/GitHub/project/app1-httpd

- kubectl creaet secret docker-registry regcred \
-   --docker-server=$AWS_ECR_URL \
-   --docker-username=AWS \
-   --docker-password=$(aws ecr get-login-password --region us-east-1) \
-   --namespace=default

kubectl apply -f app1-httpd.yaml

kubectl get services

kubectl get deployment

kubectl get pods

- kubectl port-forward httpd-deployment-xxxxxxxxx-yyyyy 8081:80

access app from localhost:8081
