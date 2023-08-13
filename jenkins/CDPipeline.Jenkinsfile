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
        stage("stage 2 run docker container") {
            steps {
                sh """
                    APP_NAME=\${APP1_NAME}
                    LINE="--------------------------------------------------------------------------------"
                    
                    kubectl get namespace
                    kubectl get deployment
                    kubectl get svc
                    kubectl get pods
                    kubectl get deployment -n \${EKS_NAMESPACE}
                    kubectl get svc -n \${EKS_NAMESPACE}
                    kubectl get pods -n \${EKS_NAMESPACE}
                    echo \${LINE}
                    
                    cd \${APP_NAME}
                    kubectl apply -f \${APP_NAME}.yaml # impacts the first deployment
                    kubectl rollout restart deploy \${APP_NAME}-deploy -n \${EKS_NAMESPACE} # impacts all future deployments
                    kubectl get deploy -n \${EKS_NAMESPACE}
                    kubectl get svc -n \${EKS_NAMESPACE}
                    kubectl get pods -n \${EKS_NAMESPACE}
                    echo \${LINE}
                """
            }
        }
    }
}