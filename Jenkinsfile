pipeline {
    agent any
    tools{
        "maven 3.8.7"
    }


    stages {
        stege('Clone repository') {
            url: 'https://github.com/SergeOliinyk/spring-petclinic.git'
                git branch: 'main'
    }
        stage('Build Maven Docker image') {
            steps {
                script {
                    sh "mvn -version"
                    echo "-Building Docker image-"
                    sh "mvn spring-boot:build-image"
                }
                
            }
        }
        stage('Push Docker image in AWS ECR') {
            steps {

            }
        }
    // start always with fresh workspace
    post {
        always {
            cleanWs()
            }
        }
    }
}
