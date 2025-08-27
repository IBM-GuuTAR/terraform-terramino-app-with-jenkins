pipeline {
    agent any

    stages {
        stage('Install Package') {
            steps {
                git "https://github.com/IBM-GuuTAR/terraform-terramino-app-with-jenkins"
                sh '''
                chmod +x ./php-init.sh
                ./php-init.sh
                '''
            }
        }
    }
}
