FROM java:8-jre-alpine

RUN apk update && apk add --no-cache curl git python3
RUN pip3 install --upgrade pip pylint setuptools

WORKDIR /root

ARG LATEST

RUN env && \
curl --insecure -OL 'https://sonarsource.bintray.com/Distribution/sonar-scanner-cli/'$LATEST.zip && \
unzip $LATEST.zip && rm $LATEST.zip

ENV SONAR_RUNNER_HOME=/root/$LATEST
ENV PATH $PATH:/root/$LATEST/bin

CMD sonar-scanner -Dsonar.projectBaseDir=./src
