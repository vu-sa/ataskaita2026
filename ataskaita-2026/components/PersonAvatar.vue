<template>
  <div class="grid grid-cols-[auto_1fr] gap-4 items-center">
    <Avatar :class="{
      'size-8': size === 'tiny',
      'size-12': size === 'small',
      'size-16': size === 'normal',
    }">
      <AvatarImage :src="src" :alt="alt" class="object-cover w-full h-full avatar-image" />
      <AvatarFallback>
        {{ getInitials(alt || '') }}
      </AvatarFallback>
    </Avatar>

    <div>
      <slot />
    </div>
  </div>
</template>

<script setup lang="ts">
import { Avatar, AvatarImage, AvatarFallback } from './ui/avatar';

const props = defineProps<{
  alt: string;
  src: string;
  size?: 'tiny' | 'small' | 'normal';
}>();

const size = props.size ?? 'normal';

/**
 * Get initials from a name for the avatar fallback
 * Safely handles empty or undefined names
 */
const getInitials = (name: string): string => {
  if (!name || typeof name !== 'string') return '';
  
  return name
    .split(' ')
    .filter(Boolean) // Filter out empty parts
    .map(part => part.charAt(0).toUpperCase())
    .slice(0, 2)
    .join('');
};
</script>

<style>
/* Ensure avatar images maintain proper aspect ratio */
.avatar-image {
  width: 100%;
  height: 100%;
  object-fit: cover;
}
</style>
