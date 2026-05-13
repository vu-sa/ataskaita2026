// Advanced PDF compression configuration for VU SA Annual Report
const { compress } = require('compress-pdf');
const path = require('path');
const fs = require('fs');

/**
 * PDF Compression settings
 * 
 * Resolution levels (according to the compress-pdf API):
 * - "screen": 72 DPI, lowest quality, smallest file size (good for viewing on screens)
 * - "ebook": 150 DPI, medium quality (good for e-readers)
 * - "printer": 300 DPI, high quality (good for printing)
 * - "prepress": 300 DPI, highest quality (for professional printing)
 */

// Configuration options for different compression profiles
const compressionProfiles = {
  minimal: {
    resolution: 'screen',   // 72 DPI, lowest quality
    compatibilityLevel: 1.4 // More compatible with older readers
  },
  balanced: {
    resolution: 'ebook',    // 150 DPI, medium quality
    compatibilityLevel: 1.5 // Good balance of features and compatibility
  },
  high: {
    resolution: 'printer',  // 300 DPI, high quality for printing
    compatibilityLevel: 1.6 // Modern PDF features
  }
};

const compressPDFWithProfile = async (inputFile, outputFile, profile = 'balanced') => {
  // Get the selected profile or use balanced as default
  const settings = compressionProfiles[profile] || compressionProfiles.balanced;
  
  try {
    console.log(`Compressing ${inputFile} with ${profile} profile...`);
    
    // Use the compress function which returns a buffer
    const buffer = await compress(inputFile, {
      resolution: settings.resolution,
      compatibilityLevel: settings.compatibilityLevel
    });
    
    // Write the buffer to the output file
    await fs.promises.writeFile(outputFile, buffer);
    
    console.log(`Successfully compressed: ${outputFile}`);
  } catch (error) {
    console.error(`Error compressing ${inputFile}:`, error);
    process.exit(1);
  }
};

// Parse command line arguments
const args = process.argv.slice(2);
const fileArg = args.find(arg => !arg.startsWith('--'));
const profileArg = args.find(arg => arg.startsWith('--profile='));
const profile = profileArg ? profileArg.split('=')[1] : 'balanced';

// Determine which file to compress
if (args.includes('--lt')) {
  compressPDFWithProfile('VU_SA_Ataskaita_2025_2026.pdf', 'VU_SA_Ataskaita_2025_2026.pdf', profile);
} else if (args.includes('--en')) {
  compressPDFWithProfile('VU_SR_Report_2025_2026.pdf', 'VU_SR_Report_2025_2026.pdf', profile);
} else if (fileArg) {
  // Custom file compression
  const inputFile = fileArg;
  const outputFile = args.find(arg => arg.startsWith('--output=')) 
    ? args.find(arg => arg.startsWith('--output=')).split('=')[1] 
    : inputFile;
  
  compressPDFWithProfile(inputFile, outputFile, profile);
} else {
  console.log(`
Usage: node compress-pdf-advanced.js [options]

Options:
  --lt                           Compress Lithuanian report
  --en                           Compress English report
  --profile=<profile>            Compression profile (minimal, balanced, high)
  --output=<output-file>         Custom output file path
  <input-file>                   Custom input file path

Examples:
  node compress-pdf-advanced.js --lt --profile=minimal
  node compress-pdf-advanced.js --en --profile=high
  node compress-pdf-advanced.js custom.pdf --output=compressed.pdf --profile=balanced
`);
}
