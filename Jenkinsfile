pipeline {
    agent {
        label "master"
    }
    tools {
        maven 'mvn3'

    }
    stages {
      

        stage ('Checkout') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/DPLExample']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/devops81/DevOps-Demo.git']]])
                
            }
        }
        
        stage ('Build the project') {
           

            steps {
                def mvnHome = tool name: 'MVN3', type: 'maven'
dir('d:/JHOME/workspace/pipeline example/examples/feed-combiner-java8-webapp')
{ 
             bat "${mvnHome}/bin/mvn clean install"}
                }
                
            }
        }
          stage ('Generate JUNIT REPORT') {
             steps {
                  parallel ( 
                      'Archeiving the reports': 
            {
                junit 'examples/feed-combiner-java8-webapp/target/surefire-reports/*.xml'
                
            },
                      'Sending out the JUNIT report' :
                      {                  
                         emailext body: 'Junit reporting getting archived', subject: 'junit update', to: 'devops81@gmail.com'
                     }
                     )
            } 
        }
        stage ('Deploy the application') {
            steps {
               
                echo "here we can deply hte app"
                
            }
        }
        stage ('Send out email Notification') {
            agent {
                label "devops12"
            }
            steps {
                emailext body: '$DEFAULT_CONTENT', subject: 'email1', to: 'devops81@gmail.com'

                
            }
        }
       
    }
}	
                      

