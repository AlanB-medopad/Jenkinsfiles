pipeline {
    agent any
    parameters {
        choice(choices: ['US-EAST-1', 'US-WEST-2'], description: 'What AWS region?', name: 'region')
        credentials (name: 'QA-EU',defaultvalue 'QA-EU',description: 'QA-EU')
        credentials (name: 'QA-US',description: 'QA-US')
    }
    stages {
        stage('Example') {
            environment { 
                DEBUG_FLAGS = '-g'
            }
            steps {
                sh 'printenv'
            }
        }
    }
}