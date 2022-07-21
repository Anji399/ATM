FROM ubuntu:22.04
ADD target/ATM_example-1.0-SNAPSHOT.jar ATM_example-1.0-SNAPSHOT.jar
EXPOSE 80
ENTRYPOINT ["java", "-jar", "ATM_example-1.0-SNAPSHOT.jar"]
ENV CI=true
CMD exec /bin/sh -c "trap : TERM INT; sleep 99999999999d & wait"
