# Agent Notes

This repository is a personal Astro site deployed to GitHub Pages.

## Project Layout

- Blog content lives in `src/content/blog/*.md`.
- File-based routes live in `src/pages`.
- Static files that need stable public URLs live in `public`.
- Work records created by coding agents live in `agents/artifacts/*.md`.

## Site Rules

- The public site should present blog articles as the primary surface.
- Keep legacy utility pages unlinked unless the user asks to expose them.
- Do not add a visible site link to `/yeshou/`; it is intentionally reachable only by direct URL.
- Use `npm run build` before committing site structure changes.

## Deployment

GitHub Pages deployment is handled by `.github/workflows/deploy.yml` with the Astro GitHub Action.
