pipeline {
    agesnt any
    environment {
        MYSQL_ROOT_PASSWORD = credentials("MY_ROOT_PASSWORD")

    }
    stages {
        stage("Build") {
            steps {
                sh "docker-compose build  --parallel" 
            }

        }
        stage("Push"){
            steps {
                sh "docker-compose push"
            }
        }
        stage("Deploy"){
            steps {
                sh "docker-compose up -d"
            }
        }
    }
}