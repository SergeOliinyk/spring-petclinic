FROM anapsix/alpine-java

LABEL maintainer="shanem@liatrio.com"

ARG JAR=spring-petclinic-*.jar

COPY target/$JAR /home/.jar

CMD [ "dump-init" "java" "-jar" "/home/.jar" ]