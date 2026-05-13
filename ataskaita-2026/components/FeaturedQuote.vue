<template>
  <BaseCard :content-class="'p-6 md:p-10'">
    <!-- Large quote marks -->
    <div class="absolute top-6 left-6 text-8xl md:text-9xl font-serif opacity-20 select-none leading-none">
      "
    </div>
    <div class="absolute bottom-6 right-6 text-8xl md:text-9xl font-serif opacity-20 select-none leading-none">
      "
    </div>
    
    <!-- Content -->
    <div class="relative z-10 max-w-4xl mx-auto">
      <!-- Quote text -->
      <blockquote class="text-lg md:text-2xl font-medium italic mb-6 md:mb-8 text-gray-800 dark:text-gray-100">
        {{ quote }}
      </blockquote>
      
      <!-- Author information -->
      <div class="flex items-center">
        <div v-if="imageSrc" class="mr-4">
          <img 
            :src="imageSrc" 
            :alt="author" 
            class="w-16 h-16 object-cover rounded-full shadow-md border-2 border-white dark:border-gray-700"
          />
        </div>
        <div>
          <p class="font-bold text-lg">{{ author }}</p>
          <p class="text-gray-600 dark:text-gray-400">{{ position }}</p>
        </div>
      </div>
    </div>
  </BaseCard>
</template>

<script setup lang="ts">
import { BaseCard } from './ui/card';

defineProps({
  quote: {
    type: String,
    required: true
  },
  author: {
    type: String,
    required: true
  },
  position: {
    type: String,
    default: ''
  },
  imageSrc: {
    type: String,
    default: ''
  },
  highlight: {
    type: Boolean,
    default: false
  }
});
</script>
