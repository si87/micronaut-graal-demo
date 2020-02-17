FROM oracle/graalvm-ce:19.3.1-java11 as graalvm
RUN gu install native-image

COPY . /home/app/micronaut-graal-demo
WORKDIR /home/app/micronaut-graal-demo

RUN native-image --no-server -cp build/libs/micronaut-graal-demo-*-all.jar

FROM frolvlad/alpine-glibc
RUN apk update && apk add libstdc++
EXPOSE 8080
COPY --from=graalvm /home/app/micronaut-graal-demo/micronaut-graal-demo /app/micronaut-graal-demo
ENTRYPOINT ["/app/micronaut-graal-demo"]
