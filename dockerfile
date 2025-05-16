pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                script {
                    // Build the Docker image
                    sh 'docker build -t my-node-app .'
                }
            }
        }
        stage('Test') {
            steps {
                script {
                    // Run tests inside the container
                    sh 'docker run --rm my-node-app npm test'
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    // Deploy the application (e.g., push to a registry)
                    sh 'docker push my-node-app'
                }
            }
        }
    }
}
