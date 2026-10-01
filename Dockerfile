FROM tomcat:11-jdk17-temurin
COPY target/PaymentGatewayExample-1.0.war /usr/local/tomcat/webapps/ROOT.war
CMD ["catalina.sh", "run"]