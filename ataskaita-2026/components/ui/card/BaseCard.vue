<template>
  <div 
    class="relative group p-6 overflow-hidden rounded-xl bg-white/50 dark:bg-zinc-800/50 backdrop-blur-sm shadow-sm transition-all duration-300 transform hover:-translate-y-1"
    :class="[
      {'border-l-4 border-amber-400': highlight},
      contentClass
    ]"
  >
    <!-- Background gradient -->
    <div class="absolute top-0 left-0 w-full h-full bg-gradient-to-br opacity-10 from-amber-200 via-transparent to-transparent"></div>
    
    <!-- Main content -->
    <div class="flex flex-col z-10 relative">
      <slot></slot>
    </div>
    
    <!-- Animate on hover corner accent -->
    <div class="absolute -bottom-1 -right-1 w-10 h-10 transform rotate-45 translate-x-4 translate-y-4 bg-gradient-to-tr from-amber-500 to-amber-400 opacity-0 group-hover:opacity-100 transition-opacity duration-500"></div>
  </div>
</template>

<script setup lang="ts">
defineProps({
  highlight: {
    type: Boolean,
    default: false
  },
  contentClass: {
    type: String,
    default: ''
  }
});
</script>
