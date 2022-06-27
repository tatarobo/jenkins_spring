FROM maven:3.6-adoptopenjdk-11

RUN apt-get update
RUN apt-get install libaio1
RUN apt install -y libncurses5

COPY ./target/jenkins_spring*.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]
