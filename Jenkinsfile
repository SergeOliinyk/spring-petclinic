pipeline {
    agent { label 'maven'}
    options {
        timestamps()
        disableConcurrentBuilds()
    }
    stages {
        stage('Git: Pull') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                sh "mvn spring-boot:build-image"
            }
        }
        stage('Push to ECR') {
            steps {
                sh 'aws ecr get-login-password --region eu-central-1 | docker login --username AWS --password-stdin 203299885394.dkr.ecr.eu-central-1.amazonaws.com'
                sh "docker tag 1db5b2a81bee 203299885394.dkr.ecr.eu-central-1.amazonaws.com/my_app:latest"
                sh "docker push 203299885394.dkr.ecr.eu-central-1.amazonaws.com/my_app:latest"

            }
        }
    }
}