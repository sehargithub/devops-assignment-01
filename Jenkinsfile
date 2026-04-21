pipeline {
    agent any

    environment {
        IMAGE_NAME = "devops-app"
        SONAR_TOKEN = credentials('sonar-token')
    }

    stages {

        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/sehargithub/devops-assignment-01.git'
            }
        }

        stage('SonarQube Analysis') {
           steps {
            withSonarQubeEnv('sonarqube') {
            sh '''
            docker run --rm \
              --network devops-assignment-01_default \
              -v $(pwd):/usr/src \
              sonarsource/sonar-scanner-cli \
              -Dsonar.projectKey=DevOps-App \
              -Dsonar.sources=. \
              -Dsonar.host.url=$SONAR_HOST_URL \
              -Dsonar.login=$SONAR_TOKEN
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
        sh '''
        docker rm -f devops-container || true
        docker run -d \
          --name devops-container \
          -p 3000:3000 \
          devops-app
        '''
    }
  }
 }
}

