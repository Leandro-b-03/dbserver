FROM ruby:latest

LABEL Name=optimum Version=0.0.1
EXPOSE 80

# throw errors if Gemfile has been modified since Gemfile.lock
# RUN bundle config --global frozen 1
RUN gem update bundler
RUN bundler -v

WORKDIR /app
COPY . /app

RUN ls -al
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y wget
RUN apt-cache search openjdk
RUN apt-get install -y openjdk-11-jre openjdk-11-jdk
RUN java -version
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get install -y nodejs
RUN apt-get clean
RUN node -v
RUN npm -version
RUN npm install -g allure
RUN npm install -g allure-commandline
RUN apt-get install -y nano
RUN apt-get clean

# ADD Gemfile Gemfile
# ADD Gemfile.lock Gemfile
RUN gem update bundle
WORKDIR ./cucumber/
RUN ls -al
RUN bundle install
RUN bundle update
COPY gem_file/* /usr/local/bundle/gems/allure-cucumber-0.6.1/lib/allure-cucumber
#RUN cat Gemfile

# Configure an entry point, so we don't need to specify 
# "bundle exec" for each of our commands.
# ENTRYPOINT ["bundle", "exec"]
ENTRYPOINT ["tail", "-f", "/dev/null"]