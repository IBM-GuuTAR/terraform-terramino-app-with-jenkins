pipeline {
    agent any

    stages {
        stage('Install Package') {
            steps {
                git "https://github.com/IBM-GuuTAR/terraform-terramino-app-with-jenkins"
                bat "sh php-init.sh"
            }
        }
    }
}
