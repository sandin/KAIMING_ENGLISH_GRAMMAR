#!/bin/bash

# KAIMING ENGLISH GRAMMAR EPUB Build Script

set -e

echo "Starting KAIMING ENGLISH GRAMMAR EPUB build..."

# Check if pandoc is installed
if ! command -v pandoc &> /dev/null; then
    echo "Error: pandoc not found. Please install pandoc first."
    echo "Installation methods:"
    echo "  Ubuntu/Debian: sudo apt-get install pandoc"
    echo "  macOS: brew install pandoc"
    echo "  Windows: Download from https://pandoc.org/installing.html"
    exit 1
fi

# Create ebook directory if it doesn't exist
mkdir -p ebook

# Get all chapter files, sorted numerically
chapter_files=$(find chapters -name "*.md" | sort -V)
output_file=ebook/AIMING_ENGLISH_GRAMMAR.epub

if [ -z "$chapter_files" ]; then
    echo "Error: No markdown files found in translate directory"
    echo "Please ensure you have translated chapters in the translate/ directory"
    exit 1
fi

echo "Found chapter files:"
echo "$chapter_files"

# Build epub file
echo "Generating epub file..."

pandoc \
    --from=markdown \
    --to=epub3 \
    --output=$output_file \
    --epub-cover-image=pages/page_1.png \
    --css=epub.css \
    --metadata=title:"KAIMING ENGLISH GRAMMAR" \
    --metadata=author:"Lin Yutang" \
    --metadata=language:"zh-CN" \
    --metadata=description:"An OCR version of Lin Yutang's classic English grammar book" \
    --table-of-contents \
    --toc-depth=2 \
    $chapter_files

# Check if build was successful
if [ -f "$output_file" ]; then
    file_size=$(du -h "$output_file" | cut -f1)
    echo "✅ EPUB build successful!"
    echo "📖 File location: $output_file"
    echo "📊 File size: $file_size"
else
    echo "❌ EPUB build failed"
    exit 1
fi
