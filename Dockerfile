FROM sameersbn/gitlab-ci-runner:latest

MAINTAINER Zack YL Shih <zackyl.shih@moxa.com>

RUN dpkg --add-architecture i386 && \
	apt-get update && \
	apt-get install -y \
	libstdc++6:i386 \
	libgcc1:i386 \
	zlib1g:i386 \
	build-essential \
	ruby-dev \
	libicu-dev \
	libssl-dev \
    libpng-dev \
    git \
    curl && \
    rm -rf /var/lib/apt/lists/* # 20150202

ADD assets/ /app/

RUN chmod 755 /app/setup/*

RUN bash -c "su - gitlab_ci_runner -c /app/setup/ruby"

RUN bash -c "su - gitlab_ci_runner -c /app/setup/node"
