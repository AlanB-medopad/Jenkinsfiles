pipeline {
    agent any
    parameters {
        choice(choices: ['QA', 'DEMO','PROD'], description: 'Which AWS account do you want to use?', name: 'ACCOUNT')
        choice(choices: ['EU (EU-WEST-1)', 'US (US-WEST-2)'], description: 'What AWS region do you want to use?', name: 'REGIONS')
        credentials (name: 'Credentials',description: 'Credentials for all accounts')
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