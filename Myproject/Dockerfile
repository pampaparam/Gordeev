FROM eclipse-temurin:25

COPY . /java

WORKDIR /java

EXPOSE 7878

RUN javac Main.java

CMD [ "java", "Main" ]