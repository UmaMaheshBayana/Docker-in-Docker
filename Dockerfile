# Use the official Docker-in-Docker image as the base image
FROM docker:dind

# Install required dependencies
RUN apk --no-cache add ca-certificates curl tar openssl

# Install the Azure CLI
RUN apk add py3-pip
RUN apk add gcc musl-dev python3-dev libffi-dev openssl-dev cargo make
RUN pip install --upgrade pip
RUN pip install azure-cli

# Install PowerShell
RUN apk add --no-cache powershell

# Install Java
RUN apk update
RUN apk add openjdk17 openjdk17-jre
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk

# Install Maven
RUN apk update
RUN apk add wget
RUN wget https://dlcdn.apache.org/maven/maven-3/3.8.8/binaries/apache-maven-3.8.8-bin.tar.gz
RUN tar xf apache-maven-3.8.8-bin.tar.gz -C /opt/
RUN ln -s /opt/apache-maven-3.8.8 /opt/maven
ENV M2_HOME=/opt/maven
ENV MAVEN_HOME=/opt/maven
ENV PATH=${M2_HOME}/bin:${PATH}
