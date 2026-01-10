#!/usr/bin/env python3
"""
Script to automate conversion of HTML files to 11ty templates.
Extracts content between </header> and <footer> tags and creates proper 11ty templates.
"""

import re
import os
from pathlib import Path

# File configurations: (source_file, title, permalink)
FILES_TO_CONVERT = [
    ('behandlungen.html', 'Behandlungen - Humanus Praxis', '/behandlungen.html'),
    ('praxis.html', 'Praxisgemeinschaft - Humanus', '/praxis.html'),
    ('kontakt.html', 'Kontakt & Impressum - Humanus', '/kontakt.html'),
    ('kilianbegoin.html', 'Kilian Begoin - Humanus Team', '/kilianbegoin.html'),
    ('joachimtoelle.html', 'Joachim Tölle - Humanus Team', '/joachimtoelle.html'),
    ('dominiquemakris.html', 'Dominique Makris-Fleer - Humanus Team', '/dominiquemakris.html'),
    ('georgroeske.html', 'Georg Röske - Humanus Team', '/georgroeske.html'),
]

def extract_content(html_file):
    """Extract content between </header> and <footer>"""
    with open(html_file, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # Find content after </header> tag
    header_match = re.search(r'</header>\s*', content, re.IGNORECASE | re.DOTALL)
    if not header_match:
        print(f"WARNING: Could not find </header> in {html_file}")
        return None
    
    start = header_match.end()
    
    # Find content before <footer> tag
    footer_match = re.search(r'\s*<footer>', content[start:], re.IGNORECASE)
    if not footer_match:
        print(f"WARNING: Could not find <footer> in {html_file}")
        return None
    
    end = start + footer_match.start()
    
    main_content = content[start:end].strip()
    
    # Update asset paths from relative to absolute
    main_content = re.sub(r'(src|href)="assets/', r'\1="/assets/', main_content)
    
    return main_content

def create_11ty_template(content, title, permalink):
    """Create an 11ty template with front matter"""
    template = f"""---
layout: layouts/base.njk
title: {title}
permalink: {permalink}
---

{content}
"""
    return template

def main():
    """Main conversion process"""
    root_dir = Path(__file__).parent
    src_dir = root_dir / 'src'
    
    print("🔄 Starting HTML to 11ty conversion...")
    print("")
    
    converted = 0
    failed = 0
    
    for source_file, title, permalink in FILES_TO_CONVERT:
        print(f"Processing {source_file}...")
        
        source_path = root_dir / source_file
        if not source_path.exists():
            print(f"  ❌ Source file not found: {source_file}")
            failed += 1
            continue
        
        # Extract content
        content = extract_content(source_path)
        if content is None:
            failed += 1
            continue
        
        # Create 11ty template
        template = create_11ty_template(content, title, permalink)
        
        # Write to src folder
        dest_path = src_dir / source_file
        dest_path.write_text(template, encoding='utf-8')
        
        print(f"  ✅ Converted to {dest_path}")
        converted += 1
    
    print("")
    print("="*50)
    print(f"✅ Successfully converted: {converted} files")
    if failed > 0:
        print(f"❌ Failed: {failed} files")
    print("")
    print("Next steps:")
    print("1. Check the converted files in the src/ folder")
    print("2. Run 'npm start' to see the results")
    print("3. View at http://localhost:8080")

if __name__ == '__main__':
    main()
