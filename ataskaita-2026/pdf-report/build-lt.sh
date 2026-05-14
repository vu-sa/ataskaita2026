#!/bin/bash

# Build script for VU SA Annual Report PDF generation
# This script compiles the Typst document into a PDF and compresses it

echo "Building VU SA Annual Report PDF..."

# Check if Typst is installed
if ! command -v typst &> /dev/null; then
    echo "Error: Typst is not installed. Please install it first."
    echo "Visit https://typst.app/ for installation instructions."
    exit 1
fi

# Navigate to the PDF report directory
cd "$(dirname "$0")"

# Compile the Typst document
typst compile report-lt.typ "VU_SA_Ataskaita_2025_2026.pdf"

# Check if compilation was successful
if [ $? -eq 0 ]; then
    echo "PDF successfully generated: VU_SA_Ataskaita_2025_2026.pdf"

    # Compress the generated PDF
    echo "Compressing PDF..."
    node compress-pdf.js --lt

    echo "PDF generation and compression completed."
else
    echo "Error: PDF generation failed."
    exit 1
fi
