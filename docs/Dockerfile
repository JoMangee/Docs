FROM ruby:2.7

WORKDIR /srv/jekyll

# Install Node.js for ExecJS (JS runtime) and other build tools
RUN apt-get update && apt-get install -y nodejs npm && rm -rf /var/lib/apt/lists/*

# Copy gem files first to take advantage of Docker cache for bundle install
COPY Gemfile Gemfile.lock /srv/jekyll/

# Ensure bundler available and install gems
RUN gem install bundler -v 2.3.25 || true \
    && bundle config set --local path '/usr/local/bundle' \
    && bundle install --jobs 4 --retry 5

# Copy the site source
COPY . /srv/jekyll

# Make entrypoint executable
RUN chmod +x /srv/jekyll/entrypoint.sh || true

EXPOSE 4000

CMD ["./entrypoint.sh"]
