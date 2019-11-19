// Obtaining an Artifactory server instance defined in Jenkins:
			
def server = Artifactory.server 'ARTI-123'

		 //If artifactory is not defined in Jenkins, then create on:
		// def server = Artifactory.newServer url: 'Artifactory url', username: 'username', password: 'password'

//Create Artifactory Maven Build instance
def rtMaven = Artifactory.newMavenBuild()

def buildInfo

pipeline {
    agent any

	tools {
		jdk "JAVA8"
		maven "Maven3"
	}

    stages {
        stage('Clone sources'){
            steps {
                git url: 'https://github.com/devops81/DevOps-Demo.git'
            }
        }

 stage('Execute Maven') {
		steps {
		   script {
		
		rtMaven.run pom: '/var/lib/jenkins/workspace/Javapipeline/examples/feed-combiner-java8-webapp/pom.xml', goals: 'clean install', buildInfo: buildInfo
			}
		}
		
 }
	    stage('Publish JUNIT')
	    {
		    steps { junit 'examples/feed-combiner-java8-webapp/target/surefire-reports/*.xml'
			  }
	    }
	    
stage('Sonarqube') {
	
    environment {
        scannerHome = tool 'SonarScan'
    }
    steps {
	  
        withSonarQubeEnv('SonarServer') {
             sh "${scannerHome}/bin/sonar-scanner"
        }
        
    }
}

//	stage('Quality Gate') {
//		steps {
//			timeout(time: 1, unit: 'HOURS') {
			//Parameter indicates wether to set pipeline to UNSTABLE if Quality Gate fails
		        // true = set pipeline to UNSTABLE, false = don't
			// Requires SonarQube Scanner for Jenkins 2.7+
//			waitForQualityGate abortPipeline: false
//		       }
//		 }
//	}

	stage('Artifactory configuration') {
		
	   steps {
		script {
			rtMaven.tool = 'Maven3' //Maven tool name specified in Jenkins configuration
		
			rtMaven.deployer releaseRepo: 'libs-release-local', snapshotRepo: 'libs-snapshot-local', server: server //Defining where the build artifacts should be deployed to
			
			rtMaven.resolver releaseRepo:'libs-release', snapshotRepo: 'libs-snapshot', server: server //Defining where Maven Build should download its dependencies from
			
			rtMaven.deployer.artifactDeploymentPatterns.addExclude("pom.xml") //Exclude artifacts from being deployed
			
			//rtMaven.deployer.deployArtifacts =false // Disable artifacts deployment during Maven run
		    
			buildInfo = Artifactory.newBuildInfo() //Publishing build-Info to artifactory
			
			buildInfo.retention maxBuilds: 10, maxDays: 7, deleteBuildArtifacts: true

			buildInfo.env.capture = true
			}
	    }
	}
	    
	   

	stage('Publish build info') {
		steps {
		  script {

		server.publishBuildInfo buildInfo
		}
		}
	}
	    stage('run-parallel-branches') {
  steps {
    parallel(
      a: {
        echo "This is branch a"
      },
      b: {
        echo "This is branch b"
      }
    )
  }
}
	   
}
	 post {
       // only triggered when blue or green sign
       fixed {
           slackSend channel: 'stickynotes', color: 'good', iconEmoji: '', message: "started ${env.JOB_NAME}  ${env.BUILD_NUMBER} ${env.BUILD_URL}", teamDomain: 'devops81', tokenCredentialId: 'slacksec', username: 'devops81'
       }
       // triggered when red sign
       failure {
           slackSend channel: 'stickynotes', color: 'danger', iconEmoji: '', message: "started ${env.JOB_NAME}  ${env.BUILD_NUMBER} ${env.BUILD_URL}", teamDomain: 'devops81', tokenCredentialId: 'slacksec', username: 'devops81'
       }
       // trigger every-works
       always {
           slackSend channel: 'stickynotes', color: 'warning', iconEmoji: '', message: "Always message", teamDomain: 'devops81', tokenCredentialId: 'slacksec', username: 'devops81'
       }
    }
}
