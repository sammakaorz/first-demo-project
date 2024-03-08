FROM maven:latest AS build
COPY src /home/app/src
COPY pom.xml /home/app
RUN mvn -B package --file /home/app/pom.xml


FROM openjdk:17
COPY --from=build /home/app/target/first-demo-project-0.0.1-SNAPSHOT.jar /usr/local/lib/demo.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/usr/local/lib/demo.jar"]
