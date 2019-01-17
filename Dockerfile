FROM ruby:2.3.4-slim
MAINTAINER Ayotunde Salako <salakoayotunde@gmail.com>

################################################################################
## setup container
################################################################################

COPY docker/setup/* /tmp/
RUN /tmp/setup.sh

################################################################################
## setup application
################################################################################


RUN gem update --system
RUN gem update
RUN gem install bundler
RUN gem install execjs
RUN gem install configure-s3-website -v 2.0.0

COPY . /deploy
RUN mv /deploy/.aws/credentials.tmpl ~/.aws/credentials.tmpl && rm -rf /deploy/.aws && rm /deploy/Dockerfile

WORKDIR /deploy
