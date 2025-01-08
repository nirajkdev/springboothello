pipeline {
    agent any  // This will run on any available Jenkins agent
    stages {
        stage('Clone Repository') {
            steps {
                // Clone your Git repository
                git 'https://github.com/nirajkdev/springboothello.git'
            }
        }
        stage('Build Project') {
            steps {
                // Build the Spring Boot project using Maven
                sh 'mvn clean package -DskipTests'  // Skips tests for faster builds
            }
        }
    }
}
