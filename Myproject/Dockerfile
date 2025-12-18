FROM eclipse-temurin:latest

COPY . /java

WORKDIR /java

EXPOSE 8001

RUN javac com/itproger/Main.java

CMD ["java", "Main"]
