pipeline {
    agent any
    stages {
        stage("stage 1 git scm") {
            steps {
                git branch: 'main',
                    credentialsId: 'raogaru-github',
                    url: 'git@github.com:raogaru/project.git'
            }
        }
        stage("stage 2 build/push docker image") {
            steps {
                sh """
                    APP_NAME=\${APP1_NAME}
                    LINE="--------------------------------------------------------------------------------"

                    echo \${APP_NAME}
                    cd \${APP_NAME}
                    docker build -t \${APP_NAME} .
                    IMAGE_ID=\$(docker images \${APP_NAME} --quiet)
                    echo \${IMAGE_ID}
                    ECR_TOKEN=\$(aws ecr get-login-password --region \${AWS_DEFAULT_REGION})
                    echo \${ECR_TOKEN} | docker login --username AWS --password-stdin \$AWS_ECR_URL
                    docker tag \${IMAGE_ID} \${AWS_ECR_URL}/\${AWS_ECR_REPO_NAME}:\${APP_NAME}
                    docker push \${AWS_ECR_URL}/\${AWS_ECR_REPO_NAME}:\${APP_NAME}
                    aws ecr list-images --region \${AWS_DEFAULT_REGION} --repository-name \${AWS_ECR_REPO_NAME}
                    echo \${LINE}
                    
                    aws eks update-kubeconfig --region \${AWS_DEFAULT_REGION} --name \${AWS_EKS_CLUSTER_NAME}
                    kubectl get svc
                    echo \${LINE}
                    
                    kubectl config get-contexts
                    kubectl config current-context
                    kubectl config use-context \${AWS_EKS_ARN}
                    kubectl config get-contexts
                    kubectl config current-context
                    kubectl explain pods
                    echo \${LINE}
                    
                    kubectl get namespace
                    kubectl get deploy -n \${EKS_NAMESPACE}
                    kubectl get svc -n \${EKS_NAMESPACE}
                    kubectl get pods -n \${EKS_NAMESPACE}
                    echo \${LINE}
                """
            }
        }
    }
}