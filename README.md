# chill haven

Marketing site for **ChillHaven**, a local-first wellbeing app for iPhone aimed at
14–17 year olds — mood, stress, energy, sleep and routine tracking, with calm tools
and plain-language trends.

Static HTML and CSS, no build step and no dependencies.

```
index.html     home — about, features, privacy, feedback, team, safety
privacy.html   privacy policy
support.html   help, FAQ and contact
style.css      all styles
site.js        scroll reveals and nav state
assets/        logo
```

Colour and type tokens are taken from the app's own design system so the site and
the product stay consistent.

## Running it

Any static server will do:

```sh
python3 -m http.server 8000
```

## Deploying

Settings → Pages → Deploy from a branch → `main` → `/` (root).
