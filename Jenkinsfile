pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {        
                git "https://github.com/IBM-GuuTAR/terraform-terramino-app-with-jenkins"               
            }
        }
        stage('Terraform init') {
            steps {
                sh "cd terraform"
                sh "pwd"
                sh "ls -la"
                sh 'terraform init'
            }
        }
        stage('Terraform apply') {
            steps {
                sh "cd terraform"
                sh "pwd"
                sh "ls -la"
                sh 'terraform apply --auto-approve'
            }
        }
    }
}
