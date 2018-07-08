FROM ruby:2.5

RUN apt-get update -qq && apt-get install -y \
	build-essential \
	libpq-dev \
	nodejs

WORKDIR /workspace

# Install dependencies in container because
# some gems requires native extensions, e.g. nokogiri, pg, puma

COPY ["Gemfile", "Gemfile.lock", "/workspace/"]

RUN bundle install
