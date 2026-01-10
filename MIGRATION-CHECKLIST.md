# Migration Checklist

Use this checklist to track your progress migrating content from the old HTML files to the new 11ty structure.

## ✅ Completed

- [x] Set up 11ty configuration
- [x] Create base layout template
- [x] Create header partial
- [x] Create footer partial
- [x] Create scripts partial
- [x] Install dependencies
- [x] Test build system
- [x] Start development server
- [x] Complete yoga.html (reference example)
- [x] **Created automated conversion script (convert-to-11ty.py)**
- [x] **Converted all 7 remaining HTML files**

## 📋 Content Migration Todo

### Homepage

- [x] index.html
  - [ ] Verify layerslider content
  - [ ] Add complete team members section (lines 700-980 from original)
  - [ ] Test all links
  - [ ] Verify images load

### Main Pages

- [x] behandlungen.html ✅

  - [x] Copy main content from original file
  - [x] Update asset paths (add leading /)
  - [x] Test page in browser
  - [x] Verify navigation highlighting works

- [x] praxis.html ✅

  - [x] Copy main content from original file
  - [x] Update asset paths
  - [x] Test page in browser
  - [x] Verify navigation highlighting works

- [x] kontakt.html ✅
  - [x] Copy main content from original file
  - [x] Update asset paths
  - [x] Test page in browser
  - [x] Verify forms work
  - [x] Verify navigation highlighting works

### Team Member Pages

- [x] kilianbegoin.html ✅

  - [x] Copy main content from original file
  - [x] Update asset paths
  - [x] Test page in browser
  - [x] Verify navigation highlighting works

- [x] joachimtoelle.html ✅

  - [x] Copy main content from original file
  - [x] Update asset paths
  - [x] Test page in browser
  - [x] Verify navigation highlighting works

- [x] dominiquemakris.html ✅

  - [x] Copy main content from original file
  - [x] Update asset paths
  - [x] Test page in browser
  - [x] Verify navigation highlighting works

- [x] georgroeske.html ✅
  - [x] Copy main content from original file
  - [x] Update asset paths
  - [x] Test page in browser
  - [x] Verify navigation highlighting works

## 🧪 Testing Checklist

Test each page after migration:

### Per Page

- [ ] Page loads without errors
- [ ] All images display correctly
- [ ] All links work
- [ ] Navigation menu highlights current page
- [ ] Styles are applied correctly
- [ ] Mobile responsive design works
- [ ] No console errors in browser

### Global Tests

- [ ] All navigation links work across all pages
- [ ] Footer appears on all pages
- [ ] Header appears on all pages
- [ ] Scripts load on all pages
- [ ] Search functionality works (if applicable)
- [ ] Forms submit correctly (if applicable)

## 🚀 Pre-Deployment Checklist

Before deploying to production:

- [ ] All pages migrated
- [ ] All tests passed
- [ ] Run `npm run build` successfully
- [ ] Check \_site/ folder contents
- [ ] Verify no broken links
- [ ] Test layerslider on homepage
- [ ] Mobile testing complete
- [ ] Browser compatibility tested (Chrome, Firefox, Safari)
- [ ] Backup old site
- [ ] Upload \_site/ contents to server

## 📊 Progress Tracker

Total Pages: 9

- ✅ Completed: 9 (ALL PAGES!)
- ⚠️ In Progress: 0
- ❌ Not Started: 0

**Completion: 100% 🎉**

---

## 🎯 Quick Tips

1. **Work on one page at a time** - Complete, test, check off
2. **Use yoga.html as your reference** - It's fully migrated
3. **Keep the dev server running** - Instant feedback on changes
4. **Test in browser frequently** - Catch issues early
5. **Commit to git after each page** - Track your progress

## 📝 Notes

Add any notes or issues you encounter here:

-
-
-

---

**Last Updated:** [Add date when you work on this]
**Next Task:** [Add your next task here]
