# Docker / Docker Compose for local Jekyll preview 🔧

This repository includes a small Docker setup to run the site locally with a reproducible Ruby environment (Ruby 2.7, Bundler 2.x).

Quick start:

- Build and start the site:

  docker compose up --build

- Open http://localhost:4000 in your browser (the server binds to 0.0.0.0 inside the container).

Notes and tips:
- The container mounts `./docs` into `/srv/jekyll` so local changes are picked up live by `jekyll serve`.
- If you change `Gemfile`, re-run:

  docker compose build --no-cache

- The Dockerfile installs common build dependencies so native gems (e.g., `yajl-ruby`) can be compiled.

If you prefer a one-off run without compose, you can also build the image with `docker build -t ipnz-jekyll -f docker/jekyll/Dockerfile .` and run it mapping port 4000.
