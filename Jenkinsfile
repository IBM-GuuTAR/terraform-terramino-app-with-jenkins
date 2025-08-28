pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {        
                git "https://github.com/IBM-GuuTAR/terraform-terramino-app-with-jenkins"
                sh "cd terraform"
            }
        }
        stage('Terraform init') {
            steps {
                sh 'terraform init'
            }
        }
        stage('Terraform apply') {
            steps {
                sh 'terraform apply --auto-approve'
            }
        }
    }
}
