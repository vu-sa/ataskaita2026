#!/usr/bin/env node

// PDF size comparison utility
const fs = require('fs');
const path = require('path');

function formatSize(bytes) {
  if (bytes === 0) return '0 B';
  
  const sizes = ['B', 'KB', 'MB', 'GB'];
  const i = Math.floor(Math.log(bytes) / Math.log(1024));
  
  return `${(bytes / Math.pow(1024, i)).toFixed(2)} ${sizes[i]}`;
}

function compareFileSizes(filePath1, filePath2) {
  if (!fs.existsSync(filePath1)) {
    console.error(`File not found: ${filePath1}`);
    return;
  }
  
  const size1 = fs.statSync(filePath1).size;
  console.log(`${path.basename(filePath1)}: ${formatSize(size1)}`);
  
  if (filePath2 && fs.existsSync(filePath2)) {
    const size2 = fs.statSync(filePath2).size;
    console.log(`${path.basename(filePath2)}: ${formatSize(size2)}`);
    
    const reduction = size1 - size2;
    const reductionPercent = (reduction / size1 * 100).toFixed(2);
    
    if (reduction > 0) {
      console.log(`Size reduced by: ${formatSize(reduction)} (${reductionPercent}%)`);
    } else {
      console.log(`Size increased by: ${formatSize(Math.abs(reduction))} (${Math.abs(reductionPercent)}%)`);
    }
  }
}

// Get file(s) to analyze from command line arguments
const args = process.argv.slice(2);

if (args.length === 0) {
  console.log(`
Usage: node pdf-size-info.js <file-path> [comparison-file-path]

Examples:
  node pdf-size-info.js VU_SA_Ataskaita_2024_2025.pdf
  node pdf-size-info.js original.pdf compressed.pdf
`);
} else if (args.length === 1) {
  compareFileSizes(args[0]);
} else {
  compareFileSizes(args[0], args[1]);
}
