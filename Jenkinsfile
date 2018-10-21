pipeline {
    agent {
        label "master"
    }
    tools {
        maven 'Maven3'

    }
    stages {
        stage ('Initialize') {
            steps {
                sh '''
                    echo "PATH = $PATH"
                    echo "M2_HOME = $M2_HOME"
                '''
            }
        }

        stage ('Checkout') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/DPLExample']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/devops81/DevOps-Demo.git']]])
                
            }
        }
        
        stage ('Build the project') {
            steps {
                dir("/var/lib/jenkins/workspace/Miscelleneous/10212018/examples/feed-combiner-java8-webapp") {
             sh 'mvn clean install'
                }
                
            }
        }
          stage ('Generate JUNIT REPORT') {
              parallel {
                  stage('Junit report generation'){
            steps {
                junit 'examples/feed-combiner-java8-webapp/target/surefire-reports/*.xml'
                
            }
                  }
                  stage('Email notification for Junit report') {
                     steps {
                emailext body: 'Junit reporting getting archived', subject: 'junit update', to: 'devops81@gmail.com'
                     }
                     }
            } 
        }
        stage ('Deploy the application') {
            steps {
               
                sh '/bin/cp  -rf  /var/lib/jenkins/workspace/Miscelleneous/10212018/examples/feed-combiner-java8-webapp/target/devops.war /home/ec2-user/tomcat/apache-tomcat-9.0.12/webapps/'
                
            }
        }
        stage ('Send out email Notification') {
            steps {
                emailext body: '$DEFAULT_CONTENT', subject: '$DEFAULT_SUBJECT', to: 'devops81@gmail.com'

                
            }
        }
        }
       
                      
}

