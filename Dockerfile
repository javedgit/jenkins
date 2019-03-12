FROM jenkins/jenkins:lts

ENV JENKINS_OPTS --prefix=/jenkins
RUN /usr/local/bin/install-plugins.sh config-file-provider aws-credentials amazon-ecr amazon-ecs pipeline-maven pipeline-aws-plugin

USER root
RUN apk add --update coreutils python py-pip python-dev jq && \
    pip install awscli && \
    rm -rf /var/cache/apk/*

USER jenkins