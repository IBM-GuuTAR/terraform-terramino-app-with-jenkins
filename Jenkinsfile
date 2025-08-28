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
                sh 'terraform init'
            }
        }
        stage('Terraform apply') {
            steps {
                sh "cd terraform"
                sh 'terraform apply --auto-approve'
            }
        }
    }
}
