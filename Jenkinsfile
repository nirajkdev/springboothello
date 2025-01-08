pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'nirajkdev/hellospring' // Docker Hub username and repository name
        DOCKER_TAG = 'latest' // You can use the version or build number here if you prefer
        DOCKER_CREDENTIALS = 'dockerhub-credentials' // The ID of the Docker Hub credentials stored in Jenkins
    }

    stages {
        stage('Clone') {
            steps {
                git 'https://github.com/nirajkdev/springboothello.git' // Replace with your actual repo URL
            }
        }

        stage('Build') {
            steps {
                script {
                    // Build the Spring Boot application
                    sh 'mvn clean install'
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image using the Dockerfile
                    sh 'docker build -t ${DOCKER_IMAGE}:${DOCKER_TAG} .'
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    // Log in to Docker Hub using credentials stored in Jenkins
                    withCredentials([usernamePassword(credentialsId: '${DOCKER_CREDENTIALS}', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        sh 'echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin'
                    }

                    // Push the Docker image to Docker Hub
                    sh 'docker push ${DOCKER_IMAGE}:${DOCKER_TAG}'
                }
            }
        }
    }

    post {
        always {
            // Optional: Clean up by logging out from Docker
            sh 'docker logout'
        }
    }
}
