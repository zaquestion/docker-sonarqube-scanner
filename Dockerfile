FROM openjdk:slim

RUN apt update && apt install -y curl python3-pip unzip
RUN pip3 install --upgrade pip pylint setuptools

WORKDIR /root

ARG LATEST

RUN env && \
curl --insecure -OL 'https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/'$LATEST.zip && \
mkdir sonar_scanner && unzip -d sonar_scanner $LATEST.zip && mv sonar_scanner/* sonar_home && rm -rf sonar_scanner $LATEST.zip

ENV SONAR_RUNNER_HOME=/root/sonar_home
ENV PATH ${SONAR_RUNNER_HOME}/bin:$PATH

CMD sonar-scanner -Dsonar.projectBaseDir=./src
