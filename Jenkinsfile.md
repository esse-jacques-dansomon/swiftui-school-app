pipeline {
    agent any

    environment {
        // Define any environment variables here
        SCHEME = 'SchoolApp'
        DESTINATION = 'platform=iOS Simulator,name=iPhone 15 Pro Max,OS=17.5'
        CONFIGURATION = 'Debug'
        SDK = 'iphonesimulator'
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from the repository
                checkout scm
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'pod install'
            }
        }

        stage('Build') {
            steps {
                // Build the project
                sh '''
                xcodebuild clean build \
                    -workspace ${SCHEME}.xcworkspace \
                    -scheme ${SCHEME} \
                    -configuration ${CONFIGURATION} \
                    -sdk ${SDK} \
                    -destination "${DESTINATION}" \
                    CODE_SIGNING_ALLOWED=NO
                '''
            }
        }

        stage('Run Tests') {
            steps {
                // Run the tests
                sh '''
                xcodebuild test \
                    -workspace ${SCHEME}.xcworkspace \
                    -scheme ${SCHEME} \
                    -configuration ${CONFIGURATION} \
                    -sdk ${SDK} \
                    -destination "${DESTINATION}" \
                    CODE_SIGNING_ALLOWED=NO
                '''
            }
        }
    }

    post {
        always {
            // Archive test results and build artifacts
            junit '**/Logs/Test/*.xcresult/2_Test/*.plist'
            archiveArtifacts artifacts: '**/Build/**/*.app', allowEmptyArchive: true
        }

        failure {
            // Send notifications or perform other failure actions
            echo 'Build failed!'
        }

        success {
            // Perform any actions needed on success
            echo 'Build succeeded!'
        }
    }
}

