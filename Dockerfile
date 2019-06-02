FROM tomcat:8

# Take the war and copy to webapps of tomcat

COPY /var/lib/jenkins/workspace/DockerPipeline/examples/feed-combiner-java8-webapp/target/devops.war /usr/local/tomcat/webapps/

# Added for jenkins demo
