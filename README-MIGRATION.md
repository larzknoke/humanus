# 11ty Migration Guide for Humanus Website

## What Has Been Done

✅ Created 11ty configuration (`.eleventy.js`)
✅ Created `package.json` with 11ty dependency
✅ Created base layout template (`src/_includes/layouts/base.njk`)
✅ Created reusable partials (header, footer, scripts)
✅ Converted `yoga.html` as an example
✅ Created `.gitignore`

## Directory Structure

```
humanus/
├── .eleventy.js          # 11ty configuration
├── package.json          # Dependencies
├── style.css             # Main stylesheet (copied to _site)
├── assets/               # Static assets (copied to _site)
├── src/                  # Source files for 11ty
│   ├── _includes/
│   │   ├── layouts/
│   │   │   └── base.njk  # Main layout template
│   │   └── partials/
│   │       ├── header.njk
│   │       ├── footer.njk
│   │       ├── scripts.njk
│   │       └── layerslider.njk
│   ├── index.html        # Home page (needs content migration)
│   ├── yoga.html         # ✅ Complete example
│   └── [other pages]     # Need to be created
└── _site/                # Generated output (gitignored)
```

## How to Get Started

### 1. Install Dependencies

```bash
npm install
```

### 2. Start Development Server

```bash
npm start
```

This will:

- Build your site to `_site/` directory
- Start a local server (usually http://localhost:8080)
- Watch for changes and rebuild automatically

### 3. Build for Production

```bash
npm run build
```

## Converting Remaining Pages

Each old HTML file needs to be converted to the new format. Here's the process:

### Template Structure

```html
---
layout: layouts/base.njk
title: Page Title Here
permalink: /pagename.html
---

<!-- Only the main content goes here (between </header> and <footer>) -->
<div id="tm-page-body">
  <!-- Your page content -->
</div>
```

### Pages That Need Converting

1. ❌ `index.html` - Home page with layerslider
2. ✅ `yoga.html` - DONE (use as reference)
3. ❌ `behandlungen.html` - Treatments page
4. ❌ `praxis.html` - Practice page
5. ❌ `kontakt.html` - Contact page
6. ❌ `kilianbegoin.html` - Team member page
7. ❌ `joachimtoelle.html` - Team member page
8. ❌ `dominiquemakris.html` - Team member page
9. ❌ `georgroeske.html` - Team member page

### Conversion Steps for Each Page

1. **Open the old HTML file** (e.g., `behandlungen.html`)
2. **Find the main content section** - everything between `</header>` and `<footer>`
3. **Create a new file** in `src/` folder (e.g., `src/behandlungen.html`)
4. **Add front matter** at the top:
   ```yaml
   ---
   layout: layouts/base.njk
   title: Behandlungen - Humanus
   permalink: /behandlungen.html
   ---
   ```
5. **Paste only the main content** (the content between header and footer)
6. **Update asset paths** - change `assets/` to `/assets/` (add leading slash)
7. **Save the file**

### Example: Converting behandlungen.html

**Old File Structure:**

```html
<!DOCTYPE html>
<html>
  <head>
    ...
  </head>
  <body>
    <header>...</header>

    <!-- THIS IS WHAT YOU COPY -->
    <div id="tm-page-body">...your content...</div>
    <!-- END OF WHAT YOU COPY -->

    <footer>...</footer>
  </body>
</html>
```

**New File (src/behandlungen.html):**

```html
---
layout: layouts/base.njk
title: Behandlungen - Humanus
permalink: /behandlungen.html
---

<div id="tm-page-body">...your content...</div>
```

## Important Path Changes

When moving content, update all asset references:

- ❌ `href="assets/img/logo.jpg"`
- ✅ `href="/assets/img/logo.jpg"`

- ❌ `src="assets/css/style.css"`
- ✅ `src="/assets/css/style.css"`

The leading slash `/` ensures paths work correctly from any page depth.

## Active Navigation Highlighting

The header partial automatically highlights the current page in the navigation using:

```njk
<li class="{% if page.url == '/yoga.html' %}current-menu-item {% endif %}parent">
```

This is already set up in `src/_includes/partials/header.njk`.

## Benefits of This Refactoring

✅ **No Code Duplication** - Header, footer, and navigation defined once
✅ **Easy Updates** - Change navigation in one place, updates all pages
✅ **Live Reload** - Instant preview of changes during development  
✅ **Better Organization** - Clear separation of templates and content
✅ **Maintainable** - Much easier to add new pages or update existing ones

## Testing Your Work

After converting a page:

1. Save the file
2. Check the terminal - 11ty should rebuild automatically
3. Refresh your browser (or it may auto-refresh)
4. Verify:
   - Navigation works
   - Content displays correctly
   - Images load
   - Styles are applied
   - Links work

## Troubleshooting

### Port already in use

If you see "Port 8080 is already in use":

```bash
# Kill the process or use a different port
npm start -- --port=3000
```

### Changes not showing

- Check the terminal for build errors
- Hard refresh browser (Cmd+Shift+R on Mac)
- Stop and restart `npm start`

### Images not loading

- Ensure you added the leading `/` to paths
- Check that `assets/` folder is in the root directory

## Next Steps

1. ✅ Install dependencies: `npm install`
2. ✅ Start dev server: `npm start`
3. ❌ Convert remaining 8 HTML pages using the pattern above
4. ❌ Test all pages thoroughly
5. ❌ Delete old HTML files from root once migration is complete
6. ❌ Deploy `_site/` directory to your web server

## Deployment

When ready to deploy:

1. Run `npm run build`
2. Upload the contents of the `_site/` folder to your web server
3. Keep the original project folder for future updates

## Need Help?

- Check [11ty documentation](https://www.11ty.dev/docs/)
- Refer to `src/yoga.html` as a complete working example
- The base layout handles all <head> content, scripts, header, and footer automatically
