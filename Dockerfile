FROM jenkins/jenkins:lts

USER root
RUN apt-get update && apt-get install -y ruby make htop docker.io
