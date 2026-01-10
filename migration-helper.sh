#!/bin/bash

# Helper script to extract main content from original HTML files
# This assists with the migration to 11ty

echo "🔄 Humanus Content Migration Helper"
echo "===================================="
echo ""

# List of files to convert (excluding yoga.html which is already done)
FILES=("behandlungen" "praxis" "kontakt" "kilianbegoin" "joachimtoelle" "dominiquemakris" "georgroeske")

echo "📋 Files that need content migration:"
echo ""

for file in "${FILES[@]}"; do
    if [ -f "${file}.html" ]; then
        # Count lines in original file
        lines=$(wc -l < "${file}.html")
        echo "   📄 ${file}.html (${lines} lines)"
        
        # Check if src version exists
        if [ -f "src/${file}.html" ]; then
            echo "      ✅ Template exists in src/"
        else
            echo "      ❌ Template missing in src/"
        fi
    else
        echo "   ⚠️  ${file}.html not found in root directory"
    fi
    echo ""
done

echo "📖 Migration Steps:"
echo ""
echo "1. Open the original file (e.g., behandlungen.html)"
echo "2. Find the <header> closing tag (around line 120)"
echo "3. Find the <footer> opening tag (search for '<footer>')"
echo "4. Copy everything BETWEEN those two tags"
echo "5. Open src/behandlungen.html"
echo "6. Replace the placeholder content with what you copied"
echo "7. Update asset paths: 'assets/' → '/assets/'"
echo "8. Save and check http://localhost:8080 in your browser"
echo ""
echo "💡 Tip: Use yoga.html as a reference - it's fully migrated!"
echo ""
echo "🚀 Your dev server should be running at: http://localhost:8080"
echo ""
