<template>
  <div 
    v-if="showProgress" 
    class="fixed top-0 left-0 right-0 h-1 z-50 bg-gradient-to-r from-amber-400 to-amber-500 shadow-md transition-all duration-300"
    :style="{ width: `${progress}%`, opacity: opacity }"
  ></div>
</template>

<script setup lang="ts">
import { ref, onMounted, onUnmounted, computed } from 'vue';

const props = defineProps({
  threshold: {
    type: Number,
    default: 100 // Only show progress after scrolling past this amount (in pixels)
  },
  hideAtBottom: {
    type: Boolean,
    default: true // Hide the progress bar when at the bottom of the page
  },
  bottomOffset: {
    type: Number,
    default: 50 // Pixels from bottom to consider "at bottom" for better UX
  }
});

// State
const progress = ref(0);
const scrollTop = ref(0);
const documentHeight = ref(0);
const windowHeight = ref(0);
const showProgress = ref(false);

// Calculate progress percentage
const calculateProgress = () => {
  // Get current scroll position
  scrollTop.value = window.scrollY || document.documentElement.scrollTop;
  
  // Get document height
  documentHeight.value = Math.max(
    document.body.scrollHeight,
    document.body.offsetHeight,
    document.documentElement.clientHeight,
    document.documentElement.scrollHeight,
    document.documentElement.offsetHeight
  );
  
  // Get window height
  windowHeight.value = window.innerHeight;
  
  // Calculate scroll progress
  const scrollable = documentHeight.value - windowHeight.value;
  progress.value = scrollable > 0 ? (scrollTop.value / scrollable) * 100 : 0;
  
  // Show progress bar only after scrolling past threshold
  showProgress.value = scrollTop.value > props.threshold;
};

// Computed opacity - fade out when at bottom if hideAtBottom is true
const opacity = computed(() => {
  if (!props.hideAtBottom) return 1;
  
  const scrollable = documentHeight.value - windowHeight.value;
  const remaining = scrollable - scrollTop.value;
  
  if (remaining < props.bottomOffset) {
    // Fade out as we approach the bottom
    return Math.max(0, remaining / props.bottomOffset);
  }
  
  return 1;
});

// Event handlers
const handleScroll = () => {
  calculateProgress();
};

const handleResize = () => {
  calculateProgress();
};

// Lifecycle hooks
onMounted(() => {
  calculateProgress();
  window.addEventListener('scroll', handleScroll);
  window.addEventListener('resize', handleResize);
});

onUnmounted(() => {
  window.removeEventListener('scroll', handleScroll);
  window.removeEventListener('resize', handleResize);
});
</script>
