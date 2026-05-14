#!/bin/bash

# Build script for VU SA Annual Report PDF generation (English version)
# This script compiles the English Typst document into a PDF and compresses it

echo "Building VU SA Annual Report PDF (English version)..."

# Check if Typst is installed
if ! command -v typst &> /dev/null; then
    echo "Error: Typst is not installed. Please install it first."
    echo "Visit https://typst.app/ for installation instructions."
    exit 1
fi

# Navigate to the PDF report directory
cd "$(dirname "$0")"

# Check if English report file exists
if [ ! -f "report-en.typ" ]; then
    echo "Error: report-en.typ does not exist. Please create the English report template first."
    exit 1
fi

# Compile the Typst document
typst compile report-en.typ "VU_SR_Report_2024_2025.pdf"

# Check if compilation was successful
if [ $? -eq 0 ]; then
    echo "PDF successfully generated: VU_SR_Report_2024_2025.pdf"

    # Compress the generated PDF
    echo "Compressing PDF..."
    node compress-pdf.js --en

    echo "PDF generation and compression completed."
else
    echo "Error: PDF generation failed."
    exit 1
fi
