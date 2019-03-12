FROM jenkins/jenkins:lts

MAINTAINER Javed Mandary <javed2@gmail.com>

LABEL "description"="Image containers maven , aws pipeline jenkins plugins as well as aws-cli pre-installed"

ENV JENKINS_OPTS --prefix=/jenkins
RUN /usr/local/bin/install-plugins.sh config-file-provider aws-credentials amazon-ecr amazon-ecs pipeline-maven pipeline-aws

USER root

RUN curl -O https://bootstrap.pypa.io/get-pip.py \
&& python get-pip.py \
&& pip install awscli

USER jenkins