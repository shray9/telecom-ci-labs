pipeline {
    agent { label 'docker-agent-1' }

    environment {
        EIFFEL_DIR = "eiffel/events"
    }

    stages {

        stage('Eiffel Activity Started') {
            steps {
                sh '''
                ./scripts/eiffel_event.sh EiffelActivityStartedEvent
                '''
            }
        }

        stage('Telecom Build') {
            steps {
                sh '''
                echo "Building Ericsson Telecom Module"
                mkdir -p build
                echo "Telecom Binary Data" > build/telecom.bin
                '''
            }
        }

        stage('Eiffel Artifact Created') {
            steps {
                sh '''
                ./scripts/eiffel_event.sh EiffelArtifactCreatedEvent
                '''
            }
        }

        stage('Archive Artifact') {
            steps {
                archiveArtifacts artifacts: 'build/*.bin'
            }
        }
    }

    post {
        success {
            sh '''
            ./scripts/eiffel_event.sh EiffelActivityFinishedEvent
            '''
        }
    }
}

