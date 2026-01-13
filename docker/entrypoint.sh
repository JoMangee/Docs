#!/bin/bash
set -euo pipefail

# Ensure gems are present (useful if Gemfile changes and volume overrides install)
bundle check || bundle install --jobs 4 --retry 3

# Serve the site on 0.0.0.0 so host can access it
# Note: older Jekyll versions (2.x) don't support --livereload, so omit it for compatibility
exec bundle exec jekyll serve --watch --drafts --host 0.0.0.0 --port 4000
