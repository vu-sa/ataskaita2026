// PDF compression script for VU SA Annual Report
const { compress } = require('compress-pdf');
const fs = require('fs');

const compressLithuanianPDF = async () => {
  try {
    console.log('Compressing Lithuanian PDF report...');
    const inputFile = 'VU_SA_Ataskaita_2025_2026.pdf';
    const outputFile = 'VU_SA_Ataskaita_2025_2026.pdf';
    
    // Use the correct API: compress returns a buffer
    const buffer = await compress(inputFile, {
      resolution: 'printer',
    });
    
    // Write the buffer to file
    await fs.promises.writeFile(outputFile, buffer);
    console.log('Lithuanian PDF successfully compressed!');
  } catch (error) {
    console.error('Error compressing Lithuanian PDF:', error);
    process.exit(1);
  }
};

const compressEnglishPDF = async () => {
  try {
    console.log('Compressing English PDF report...');
    const inputFile = 'VU_SR_Report_2025_2026.pdf';
    const outputFile = 'VU_SR_Report_2025_2026.pdf';
    
    // Use the correct API: compress returns a buffer
    const buffer = await compress(inputFile, {
      resolution: 'printer', // 'ebook' is equivalent to medium quality (150 DPI)
    });
    
    // Write the buffer to file
    await fs.promises.writeFile(outputFile, buffer);
    console.log('English PDF successfully compressed!');
  } catch (error) {
    console.error('Error compressing English PDF:', error);
    process.exit(1);
  }
};

// Check which PDF to compress based on command line argument
const args = process.argv.slice(2);
if (args.includes('--en')) {
  compressEnglishPDF();
} else if (args.includes('--lt')) {
  compressLithuanianPDF();
} else {
  // Default to Lithuanian if no argument specified
  compressLithuanianPDF();
}
