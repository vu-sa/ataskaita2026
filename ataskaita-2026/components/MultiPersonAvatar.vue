<template>
  <div class="relative flex" :class="{ 'justify-end': alignRight }">
    <TooltipProvider>
      <div
        v-for="(person, index) in displayedPeople"
        :key="person.id || index"
        class="group relative"
        :class="{ 
          '-mr-3': !isLast(index) && !noOverlap,
          'mr-2': noOverlap,
          'z-10': isHovered === index,
          'z-0': isHovered !== index
        }"
        :style="{ zIndex: people.length - index }"
        @mouseenter="isHovered = index"
        @mouseleave="isHovered = null"
      >
        <Tooltip>
          <TooltipTrigger>
            <div 
              class="transition-transform duration-200 rounded-full"
              :class="{ 
                'hover:scale-110 hover:-translate-y-1': !noTransform
              }"
            >
              <Avatar 
                :class="{
                  'size-8': size === 'tiny',
                  'size-12': size === 'small',
                  'size-16': size === 'normal',
                  'border-1 border-background': true
                }"
              >
                <AvatarImage 
                  :src="person.src" 
                  :alt="person.name || 'Person avatar'" 
                  class="object-cover aspect-square"
                />
                <AvatarFallback :class="person.fallbackClass">
                  {{ getInitials(person.name) }}
                </AvatarFallback>
              </Avatar>
            </div>
          </TooltipTrigger>
          
          <TooltipContent v-if="showTooltip" :side-offset="5" :arrow="false">
            <div class="flex flex-col">
              <span class="font-bold text-sm">{{ person.name }}</span>
              <span v-if="person.role" class="text-xs opacity-75">{{ person.role }}</span>
              <span v-if="!person.fullTerm && person.period" class="text-xs opacity-75">{{ person.period }}</span>
            </div>
          </TooltipContent>
        </Tooltip>
      </div>

      <span v-if="maxDisplay && people.length > maxDisplay" class="relative flex items-center justify-center">
        <div 
          class="flex items-center justify-center"
          :class="{ '-ml-3': !noOverlap }"
        >
          <Avatar 
            :class="{
              'size-8': size === 'tiny',
              'size-12': size === 'small',
              'size-16': size === 'normal',
              'border-2 border-background': true
            }"
          >
            <AvatarFallback class="bg-muted text-muted-foreground">
              <span class="text-xs font-medium">+{{ people.length - maxDisplay }}</span>
            </AvatarFallback>
          </Avatar>
        </div>
      </span>
    </TooltipProvider>
  </div>
</template>

<script setup lang="ts">
import { ref, computed } from 'vue';
import { Tooltip, TooltipContent, TooltipProvider, TooltipTrigger } from './ui/tooltip';
import { Avatar, AvatarImage, AvatarFallback } from './ui/avatar';
import { cn } from './lib/utils';
import { Person } from './lib/personUtils';

const props = defineProps<{
  people: Person[];
  size?: 'tiny' | 'small' | 'normal';
  maxDisplay?: number;
  showTooltip?: boolean;
  noOverlap?: boolean;
  noTransform?: boolean;
  alignRight?: boolean;
}>();

const isHovered = ref<number | null>(null);

// Default properties
const size = props.size || 'small';
const showTooltip = props.showTooltip !== false;

// If maxDisplay is set, limit visible people
const displayedPeople = computed(() => {
  if (props.maxDisplay && props.people.length > props.maxDisplay) {
    return props.people.slice(0, props.maxDisplay);
  }
  return props.people;
});

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

const isLast = (index: number) => {
  if (props.maxDisplay) {
    return index === props.maxDisplay - 1;
  }
  return index === props.people.length - 1;
};
</script>
