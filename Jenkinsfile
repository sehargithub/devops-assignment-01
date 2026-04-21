pipeline {
    agent any

    environment {
        IMAGE_NAME = "devops-app"
    }

    stages {

       stage('Checkout Code') {
         steps {
           git branch: 'main', url: 'https://github.com/sehargithub/devops-assignment-01.git'
          }
       }
        stage('Install Sonar Scanner') {
            steps {
                sh '''
                apt update
                apt install -y nodejs npm
                npm install -g sonar-scanner
                '''
            }
        }

        stage('SonarQube Analysis') {
         steps {
            withSonarQubeEnv('sonarqube') {
            sh '''
            docker run --rm \
              -e SONAR_HOST_URL=$SONAR_HOST_URL \
              -e SONAR_LOGIN=$SONAR_AUTH_TOKEN \
              -v $(pwd):/usr/src \
              sonarsource/sonar-scanner-cli
            '''
        }
    }
}
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME ./app'
            }
        }

        stage('Run Container') {
            steps {
                sh 'docker run -d $IMAGE_NAME'
            }
        }
    }
}
