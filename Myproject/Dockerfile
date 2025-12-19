FROM eclipse-temurin:latest

WORKDIR /app

COPY . .

RUN ls -la

RUN javac Main.java

RUN ls -la *.class

CMD [ "java", "Main" ]
