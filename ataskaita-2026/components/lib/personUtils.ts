import { computed } from 'vue';
import people from '../../src/data/dariniai.csv';
import padaliniai from '../../src/data/padaliniai.csv';
import { formatImagePath } from './imageUtils';

/**
 * Interface for Person object used in MultiPersonAvatar and PersonAvatar components
 */
export interface Person {
  id?: string | number;
  name: string;        // Person's full name (used for display and fallback initials)
  role?: string;       // Person's role/position (optional)
  src: string;         // Image URL/path
  alt?: string;        // Alt text for image (falls back to name if not provided)
  fallbackClass?: string; // Optional custom CSS class for avatar fallback styling
  period?: string;     // Time period of the role (optional)
  fullTerm?: boolean;  // Whether the person served a full term (optional)
}

/**
 * Interface for TeamMember object used in TeamAvatarLayout component
 * Extends Person with additional properties
 */
export interface TeamMember extends Person {
  title: string;      // Role/position title
  avatar: string;     // Image path
  period?: string;    // Time period for the role
  fullTerm?: boolean; // Whether the person served a full term
  padalinys?: string; // The unit/department the person belongs to
}

/**
 * Helper function to get person information by name or list of names
 * @param nameOrNames - Single name or array of names to fetch
 * @param dataSource - Which data source to use ('dariniai' or 'padaliniai')
 * @param fallbackImage - Optional fallback image path if person not found
 * @returns Person object(s) ready for MultiPersonAvatar component
 */
export const getPersonByName = (
  nameOrNames: string | string[], 
  dataSource: 'dariniai' | 'padaliniai' = 'dariniai', 
  fallbackImage: string = '/img/people/placeholder.jpg'
): Person | Person[] => {
  // Select the data source
  const dataSet = dataSource === 'dariniai' ? people : padaliniai;
  
  // Function to process a single name
  const processSingleName = (name: string): Person => {
    const person = dataSet.find(p => p['Vardas Pavardė'] === name);
    
    if (person) {
      return {
        name: person['Vardas Pavardė'],
        role: person['Pareigos'],
        src: formatImagePath(person['Nuotraukos pavadinimas']),
        period: person['Laikotarpis'],
        fullTerm: person['Ar išbuvo pilną kadenciją?'] === 'Taip'
      };
    }
    
    // Return fallback if person not found
    return {
      name: name,
      role: '',
      src: fallbackImage
    };
  };
  
  // Handle array of names or single name
  if (Array.isArray(nameOrNames)) {
    return nameOrNames.map(processSingleName);
  } else {
    return processSingleName(nameOrNames);
  }
};

/**
 * Helper function to get people by department/unit
 * @param department - Name of the department/unit to filter by
 * @param dataSource - Which data source to use ('dariniai' or 'padaliniai')
 * @returns Array of person objects ready for MultiPersonAvatar
 */
export const getPersonsByDepartment = (
  department: string,
  dataSource: 'dariniai' | 'padaliniai' = 'dariniai'
): Person[] => {
  const dataSet = dataSource === 'dariniai' ? people : padaliniai;
  const departmentField = dataSource === 'dariniai' ? 'Darinys' : 'Padalinys';
  
  return dataSet
    .filter(person => person[departmentField] === department)
    .map(person => ({
      name: person['Vardas Pavardė'],
      title: person['Pareigos'],
      role: person['Pareigos'],
      avatar: formatImagePath(person['Nuotraukos pavadinimas']),
      src: formatImagePath(person['Nuotraukos pavadinimas']),
      period: person['Laikotarpis'],
      fullTerm: person['Ar išbuvo pilną kadenciją?'] === 'Taip'
    }));
};

/**
 * Helper function to get people by role/position
 * @param roleTitle - The role/position title to filter by (or array of roles)
 * @param dataSource - Which data source to use ('dariniai' or 'padaliniai')
 * @returns Array of person objects formatted as TeamMembers
 */
