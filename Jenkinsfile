pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                sh '''
                  flutter --version
                  flutter clean
                  flutter pub get
                  flutter build apk
                '''
            }
        }
    }
}
