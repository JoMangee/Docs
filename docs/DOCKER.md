# Docker / Docker Compose for local preview

Why this exists
- The site uses older Jekyll (v2.x) which is incompatible with Ruby 3 (some methods like `URI.escape` are removed). The container uses Ruby 2.7 to match Jekyll 2.x and avoid runtime errors.

Quick start
1. Build and start: `docker compose -f docs/docker-compose.yml up --build`
2. Visit http://localhost:4000 to preview the site

Notes
- The first run will install gems and may take a few minutes; subsequent runs will be faster because gems are cached in a named volume (`ipnz_bundle_cache`).
- If you need to rebuild from scratch: `docker compose -f docs/docker-compose.yml down -v && docker compose -f docs/docker-compose.yml up --build`

Troubleshooting
- If you see native extension compile errors, ensure Docker has access to build tools (the Ruby image used includes common build toolchain). If you hit platform-specific issues on Windows, see Docker Desktop settings and shared drive permissions.

If you want a lighter/faster dev loop we can produce a prebuilt image with gems baked in and push it to a registry for your team.
