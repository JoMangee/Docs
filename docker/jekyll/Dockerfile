FROM ruby:2.7-slim

LABEL maintainer="GitHub Copilot <noreply@github.com>"

ENV LANG C.UTF-8
WORKDIR /srv/jekyll

# Install runtime/build deps for native gems and common Jekyll needs
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
     build-essential \
     libxml2-dev \
     libxslt1-dev \
     zlib1g-dev \
     libssl-dev \
     libreadline-dev \
     nodejs \
     python3 \
     python3-pip \
     curl \
  && pip3 install --no-cache-dir Pygments \
  && rm -rf /var/lib/apt/lists/*

# Use Bundler compatible with Ruby 2.7
RUN gem install bundler -v '2.4.22' --no-document

# Copy Gemfile early to leverage Docker cache
COPY docs/Gemfile docs/Gemfile.lock* /srv/jekyll/
RUN bundle config set without 'development:test' \
  && bundle install --jobs 4 --retry 3

# Copy site source
COPY docs/ /srv/jekyll/

# Add entrypoint
COPY docker/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

EXPOSE 4000
CMD ["/usr/local/bin/entrypoint.sh"]
