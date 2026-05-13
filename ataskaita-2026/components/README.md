# VU SA Team Display Components

This directory contains components for displaying team members and organizations structure in the VU SA Annual Report 2024-2025.

## Components

### TeamAvatarLayout

Displays a grid of team members with their avatars, names, roles and optionally term periods and padalinys names.

```vue
<TeamAvatarLayout 
  :members="teamMembers"
  :showTitle="true"        <!-- Show/hide role titles (default: true) -->
  :showPadalinys="true"    <!-- Show/hide padalinys names (default: true) -->
  :sortByPadalinys="true"  <!-- Sort members by padalinys (default: true) -->
  :avatarSize="normal"     <!-- Avatar size: 'tiny', 'small', or 'normal' (default) -->
/>
```

### PersonAvatar

A single person avatar component with name and title display.

```vue
<PersonAvatar :src="imagePath" :alt="personName" size="normal">
  <div class="flex flex-col">
    <strong>Person Name</strong>
    <span>Person Title</span>
  </div>
</PersonAvatar>
```

### MultiPersonAvatar

Displays multiple avatars in a row with optional overlap effect, tooltips and more.

```vue
<MultiPersonAvatar
  :people="peopleArray"
  size="normal"
  :maxDisplay="5"
  :showTooltip="true"
/>
```

## Utility Functions

### personUtils.ts

This file contains helpful functions for working with people data from CSV files:

- `getPersonByName` - Get person info by name
- `getPersonsByDepartment` - Get all people from a specific department
- `getPersonsByRole` - Get people by their role/position
- `getPersonsByColumn` - Get people by matching any column value

### imageUtils.ts

Contains utilities for handling image paths:

- `formatImagePath` - Format image paths consistently 
- `extractNameFromImagePath` - Extract name from image filename
- `getVuSaImagePath` - Get context-specific paths for web or PDF

## Data Structure

Team members are displayed based on CSV data with the following structure:

- `Vardas Pavardė` - Person's full name
- `Pareigos` - Role/position title
- `Laikotarpis` - Term period
- `Ar išbuvo pilną kadenciją?` - Whether they served a full term ("Taip"/"Ne")
- `Nuotraukos pavadinimas` - Image filename
- `Padalinys`/`Darinys` - Department/unit name

## Usage Examples

```vue
<script setup>
import { getPersonsByRole, getPersonsByColumn } from './components/lib/personUtils';

// Get all chairs from all units
const pirmininkai = getPersonsByRole("Pirminink", "padaliniai");

// Get members from a specific unit
const chgfMembers = getPersonsByColumn("Padalinys", "VU SA CHGF", "padaliniai");
</script>

<template>
  <div>
    <h2>Unit Chairs</h2>
    <TeamAvatarLayout 
      :members="pirmininkai"
      :showTitle="false"        <!-- Hide titles since section heading already indicates the role -->
      :sortByPadalinys="true"   <!-- Sort by padalinys alphabetically -->
    />
    
    <h2>CHGF Members</h2>
    <TeamAvatarLayout 
      :members="chgfMembers"
      :showPadalinys="false"    <!-- Hide padalinys since we're showing only one unit -->
    />
    
    <!-- Show team without sorting by padalinys -->
    <h2>Central Office Team</h2>
    <TeamAvatarLayout 
      :members="centralOfficeTeam"
      :sortByPadalinys="false"  
    />
  </div>
</template>
```

## Styling

The components use Tailwind CSS for styling and are designed to be responsive. Avatar sizes can be configured through the `size` prop:

- `tiny` - 32px (size-8)
- `small` - 48px (size-12)
- `normal` - 64px (size-16)
