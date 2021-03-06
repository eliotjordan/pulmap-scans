FROM ubuntu:14.04
MAINTAINER Eliot Jordan <eliot.jordan@gmail.com>

RUN apt-get update && apt-get -y install \
    unzip \
    wget \
    git \
    curl \
    libpq-dev \
    postgresql-client \
    mysql-client \
    libmysqlclient-dev \
    libsqlite3-dev \
    sqlite3 \
    build-essential \
    make \
    libcurl4-openssl-dev \
    libreadline-dev \
    libssl-dev \
    libxml2-dev \
    libxslt1-dev \
    libyaml-dev \
    zlib1g-dev \
    git-core \
    software-properties-common \
    python-software-properties \
    libgdbm-dev \   
    libncurses5-dev \
    automake \
    libtool \
    bison \
    libffi-dev

# Install ruby
RUN curl -O http://ftp.ruby-lang.org/pub/ruby/2.2/ruby-2.2.1.tar.gz && \
    tar -zxvf ruby-2.2.1.tar.gz && \
    cd ruby-2.2.1 && \
    ./configure --disable-install-doc && \
    make && \
    make install && \
    cd .. && \
    rm -r ruby-2.2.1 ruby-2.2.1.tar.gz && \
    echo 'gem: --no-ri --no-rdoc' > /usr/local/etc/gemrcdoc

# Install rails and gems
RUN gem install bundler && \
    gem install --no-ri --no-rdoc rails --version=4.2.0 && \
    gem install scss-lint

# Install nodejs and packages
RUN curl -sL https://deb.nodesource.com/setup | sudo bash - && \
    apt-get update -y && \
    apt-get install nodejs -y && \
    npm install -g phantomjs && \
    npm install -g bower && \
    npm install -g grunt-cli

WORKDIR /usr/src/
ADD start.sh /usr/src/

EXPOSE 3000
   
CMD /usr/src/start.sh