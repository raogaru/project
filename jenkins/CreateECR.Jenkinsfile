pipeline {
    agent any
    stages {
        stage("stage 1 - create ECR repository") {
            steps {
                sh "aws ecr create-repository --region us-east-1 --repository-name raogaru-ecr"
            }
        }
    }
}