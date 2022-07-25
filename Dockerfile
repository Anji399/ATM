FROM openjdk:11.015
ADD target/ATM_example-1.0-SNAPSHOT.jar ATM_example-1.0-SNAPSHOT.jar
EXPOSE 80
CMD ["java", "-jar", "ATM_example-1.0-SNAPSHOT.jar"]

