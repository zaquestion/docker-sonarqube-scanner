FROM java:16-jdk-alpine3.12

RUN apk update && apk add --no-cache curl git python3
RUN pip3 install --upgrade pip pylint setuptools

WORKDIR /root

ARG LATEST

RUN env && \
curl --insecure -OL 'https://sonarsource.bintray.com/Distribution/sonar-scanner-cli/'$LATEST.zip && \
mkdir sonar_scanner && unzip -d sonar_scanner $LATEST.zip && mv sonar_scanner/* sonar_home && rm -rf sonar_scanner $LATEST.zip

ENV SONAR_RUNNER_HOME=/root/sonar_home
ENV PATH ${SONAR_RUNNER_HOME}/bin:$PATH

CMD sonar-scanner -Dsonar.projectBaseDir=./src
