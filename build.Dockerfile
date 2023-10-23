FROM maven:3.6.3-jdk-8
RUN apt-get install git -y
RUN mkdir -p /usr/local/tomcat/webapps
WORKDIR /tmp
RUN git clone https://github.com/shephertz/App42PaaS-Java-MySQL-Sample.git
WORKDIR /tmp/App42PaaS-Java-MySQL-Sample
COPY Config.properties WebContent/Config.properties
CMD mvn clean; mvn install; cp target/App42PaaS-Java-MySQL-Sample-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/