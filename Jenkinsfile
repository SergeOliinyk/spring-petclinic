pipeline {
    agent any {
        tools{
            maven 'maven_3_8_7'
        }
    }
    stages {  
      stage('Clone repository') {
            steps {
                url: 'git@github.com:SergeOliinyk/spring-petclinic.git'
                git branch: 'main'
            }
        }
        stage ('Build docker image') {
            steps {
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'mykey_from-jenkins', url: 'git@github.com:SergeOliinyk/spring-petclinic.git']])
                sh './mvn spring-boot:build-image'
            }
        }
    }
}
