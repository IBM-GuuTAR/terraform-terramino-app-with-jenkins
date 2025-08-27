pipeline {
    agent any

    stages {
        stage('Install Package') {
            steps {
                git "https://github.com/IBM-GuuTAR/terraform-terramino-app-with-jenkins"
                sh '''
                # Set your desired port here
                APACHE_PORT=4000
                
                # Update packages
                sudo apt update -y
                sudo apt upgrade -y
                
                # Remove existing Apache if present
                sudo apt remove -y apache2
                
                # Install Apache, PHP, and MySQL server
                sudo apt install -y apache2 php libapache2-mod-php mysql-server php-mysql
                
                # Update Apache to listen on the specified port
                sudo sed -i "s/Listen 80/Listen $APACHE_PORT/" /etc/apache2/ports.conf
                sudo sed -i "s/<VirtualHost \*:80>/<VirtualHost \*:$APACHE_PORT>/" /etc/apache2/sites-available/000-default.conf
                
                # Start and enable Apache service
                sudo systemctl start apache2
                sudo systemctl enable apache2
                
                # Add the ubuntu user to the www-data group
                sudo usermod -a -G www-data ubuntu
                
                # Set permissions for /var/www
                sudo chown -R ubuntu:www-data /var/www
                sudo chmod 2775 /var/www
                find /var/www -type d -exec sudo chmod 2775 {} \;
                find /var/www -type f -exec sudo chmod 0664 {} \;
                
                # Download the index.php file
                cd /var/www/html
                sudo curl -O https://raw.githubusercontent.com/hashicorp/learn-terramino/main/index.php
                
                # Restart Apache to apply changes
                sudo systemctl restart apache2
                '''
            }
        }
    }
}
