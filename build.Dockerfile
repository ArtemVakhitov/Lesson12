FROM maven:3.6.3-jdk8
# Don't update just in case to avoid incompatibilities
RUN apk add git
RUN mkdir -p /usr/local/tomcat/webapps
WORKDIR /tmp
RUN git clone https://github.com/shephertz/App42PaaS-Java-MySQL-Sample.git
WORKDIR /tmp/App42PaaS-Java-MySQL-Sample
COPY Config.properties WebContent/Config.properties
# If the container was restarted but app is already built, then do nothing
CMD mvn package; cp target/App42PaaS-Java-MySQL-Sample-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/