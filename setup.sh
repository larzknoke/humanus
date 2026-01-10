#!/bin/bash

# Humanus 11ty Quick Start Script
# This script helps you get started with the 11ty migration

echo "🏥 Humanus Website - 11ty Migration Setup"
echo "=========================================="
echo ""

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
    echo "❌ Node.js is not installed."
    echo "Please install Node.js from https://nodejs.org/"
    exit 1
fi

echo "✅ Node.js version: $(node --version)"
echo ""

# Check if npm is installed
if ! command -v npm &> /dev/null; then
    echo "❌ npm is not installed."
    exit 1
fi

echo "✅ npm version: $(npm --version)"
echo ""

# Install dependencies
echo "📦 Installing dependencies..."
npm install

if [ $? -eq 0 ]; then
    echo "✅ Dependencies installed successfully!"
    echo ""
else
    echo "❌ Failed to install dependencies"
    exit 1
fi

# Show directory structure
echo "📁 Project Structure:"
echo "   ├── src/               (11ty source files)"
echo "   │   ├── _includes/     (layouts & partials)"
echo "   │   └── *.html         (page templates)"
echo "   ├── assets/            (static files)"
echo "   ├── style.css          (main stylesheet)"
echo "   └── _site/             (generated output)"
echo ""

echo "🎯 Next Steps:"
echo ""
echo "1. Start the development server:"
echo "   npm start"
echo ""
echo "2. Open your browser to: http://localhost:8080"
echo ""
echo "3. Complete the content migration:"
echo "   - See README-MIGRATION.md for detailed instructions"
echo "   - yoga.html is already complete (use as reference)"
echo "   - Other pages have placeholders - add content from original files"
echo ""
echo "4. Build for production:"
echo "   npm run build"
echo ""
echo "📖 For detailed migration instructions, read:"
echo "   README-MIGRATION.md"
echo ""
echo "Happy coding! 🚀"
