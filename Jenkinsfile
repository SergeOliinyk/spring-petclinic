pipeline {
    agent { label 'maven'}
    options {
        timestamps()
        disableConcurrentBuilds()
    }
    environment { 
        ERC = "203299885394.dkr.ecr.eu-central-1.amazonaws.com"
    }
    stages {
        stage('Git: Pull') {
            steps {
                checkout scm
            }
        }
        
        stage('Test') {
            steps {
                sh "mvn test"
            }
        }

        stage ('Build .jar file') {
            steps {
                sh './mvnw package'
            }
        }

        stage('Build Docker') {
            steps {
                sh "docker build -t spring-petclinic:latest ."
            }
        }
        stage('Push to ECR') {
            steps {
                sh "aws ecr get-login-password --region eu-central-1 | docker login --username AWS --password-stdin ${ERC}"
                sh "docker tag docker.io/library/spring-petclinic:3.0.0-SNAPSHOT ${ERC}/my_app:${env.BUILD_NUMBER}"
                sh "docker push ${ERC}/my_app:latest"

            }
        }
    }
}
