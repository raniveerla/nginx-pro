pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                git 'https://github.com/raniveerla/nginx-pro.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t nginx-app:latest .'
                }
            }
        }

        stage('Test Container') {
            steps {
                script {
                    sh 'docker run -d --name test-nginx -p 8080:80 nginx-app:latest'
                    sh 'sleep 5'
                    sh 'curl -I http://localhost:8080 | grep "200 OK"'
                    sh 'docker stop test-nginx && docker rm test-nginx'
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    sh 'docker-compose up -d'
                }
            }
        }
    }
}