export const getPersonsByRole = (
  roleTitle: string | string[],
  dataSource: 'dariniai' | 'padaliniai' = 'padaliniai'
): TeamMember[] => {
  const dataSet = dataSource === 'dariniai' ? people : padaliniai;
  const roleTitles = Array.isArray(roleTitle) ? roleTitle : [roleTitle];
  const departmentField = dataSource === 'dariniai' ? 'Darinys' : 'Padalinys';
  
  return dataSet
    .filter(person => {
      // Check if the person's role matches any of the provided role titles
      // This handles multi-line role entries by splitting and checking each line
      const personRoles = person['Pareigos'].split('\n');
      return personRoles.some(role => 
        roleTitles.some(title => 
          role.trim().toLowerCase().includes(title.toLowerCase())
        )
      );
    })
    .map(person => ({
      name: person['Vardas Pavardė'],
      title: person['Pareigos'].split('\n')[0], // Get the first role if multiple
      role: person['Pareigos'],
      avatar: formatImagePath(person['Nuotraukos pavadinimas']),
      src: formatImagePath(person['Nuotraukos pavadinimas']),
      period: person['Laikotarpis'],
      fullTerm: person['Ar išbuvo pilną kadenciją?'] === 'Taip',
      padalinys: person[departmentField] || undefined
    }));
};

/**
 * Helper function to get people by column value
 * @param columnName - The column name to filter by
 * @param value - The value or array of values to match
 * @param dataSource - Which data source to use ('dariniai' or 'padaliniai')
 * @returns Array of person objects formatted as TeamMembers
 */
export const getPersonsByColumn = (
  columnName: string,
  value: string | string[],
  dataSource: 'dariniai' | 'padaliniai' = 'padaliniai'
): TeamMember[] => {
  const dataSet = dataSource === 'dariniai' ? people : padaliniai;
  const values = Array.isArray(value) ? value : [value];
  const departmentField = dataSource === 'dariniai' ? 'Darinys' : 'Padalinys';
  
  return dataSet
    .filter(person => {
      if (!person[columnName]) return false;
      
      // Handle multi-line fields by splitting and checking each line
      const fieldValues = person[columnName].includes('\n') 
        ? person[columnName].split('\n') 
        : [person[columnName]];
        
      return fieldValues.some(fieldValue => 
        values.some(v => 
          fieldValue.trim().toLowerCase().includes(v.toLowerCase())
        )
      );
    })
    .map(person => ({
      name: person['Vardas Pavardė'],
      title: person['Pareigos'].split('\n')[0], // Get the first role if multiple
      role: person['Pareigos'],
      avatar: formatImagePath(person['Nuotraukos pavadinimas']),
      src: formatImagePath(person['Nuotraukos pavadinimas']),
      period: person['Laikotarpis'],
      fullTerm: person['Ar išbuvo pilną kadenciją?'] === 'Taip',
      padalinys: person[departmentField] || undefined
    }));
};

/**
 * Get all people from CSV data formatted for MultiPersonAvatar component
 */
export const allPeople = computed((): Person[] => {
  return people.map(person => ({
    name: person['Vardas Pavardė'],
    role: person['Pareigos'],
    src: formatImagePath(person['Nuotraukos pavadinimas']),
    period: person['Laikotarpis'],
    fullTerm: person['Ar išbuvo pilną kadenciją?'] === 'Taip'
  }));
});

/**
 * Extract names from a comma-separated string or text containing names
 * @param text - Text containing names, typically comma-separated
 * @returns Array of cleaned names 
 */
export const extractNamesFromText = (text: string): string[] => {
  // Replace common separators with a consistent one
  const normalizedText = text
    .replace(/–/g, '-') // Normalize dashes
    .replace(/ - /g, ', ')
    .replace(/\([^)]*\)/g, '') // Remove text in parentheses
    .replace(/\.\s+/g, ', ')   // Replace period+space with comma
    .replace(/;/g, ',');       // Replace semicolons with commas

  // Split by comma and clean up each name
  return normalizedText
    .split(',')
    .map(name => name.trim())
    .filter(name => 
      name && 
      name !== '' && 
      !name.toLowerCase().includes('nuo') && 
      !name.toLowerCase().includes('iki') &&
      !name.match(/^\d/) // Filter out entries that start with numbers
    );
};

