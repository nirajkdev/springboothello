pipeline {
    agent any
    stages {
        stage('Clone Repository') {
            steps {
                // Ensure the correct branch (main or master)
                git branch: 'main', url: 'https://github.com/nirajkdev/springboothello.git'
            }
        }
        stage('Build Project') {
            steps {
                // Build the project using Maven
                sh 'mvn clean package -DskipTests'
            }
        }
    }
}

