FROM maven:3.9.4-eclipse-temurin-8-alpine
RUN apk update
RUN apk add git
RUN mkdir -p /usr/local/tomcat/webapps
WORKDIR /tmp
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello
WORKDIR /tmp/boxfuse-sample-java-war-hello
# If the container was restarted but app is already built, then do nothing
CMD if ! [[ -s /usr/local/tomcat/webapps/hello-1.0.war ]]; then \
      mvn package \
      cp target/hello-1.0.war /usr/local/tomcat/webapps/ \
    fi