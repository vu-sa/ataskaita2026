# VU SA Annual Report 2026 - PDF Generation

This directory contains scripts and templates to generate a professional PDF version of the VU SA Annual Report using Typst.

## Prerequisites

- Install [Typst](https://typst.app/) on your machine
- Ensure the cmarker package is available (version 0.1.5 or later)

## Directory Structure

- `report.typ` - The main Typst file that imports and compiles all content
- `templates/` - Contains layout and styling templates
- `src/` - Symbolic link to assets, images, markdown files
- `build.sh` - Script to compile the Typst document into a PDF

## Customizing the PDF

### Customizing the Layout

Edit the templates in the `templates/` directory to customize:
- Page layout and margins
- Font styles and sizes
- Header and footer design
- Title page appearance

### Branding and Colors

The main colors are defined in `report.typ`:
- Primary color (amber/gold): `#fbad13`
- Accent color (dark red): `#b5333e`

## Notes

- This PDF generator uses the `cmarker` package to convert Markdown to Typst
- Image paths are resolved relative to the `report.typ` file
