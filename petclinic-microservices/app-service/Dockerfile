FROM eclipse-temurin:21-jre-alpine
WORKDIR /app
COPY target/app-service-1.0.0.jar app.jar
EXPOSE 8084
ENTRYPOINT ["java", "-jar", "app.jar"]