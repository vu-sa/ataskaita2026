/**
 * Utility functions for handling images in the VU SA Annual Report
 */

/**
 * Converts a relative image path from CSV to a proper public URL path
 * Handles different image formats and potential path issues
 * 
 * @param imagePath - The image filename from CSV data
 * @param pathPrefix - Optional path prefix to add to the image path
 * @returns A proper URL to the image
 */
export const formatImagePath = (imagePath: string, pathPrefix: string = '/img/people/'): string => {
  if (!imagePath) return '/img/people/placeholder.jpg';
  
  // Trim any extra whitespace that might be in the CSV
  const cleanPath = imagePath.trim();
  
  // Handle case where the image already has a full path
  if (cleanPath.startsWith('/')) {
    return cleanPath;
  }
  
  // Remove any double slashes and combine the path
  return `${pathPrefix}${cleanPath}`.replace(/\/\//g, '/');
};

/**
 * Extracts a person's name from an image filename
 * Useful as a fallback when explicit name is not provided
 * 
 * @param imagePath - The image path/filename
 * @returns Extracted person name or empty string if unable to extract
 */
export const extractNameFromImagePath = (imagePath: string): string => {
  if (!imagePath) return '';
  
  try {
    // Extract filename from path
    const filename = imagePath.split('/').pop() || '';
    
    // Remove extension
    const nameWithoutExt = filename.split('.')[0];
    
    // Format the name (replace hyphens with spaces, etc.)
    const formattedName = nameWithoutExt
      .split('-')
      .slice(0, 2) // Take first two parts (usually first and last name)
      .map(part => part.charAt(0).toUpperCase() + part.slice(1).toLowerCase())
      .join(' ');
      
    return formattedName;
  } catch (error) {
    console.error('Error extracting name from image path:', error);
    return '';
  }
};

/**
 * Utility function specifically for VU SA project structure
 * Handles different paths for web and PDF versions
 * 
 * @param imageName - Base image filename from CSV
 * @param context - Context in which the image is being used ('web' or 'pdf')
 * @returns A path appropriate for the context
 */
export const getVuSaImagePath = (imageName: string, context: 'web' | 'pdf' = 'web'): string => {
  if (!imageName) return context === 'web' 
    ? '/img/people/placeholder.jpg'
    : '../public/img/people/placeholder.jpg';
  
  const cleanName = imageName.trim();
  
  // Different paths based on context
  const basePath = context === 'web' 
    ? '/img/people/' 
    : '../public/img/people/';
  
  return `${basePath}${cleanName}`;
};
