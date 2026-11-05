pipeline {
    agent any

    environment {
        AWS_REGION = 'us-east-1'
        AWS_ACCOUNT_ID = '116248807916'
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('ECR Login') {
            steps {
                sh '''
                aws ecr get-login-password --region $AWS_REGION | \
                docker login --username AWS --password-stdin \
                $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com
                '''
            }
        }

        stage('Build Images') {
            steps {
                sh '''
                docker build -t user-service:v1 user-service/
                docker build -t product-service:v1 product-service/
                docker build -t order-service:v1 order-service/
                '''
            }
        }

        stage('Tag Images') {
            steps {
                sh '''
                docker tag user-service:v1 $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/user-service:v1
                docker tag product-service:v1 $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/product-service:v1
                docker tag order-service:v1 $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/order-service:v1
                '''
            }
        }

        stage('Push To ECR') {
            steps {
                sh '''
                docker push $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/user-service:v1

                docker push $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/product-service:v1

                docker push $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/order-service:v1
                '''
            }
        }

        stage('Deploy') {
            steps {
                sh '''
                docker compose down || true
                docker compose up -d
                '''
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