// <section class="lg:px-2 px-1.5 isolate my-20">
//   <div class="max-w-6xl mx-auto">
//     <div class="text-center mb-12">
//       <h2 class="text-3xl md:text-4xl font-bold mb-4">VU SA komanda</h2>
//       <p class="text-lg max-w-3xl mx-auto">Susipažinkite su VU SA Centrinio biuro komanda, kuri dirba užtikrindama studentų gerovę ir atstovaudama jų interesams.</p>
//     </div>
//     <div class="grid grid-cols-1 md:grid-cols-2 gap-8 mb-12">
//       <div class="bg-gradient-to-br from-amber-500/10 via-white to-amber-500/5 dark:from-amber-900/20 dark:via-gray-800 dark:to-amber-900/10 p-8 rounded-xl shadow-md">
//         <h3 class="text-xl font-bold mb-4">Centrinis biuras</h3>
//         <p class="mb-6">Centrinis biuras koordinuoja visų VU SA padalinių veiklą ir rūpinasi kasdieniais organizacijos reikalais.</p>
//         <div class="flex flex-col space-y-6">
//           <div>
//             <h4 class="font-semibold mb-2">Komandos nariai</h4>
//             <MultiPersonAvatar 
//               :people="centralOfficeTeam" 
//               size="small"
//               :showTooltip="true"
//             />
//           </div>
//         </div>
//       </div>
//       <div class="bg-gradient-to-br from-amber-500/10 via-white to-amber-500/5 dark:from-amber-900/20 dark:via-gray-800 dark:to-amber-900/10 p-8 rounded-xl shadow-md">
//         <h3 class="text-xl font-bold mb-4">Pavyzdžiai, kaip naudoti MultiPersonAvatar komponentą</h3>
//         <div class="flex flex-col space-y-8">
//           <div>
//             <h4 class="font-semibold mb-2">Standartiniu dydžiu:</h4>
//             <MultiPersonAvatar 
//               :people="centralOfficeTeam.slice(0, 4)" 
//               size="normal" 
//             />
//           </div>
//           <div>
//             <h4 class="font-semibold mb-2">Mažu dydžiu, be persidengimo:</h4>
//             <MultiPersonAvatar 
//               :people="centralOfficeTeam.slice(0, 4)" 
//               size="small" 
//               :noOverlap="true"
//             />
//           </div>
//           <div>
//             <h4 class="font-semibold mb-2">Su maksimaliu rodomu skaičiumi:</h4>
//             <MultiPersonAvatar 
//               :people="centralOfficeTeam" 
//               size="small" 
//               :maxDisplay="3"
//             />
//           </div>
//           <div>
//             <h4 class="font-semibold mb-2">Lygiuota į dešinę:</h4>
//             <MultiPersonAvatar 
//               :people="centralOfficeTeam.slice(0, 4)" 
//               size="small" 
//               :alignRight="true"
//             />
//           </div>
//           <div>
//             <h4 class="font-semibold mb-2">Naudojant getPersonByName funkciją (pagal vardą):</h4>
//             <MultiPersonAvatar 
//               :people="[getPersonByName('Klėja Merčaitytė')]" 
//               size="small" 
//             />
//           </div>
//           <div>
//             <h4 class="font-semibold mb-2">Naudojant getPersonByName funkciją (pagal vardų masyvą):</h4>
//             <MultiPersonAvatar 
//               :people="getPersonByName(['Klėja Merčaitytė', 'Viktorija Milko', 'Armandas Gucaitis'])" 
//               size="small" 
//             />
//           </div>
//           <div>
//             <h4 class="font-semibold mb-2">Naudojant getPersonsByDepartment funkciją:</h4>
//             <MultiPersonAvatar 
//               :people="getPersonsByDepartment('Centrinis biuras').slice(0, 3)" 
//               size="small" 
//             />
//           </div>
//         </div>
//       </div>
//     </div>
//   </div>
