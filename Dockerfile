FROM eclipse-temurin:21-jdk AS build_stage
WORKDIR ./src/main/kotlin/com/example/hyperwebapp
RUN javac HyperWebAppApplication.kt
RUN jar cf hyper-web-app.jar HyperWebAppApplication.class

FROM eclipse-temurin:21-jdk AS run_stage
ARG JAR_FILE_LOCATION=target/*.jar
COPY ${JAR_FILE_LOCATION} hyper-web-app.jar
ENTRYPOINT ["java", "-jar", "/hyper-web-app.jar"]