# Stage 1: Build ứng dụng Java
FROM maven:3.9.9-eclipse-temurin-17 AS build

WORKDIR /app

COPY pom.xml .
COPY src ./src

RUN mvn clean package -DskipTests

# Stage 2: Chạy ứng dụng trên Tomcat
FROM tomcat:11-jdk17-temurin

COPY --from=build /app/target/PaymentGatewayExample-1.0.war /usr/local/tomcat/webapps/ROOT.war

CMD ["catalina.sh", "run"]