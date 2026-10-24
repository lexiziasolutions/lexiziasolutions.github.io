# Lexizia Solutions Ltd – Company Website

Official website for **Lexizia Solutions Ltd**, a registered Kenyan company based in Kitale, Trans Nzoia, supplying stationery, ICT equipment, office furniture, uniforms & PPE, cleaning and hygiene products, hardware and electrical goods to institutions, businesses and government offices.

🌐 **Live site:** https://lexiziasolutions.co.ke/

## Features

- Responsive, mobile-first design with a collapsible navigation menu
- Sections: Products, Why Us, How It Works, Credentials, FAQ, Request a Quote
- Product catalogue with category filters, plus an order cart (add, change quantity, remove, remove all, add your own items) that places orders via WhatsApp or email
- Quotation request form that sends via **email** or **WhatsApp** (opens the user's own app so they can review before sending)
- Floating WhatsApp chat button
- SEO-ready: meta description, Open Graph and Twitter tags, Schema.org `Organization`/`LocalBusiness` and `FAQPage` structured data, sitemap and robots.txt
- Installable as an app (PWA) with offline fallback and home-screen shortcuts
- Branded 404 page
- Accessible: skip link, focus styles, semantic headings, `noscript` fallback
- Static site – no build step

## Project structure

```
.
├── index.html            # the whole website (HTML, CSS, JavaScript)
├── 404.html              # branded "page not found" page
├── logo.svg              # main logo, colour, for white backgrounds
├── logo-mark.svg         # "LX" icon, used as the browser icon
├── logo.png              # 512px square logo (app icon / profile picture)
├── logo-192.png          # 192px app icon
├── og.png                # 1200x630 image shown when the link is shared
├── manifest.webmanifest  # app manifest for the public site
├── admin.webmanifest     # app manifest for the admin app
├── sw.js                 # service worker (offline fallback)
├── admin.html            # admin login: orders + catalogue manager (not linked in the menu)
├── config.js             # Supabase URL + public anon key
├── setup.sql             # run once in Supabase to create tables and security rules
├── robots.txt
├── sitemap.xml
├── CNAME                 # custom domain for GitHub Pages
├── .nojekyll             # lets GitHub Pages serve the .well-known folder
├── .well-known/          # assetlinks.json (Android app) and security.txt
└── README.md
```

## Run locally

1. Clone the repository:
   ```bash
   git clone https://github.com/lexiziasolutions/lexiziasolutions.github.io.git
   ```
2. Open `index.html` in any web browser.

## Deploy with GitHub Pages

1. Push your changes to the `main` branch.
2. Go to **Settings → Pages**.
3. Under **Build and deployment**, set **Source** to *Deploy from a branch*.
4. Choose branch **main** and folder **/ (root)**, then click **Save**.
5. Under **Custom domain** use `lexiziasolutions.co.ke` and tick **Enforce HTTPS** once the certificate is ready.
6. After a minute or two the site is live at `https://lexiziasolutions.co.ke/`.

## Getting found in search

- Google: add the site in [Search Console](https://search.google.com/search-console) and submit `sitemap.xml`.
- Bing: add it in [Bing Webmaster Tools](https://www.bing.com/webmasters).
- Brave Search keeps its own index and has no submission tool. Links from real pages (a Google Business Profile, Facebook/LinkedIn pages, business directories) are what help it discover the site.
- After changing the page, update the date in `sitemap.xml` (`lastmod`).

## Customising

- **Contact details:** search `index.html` for the phone number and email and update them (they appear in the page, the quote form scripts and the structured data).
- **Colours:** edit the CSS variables at the top of the `<style>` block (`--navy`, `--teal`, `--gold`, etc.).
- **Products / FAQ:** edit the matching `<section>` blocks in the HTML.
- **Catalogue items:** edit the `CAT` list near the bottom of `index.html` (one line per category).
- **Custom domain:** if you add one, update the web address in `index.html` (canonical, `og:` tags), `robots.txt` and `sitemap.xml`.

## Contact

**Lexizia Solutions Ltd**
Kitale Building, Kitale Municipality Road, Kitale, Trans Nzoia, Kenya
P.O. Box 4485 – 30200, Kitale
📞 +254 116 400 947 · ✉️ lexiziacompanyltd@gmail.com

Company No. PVT-DM1KB2V5 · Registered under the Companies Act, 2015

## License

© Lexizia Solutions Ltd. All rights reserved.

## Admin area (orders and catalogue)

The site is static, so logins and data live in a free [Supabase](https://supabase.com) project.

1. Create a Supabase project, then open **SQL Editor**, paste `setup.sql` (change the admin email in it) and run it.
2. **Authentication → Users → Add user**: create the admin with that same email and a strong password (tick *Auto Confirm User*).
3. **Authentication → Sign In / Providers**: turn **off** "Allow new users to sign up".
4. **Project Settings → API**: copy the *Project URL* and the **anon public** key into `config.js`. Never use the `service_role` key.
5. Commit `config.js`, then open `/admin.html` on your site and log in.

Without Supabase the website still works; orders just go by WhatsApp or email.
