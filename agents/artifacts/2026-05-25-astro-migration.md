# 2026-05-25 Astro Migration Work Record

## Summary

Converted the existing static GitHub Pages repository into an Astro site, preserved selected legacy assets, removed the old map/tutorial page, and prepared GitHub Pages deployment through GitHub Actions.

## Completed Work

- Initialized Astro project files: `package.json`, `astro.config.mjs`, `tsconfig.json`, and `src/content.config.ts`.
- Added shared layout and global CSS under `src/layouts` and `src/styles`.
- Replaced the old root `index.html` with an Astro homepage that lists blog articles.
- Migrated the old `yeshou` keyboard/audio page to `src/pages/yeshou/index.astro`, while removing visible navigation to it.
- Moved legacy static assets into `public` so their URLs are stable after build.
- Removed the Google Maps iframe page because it was an old tutorial artifact.
- Deleted the temporary migration article.
- Converted `*、++ 和指针` into the first blog article at `src/content/blog/pointer-operators.md`.
- Set the article publish date from the first image upload commit: `2017-07-19T21:33:13+08:00`.
- Added GitHub Pages deployment workflow at `.github/workflows/deploy.yml`.
- Added project guidance in `AGENTS.md`.

## Verification

- Ran `npm install` successfully.
- Ran `npm run build` successfully after disabling Astro telemetry in npm scripts.
- Started local Astro preview at `http://127.0.0.1:4321/`.
- Verified homepage, blog list, article page, and hidden `/yeshou/` route in the browser.
- Checked desktop and 390px mobile viewport for horizontal overflow.
