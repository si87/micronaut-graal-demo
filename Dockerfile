FROM oracle/graalvm-ce:19.3.1-java11 as graalvm
RUN gu install native-image

COPY . /home/app/micronaut-graal-demo
WORKDIR /home/app/micronaut-graal-demo

RUN native-image --no-server --enable-http --enable-https --enable-all-security-services --static -cp build/libs/micronaut-graal-demo-*-all.jar

FROM scratch
EXPOSE 8080
COPY --from=graalvm /home/app/micronaut-graal-demo/micronaut-graal-demo /app/micronaut-graal-demo
ENTRYPOINT ["/app/micronaut-graal-demo", "-Djava.library.path=/app"]
