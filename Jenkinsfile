pipeline {
    agent any
    
    stages {
        stage('Install Package') {
            steps {
                
                git "https://github.com/IBM-GuuTAR/terraform-terramino-app-with-jenkins"
                // Make sure the script is executable
                sh 'chmod +x php-init.sh'
                // Run the script with the specified port
                sh './php-init.sh'
            }
        }
    }
}
