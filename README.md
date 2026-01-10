# 🎉 Humanus Website - 11ty Refactoring Complete!

## ✅ What's Been Done

Your website has been successfully refactored to use **Eleventy (11ty)**, a modern static site generator. Here's what's been set up:

### 1. Project Configuration

- ✅ `package.json` - Dependencies and scripts
- ✅ `.eleventy.js` - 11ty configuration
- ✅ `.gitignore` - Git ignore rules
- ✅ `setup.sh` - Quick setup script

### 2. Template System

- ✅ `src/_includes/layouts/base.njk` - Main page layout
- ✅ `src/_includes/partials/header.njk` - Shared header & navigation
- ✅ `src/_includes/partials/footer.njk` - Shared footer
- ✅ `src/_includes/partials/scripts.njk` - Shared JavaScript includes
- ✅ `src/_includes/partials/layerslider.njk` - Homepage slider
- ✅ `src/_includes/partials/home-content.njk` - Homepage content

### 3. Page Templates (in src/ folder)

- ✅ `index.html` - Homepage (structure ready)
- ✅ `yoga.html` - **FULLY COMPLETE** (use as reference!)
- ⚠️ `behandlungen.html` - Placeholder (needs content)
- ⚠️ `praxis.html` - Placeholder (needs content)
- ⚠️ `kontakt.html` - Placeholder (needs content)
- ⚠️ `kilianbegoin.html` - Placeholder (needs content)
- ⚠️ `joachimtoelle.html` - Placeholder (needs content)
- ⚠️ `dominiquemakris.html` - Placeholder (needs content)
- ⚠️ `georgroeske.html` - Placeholder (needs content)

## 🚀 Server is Running!

Your development server is currently running at:
**http://localhost:8080**

Open this URL in your browser to see the site!

## 📝 Next Steps

### Immediate Actions:

1. **View the site** at http://localhost:8080
2. **Check yoga.html** - it's fully working and serves as your reference
3. **Complete the content migration** for other pages

### How to Complete Each Page:

For each placeholder page (behandlungen.html, praxis.html, etc.):

1. Open the **original HTML file** in the root directory
2. Find and copy the **main content** (between `</header>` and `<footer>`)
3. Open the corresponding file in `src/` folder
4. Replace the placeholder content with the copied content
5. Update image/asset paths: `assets/` → `/assets/` (add leading slash)
6. Save - the site will auto-reload!

### Example:

**From:** `/behandlungen.html` (original file, lines 120-900)
**To:** `/src/behandlungen.html` (just the content, with front matter)

## 🎯 Key Benefits You Now Have

### Before (Old Setup):

- ❌ Header/footer duplicated in every file
- ❌ Navigation changes required editing 9 files
- ❌ No live reload during development
- ❌ Manual file management

### After (11ty Setup):

- ✅ Header/footer defined once, used everywhere
- ✅ Navigation changes affect all pages instantly
- ✅ Live reload - changes appear immediately
- ✅ Organized structure with templates
- ✅ Much easier to maintain and update

## 🛠️ Commands Reference

```bash
# Start development server (with live reload)
npm start

# Build for production
npm run build

# Clean build directory
npm run clean
```

## 📂 File Structure Explained

```
humanus/
├── src/                      # 11ty source files (edit these!)
│   ├── _includes/            # Reusable templates
│   │   ├── layouts/          # Page layouts
│   │   └── partials/         # Components (header, footer, etc.)
│   └── *.html                # Your pages (with front matter)
│
├── _site/                    # Generated output (don't edit!)
│   └── [all built files]     # Deploy this folder to web server
│
├── assets/                   # Static files (copied as-is)
├── style.css                 # Main CSS (copied as-is)
│
├── .eleventy.js              # 11ty configuration
├── package.json              # Project config & dependencies
└── README-MIGRATION.md       # Detailed migration guide
```

## 🔄 Workflow

1. **Edit files in `src/`** (or layouts in `src/_includes/`)
2. **Save the file**
3. **Browser auto-refreshes** with your changes
4. **When ready to deploy:** Run `npm run build`
5. **Upload `_site/` folder** to your web server

## 📖 Documentation

- **Detailed migration guide:** [README-MIGRATION.md](README-MIGRATION.md)
- **11ty documentation:** https://www.11ty.dev/docs/
- **Reference page:** [src/yoga.html](src/yoga.html) (fully complete!)

## ⚡ Quick Tips

### Updating the Navigation

Edit: `src/_includes/partials/header.njk`
Effect: Changes appear on ALL pages

### Updating the Footer

Edit: `src/_includes/partials/footer.njk`
Effect: Changes appear on ALL pages

### Adding a New Page

1. Create `src/newpage.html`
2. Add front matter at the top:

```yaml
---
layout: layouts/base.njk
title: New Page Title
permalink: /newpage.html
---
```

3. Add your content
4. Add link in header.njk navigation

### Checking for Errors

Watch the terminal where `npm start` is running - errors will appear there.

## 🎨 Customization

All your existing styles in `style.css` and assets are preserved and working!

## 📊 Build Stats

- ✅ 9 pages generated
- ✅ 269 static files copied
- ✅ Build time: ~0.2 seconds
- ✅ Development server: http://localhost:8080

## 🆘 Troubleshooting

### Server Won't Start

```bash
# Kill any existing processes on port 8080
lsof -ti:8080 | xargs kill -9
npm start
```

### Changes Not Showing

- Check terminal for errors
- Hard refresh: Cmd+Shift+R (Mac) or Ctrl+Shift+R (Windows)
- Restart server: Stop (Ctrl+C) and run `npm start` again

### Images Not Loading

- Make sure paths start with `/` → `/assets/img/...`
- Check that assets folder is in root directory

## 🎓 Learning Resources

- **Nunjucks templating:** https://mozilla.github.io/nunjucks/
- **11ty tutorial:** https://www.11ty.dev/docs/getting-started/
- **Front matter:** https://www.11ty.dev/docs/data-frontmatter/

## ✨ Congratulations!

You now have a modern, maintainable website structure! The hard work of refactoring is done - now it's just a matter of migrating the content from the original HTML files to the new template structure.

**Happy coding!** 🚀

---

**Need help?** Refer to [README-MIGRATION.md](README-MIGRATION.md) for step-by-step instructions.
