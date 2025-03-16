#Sets the JDK image to be used for building the application
FROM eclipse-temurin:21-jdk AS build_stage
#Sets the working directory to /app folder located inside the container
WORKDIR /app
#Copies the required files to the /app folder located inside the container
COPY gradlew gradlew.bat /app/
COPY gradle /app/gradle
COPY build.gradle settings.gradle /app/
COPY src /app/src
#Adds executable permission for the Gradle Wrapper
RUN chmod +x gradlew
#Builds the application
RUN ./gradlew bootJar --no-daemon

#Sets the JRE image to be used for running the application
FROM eclipse-temurin:21-jre AS run_stage
#Sets the working directory to /app folder located inside the container
WORKDIR /app
#Copies the .jar file generated during the build stage to the /app folder of the container
COPY --from=build_stage /app/build/libs/hyper-web-app-0.0.1-SNAPSHOT.jar /app/app.jar
#Exposes port 8080
EXPOSE 8080
#Sets the command to run the application
ENTRYPOINT ["java", "-jar", "app.jar"]