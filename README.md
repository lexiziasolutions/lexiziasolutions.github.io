# Lexizia Solutions Ltd – Company Website

Official website for **Lexizia Solutions Ltd**, a registered Kenyan company based in Kitale, Trans Nzoia, supplying stationery, ICT equipment, office furniture, uniforms & PPE, cleaning and hygiene products, hardware and electrical goods to institutions, businesses and government offices.

🌐 **Live site:** https://lexiziasolutions.github.io/

## Features

- Responsive, mobile-first design with a collapsible navigation menu
- Sections: Products, Why Us, How It Works, Credentials, FAQ, Request a Quote
- Product catalogue with category filters, plus an order cart (add, change quantity, remove, remove all, add your own items) that places orders via WhatsApp or email
- Quotation request form that sends via **email** or **WhatsApp** (opens the user's own app so they can review before sending)
- Floating WhatsApp chat button
- SEO-ready: meta description, Open Graph tags and Schema.org `Organization` structured data
- Accessible: skip link, focus styles, semantic HTML
- Single static file – no build step, no dependencies

## Project structure

```
.
├── index.html       # the whole website (HTML, CSS, JavaScript)
├── logo.svg         # main logo, colour, for white backgrounds
├── logo-white.svg   # logo for dark backgrounds
├── logo-square.svg  # square version for profile pictures
├── logo-mark.svg    # "LX" icon, used as the browser icon
├── logo.png         # 512px square logo (app icon / profile picture)
├── og.png           # 1200x630 image shown when the link is shared
├── robots.txt
├── sitemap.xml
└── README.md
```

## Run locally

1. Clone the repository:
   ```bash
   git clone https://github.com/lexiziasolutions/lexiziasolutions.github.io.git
   ```
2. Open `index.html` in any web browser.

## Deploy with GitHub Pages

1. Push `index.html` to the `main` branch.
2. Go to **Settings → Pages**.
3. Under **Build and deployment**, set **Source** to *Deploy from a branch*.
4. Choose branch **main** and folder **/ (root)**, then click **Save**.
5. After a minute or two the site is live at `https://lexiziasolutions.github.io/`.

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
