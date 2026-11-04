pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build User Service') {
            steps {
                sh 'docker build -t user-service:v1 user-service/'
            }
        }

        stage('Build Product Service') {
            steps {
                sh 'docker build -t product-service:v1 product-service/'
            }
        }

        stage('Build Order Service') {
            steps {
                sh 'docker build -t order-service:v1 order-service/'
            }
        }

        stage('Verify Images') {
            steps {
                sh 'docker images'
            }
        }

        stage('Deploy') {
            steps {
                sh 'docker compose up -d'
            }
        }

        stage('Health Check') {
            steps {
                sh 'curl http://localhost/user'
                sh 'curl http://localhost/product'
                sh 'curl http://localhost/order'
            }
        }
    }
}
