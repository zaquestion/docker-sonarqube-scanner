# Deprecated

Originally when this project was made there wasn't an official image and there were issues with newtmitch's version (circa 2016), which have since be resolved. I will review/merge PR's made here for those using this project, however I recommend using the better maintained alternatives:
* https://hub.docker.com/r/sonarsource/sonar-scanner-cli
* https://hub.docker.com/r/newtmitch/sonar-scanner

# docker-sonarqube-scanner

runs sonar-scanner in a docker container so you don't have to pollute your system with Java.

To pull and run
```
docker run -ti -v $(pwd):/root/src zaquestion/sonarqube-scanner
```

# Example Project Config
You need a sonar-project.properties in the root of your project file heres
a template for python
```
# Required metadata
sonar.projectKey=org.sonarqube:python-sonar-scanner
sonar.projectName=Python :: PYTHON! : SonarQube Scanner
sonar.projectVersion=1.0

# Comma-separated paths to directories with sources (required)
sonar.sources=<SRC>

# Language
sonar.language=py

# Encoding of the source files
sonar.sourceEncoding=UTF-8

sonar.host.url=http://172.17.0.5:9000
```

# Using [docker-sonarqube-python](https://github.com/zaquestion/docker-sonarqube-python) server
To get the IP of a sonarqube server running in docker
```
docker network inspect bridge
```
