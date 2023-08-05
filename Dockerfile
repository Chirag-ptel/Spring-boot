FROM --platform=linux/amd64 maven:latest
COPY pom.xml .
COPY src src
RUN mvn clean package
FROM --platform=linux/amd64 openjdk:18
COPY ./target/spring-boot-2-rest-service-basic-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","app.jar"]


# docker build -t sample-springboot-image:latest . && 
# docker tag sample-springboot-image:latest public.ecr.aws/t7b4x5g4/sample-ecr-spbt:latest && 
# aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws/t7b4x5g4 && 
# docker push public.ecr.aws/t7b4x5g4/sample-ecr-spbt:latest