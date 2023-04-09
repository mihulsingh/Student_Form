FROM tomcat:9.0-jdk15
COPY assignment.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh", "run"]
