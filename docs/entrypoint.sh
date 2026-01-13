#!/usr/bin/env bash
set -euo pipefail
cd /srv/jekyll

# Ensure gems are installed (cached in volume)
bundle install --jobs 4 --retry 5

# Serve the site; listen on all interfaces so host mapping works
bundle exec jekyll serve --watch --drafts --livereload --host 0.0.0.0 --port 4000
