FROM alpine:latest

# Install dependencies
RUN apk update \
    && apk add --no-cache unzip openjdk8-jre bash curl tar

RUN mkdir -p /opt/minecraft
WORKDIR /opt/minecraft
RUN curl https://github.com/WhiteTomX/Unser-Modpack-Server/archive/v1.4.0.tar.gz | tar -xjC /opt/minecraft

RUN echo "eula=true" > eula.txt

EXPOSE 25565
VOLUME /opt/minecraft/world


ENTRYPOINT ["java","-Xms1024M","-Xmx2048M","-jar","forge-1.12.2-14.23.5.2838-universal.jar"]
