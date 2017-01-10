FROM jangrewe/gitlab-ci-android

#Install Ruby 2.3

RUN apt-get update \
    && apt-get -y install \
        software-properties-common \
    && add-apt-repository -y ppa:brightbox/ruby-ng \
    && apt-get update \
    && apt-get -y install \
        ruby2.3 \
        ruby2.3-dev \
    && rm -rf /var/lib/apt/lists/*

RUN echo 'gem: --no-document' > /usr/local/etc/gemrc
RUN gem update
RUN gem --help
RUN gem install bundler
RUN gem install fir-cli
