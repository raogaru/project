pipeline {
    agent any
    stages {
        stage("stage 1 - git SCM") {
            steps {
                git branch: 'main',
                    credentialsId: 'raogaru-github',
                    url: 'git@github.com:raogaru/project.git'
            }
        }
        stage("stage 2 - create EKS cluster") {
            steps {
                sh """
                    cd eks
                    terraform init
                    terraform plan
                    terraform apply -auto-approve
                    
                    aws eks update-kubeconfig --region \${AWS_DEFAULT_REGION} --name \${AWS_EKS_CLUSTER_NAME}
                    kubectl get namespace
                    kubectl create namespace \${EKS_NAMESPACE}
                    kubectl get namespace
                """
            }
        }
    }
}