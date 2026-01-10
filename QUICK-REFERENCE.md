# Quick Reference: Before & After

## File Organization

### BEFORE (Original Structure)

```
humanus/
├── index.html          (1106 lines - LOTS of duplication!)
├── yoga.html           (395 lines - duplicate header/footer)
├── behandlungen.html   (duplicate header/footer)
├── praxis.html         (duplicate header/footer)
├── kontakt.html        (duplicate header/footer)
├── kilianbegoin.html   (duplicate header/footer)
├── joachimtoelle.html  (duplicate header/footer)
├── dominiquemakris.html (duplicate header/footer)
├── georgroeske.html    (duplicate header/footer)
├── assets/
└── style.css
```

**Problem**: Changing navigation = editing 9 files!

### AFTER (11ty Structure)

```
humanus/
├── src/
│   ├── _includes/
│   │   ├── layouts/
│   │   │   └── base.njk          ← Header/Footer HERE (once!)
│   │   └── partials/
│   │       ├── header.njk        ← Navigation HERE (once!)
│   │       ├── footer.njk
│   │       ├── scripts.njk
│   │       ├── layerslider.njk
│   │       └── home-content.njk
│   ├── index.html                ← Just content + front matter
│   ├── yoga.html                 ← Just content + front matter
│   └── [other pages...]
├── _site/                        ← Generated files (deploy this)
├── assets/
├── style.css
├── package.json
└── .eleventy.js
```

**Solution**: Change navigation once = updates everywhere!

## Code Comparison

### OLD WAY (yoga.html)

```html
<!DOCTYPE html>
<html lang="de">
  <head>
    <!-- 50+ lines of <head> content -->
    <meta http-equiv="cache-control" content="no-cache" />
    <meta http-equiv="expires" content="0" />
    <!-- ...more meta tags... -->
    <link rel="stylesheet" type="text/css" href="style.css" />
    <!-- ...more stylesheets... -->
  </head>
  <body>
    <header>
      <!-- 30+ lines of header -->
      <nav>
        <!-- 40+ lines of navigation -->
        <ul>
          <li><a href="index.html">Home</a></li>
          <li><a href="behandlungen.html">Behandlungen</a></li>
          <!-- ...etc... -->
        </ul>
      </nav>
    </header>

    <!-- YOUR ACTUAL PAGE CONTENT (maybe 100 lines) -->
    <div id="tm-page-body">
      <h1>Yoga</h1>
      <p>Content about yoga...</p>
    </div>

    <footer>
      <!-- 30+ lines of footer -->
    </footer>

    <!-- 40+ lines of script tags -->
    <script src="assets/3rd/jquery/jquery-core.js"></script>
    <!-- ...many more scripts... -->
  </body>
</html>
```

**Total: 395 lines** (only ~100 lines are unique content!)

### NEW WAY (src/yoga.html)

```html
---
layout: layouts/base.njk
title: Yoga - Humanus Praxis
permalink: /yoga.html
---

<!-- ONLY YOUR ACTUAL PAGE CONTENT -->
<div id="tm-page-body">
  <h1>Yoga</h1>
  <p>Content about yoga...</p>
</div>
```

**Total: ~150 lines** (all unique content!)

## Making Changes

### To Update Navigation

#### OLD WAY

1. ❌ Open index.html → Find nav → Edit
2. ❌ Open yoga.html → Find nav → Edit
3. ❌ Open behandlungen.html → Find nav → Edit
4. ❌ Open praxis.html → Find nav → Edit
5. ❌ Open kontakt.html → Find nav → Edit
6. ❌ Open kilianbegoin.html → Find nav → Edit
7. ❌ Open joachimtoelle.html → Find nav → Edit
8. ❌ Open dominiquemakris.html → Find nav → Edit
9. ❌ Open georgroeske.html → Find nav → Edit

**9 files to edit! 😱**

#### NEW WAY

1. ✅ Open `src/_includes/partials/header.njk`
2. ✅ Make your change
3. ✅ Save

**1 file to edit! 🎉**
**All pages update automatically!**

## Development Workflow

### OLD WAY

1. Edit HTML file
2. Save
3. Switch to browser
4. Manually refresh
5. View changes

### NEW WAY

1. Edit any file in `src/`
2. Save
3. **Browser auto-refreshes**
4. View changes instantly

## Deployment

### OLD WAY

- Upload all 9 HTML files
- Upload assets folder
- Upload style.css
- Hope you didn't miss anything

### NEW WAY

```bash
npm run build
```

- Upload everything in `_site/` folder
- Done! ✅

## File Size Reduction

### Before

```
index.html:         1,106 lines
yoga.html:            395 lines
behandlungen.html:    ~400 lines
praxis.html:          ~500 lines
kontakt.html:         ~350 lines
[+ 4 more pages]      ~350 lines each
─────────────────────────────────
TOTAL:              ~4,500 lines
```

### After (src/ folder only)

```
base.njk:            ~70 lines (layout)
header.njk:          ~60 lines (navigation)
footer.njk:          ~50 lines
scripts.njk:         ~40 lines
yoga.html:          ~150 lines (content only)
[other pages]:      ~100 lines each (content only)
─────────────────────────────────
TOTAL:             ~1,200 lines
```

**Reduction: ~70% less code to maintain!** 🚀

## Template Reuse Diagram

```
┌─────────────────────────────────────────────┐
│         base.njk (Master Layout)            │
│  ┌───────────────────────────────────────┐  │
│  │  <html>, <head>, meta tags, CSS links │  │
│  └───────────────────────────────────────┘  │
│  ┌───────────────────────────────────────┐  │
│  │       header.njk (Navigation)         │  │
│  └───────────────────────────────────────┘  │
│  ┌───────────────────────────────────────┐  │
│  │     {{ content }} ← PAGE GOES HERE    │  │
│  │                                       │  │
│  │  • index.html uses layerslider.njk   │  │
│  │  • yoga.html has its content          │  │
│  │  • behandlungen.html has its content  │  │
│  │  • ...etc                              │  │
│  └───────────────────────────────────────┘  │
│  ┌───────────────────────────────────────┐  │
│  │         footer.njk (Footer)           │  │
│  └───────────────────────────────────────┘  │
│  ┌───────────────────────────────────────┐  │
│  │      scripts.njk (All <script>s)      │  │
│  └───────────────────────────────────────┘  │
└─────────────────────────────────────────────┘

This whole structure is used for EVERY page!
Change base.njk → All pages update ✨
```

## Status Overview

| Page                 | Status             | Action Needed              |
| -------------------- | ------------------ | -------------------------- |
| yoga.html            | ✅ **COMPLETE**    | None - use as reference!   |
| index.html           | ⚠️ Structure ready | Add team members section   |
| behandlungen.html    | ⚠️ Placeholder     | Copy content from original |
| praxis.html          | ⚠️ Placeholder     | Copy content from original |
| kontakt.html         | ⚠️ Placeholder     | Copy content from original |
| kilianbegoin.html    | ⚠️ Placeholder     | Copy content from original |
| joachimtoelle.html   | ⚠️ Placeholder     | Copy content from original |
| dominiquemakris.html | ⚠️ Placeholder     | Copy content from original |
| georgroeske.html     | ⚠️ Placeholder     | Copy content from original |

## Next Action

**View your site right now:**
Open http://localhost:8080 in your browser!

**Check the working example:**
http://localhost:8080/yoga.html

**Then complete the migration:**
Follow the steps in [README-MIGRATION.md](README-MIGRATION.md)
