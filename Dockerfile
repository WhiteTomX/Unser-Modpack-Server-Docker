FROM alpine:latest

# Install dependencies
RUN apk update \
    && apk add --no-cache unzip openjdk8-jre bash

RUN mkdir -p /opt/minecraft
WORKDIR /opt/minecraft
COPY start.sh ./start.sh
COPY server.zip ./server.zip
RUN unzip -qq server.zip && rm server.zip
RUN echo "eula=true" > eula.txt

EXPOSE 25565


ENTRYPOINT ["java","-Xms1024M","-Xmx2048M","-jar","forge-1.12.2-14.23.5.2838-universal.jar"]
