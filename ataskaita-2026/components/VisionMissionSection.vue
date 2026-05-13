<script setup lang="ts">
import { ref, onMounted } from 'vue';
import { gsap } from 'gsap';
import { ScrollTrigger } from 'gsap/ScrollTrigger';

// Register GSAP plugins only in browser environment
if (typeof window !== 'undefined') {
  gsap.registerPlugin(ScrollTrigger);
}

interface VisionMissionProps {
  vision: string;
  mission: string;
  primaryColor?: string;
  accentColor?: string;
  values?: Array<{ title: string; description: string; icon?: string }>;
}

const props = withDefaults(defineProps<VisionMissionProps>(), {
  primaryColor: '#fbad13',
  accentColor: '#b5333e',
  values: () => []
});

// Refs for animation
const containerRef = ref<HTMLElement | null>(null);
const visionRef = ref<HTMLElement | null>(null);
const missionRef = ref<HTMLElement | null>(null);
const valuesRef = ref<HTMLElement | null>(null);

onMounted(() => {
  if (containerRef.value) {
    // Create a GSAP timeline that's triggered by scrolling
    gsap.timeline({
      scrollTrigger: {
        trigger: containerRef.value,
        start: "top 80%",
        end: "bottom 20%",
        toggleActions: "play none none none",
      }
    })
    .fromTo(
      visionRef.value, 
      { opacity: 0, y: 30 }, 
      { opacity: 1, y: 0, duration: 0.7 }
    )
    .fromTo(
      missionRef.value, 
      { opacity: 0, y: 30 }, 
      { opacity: 1, y: 0, duration: 0.7 },
      "-=0.4"
    );
    
    // Animate values with stagger if they exist
    if (valuesRef.value && props.values.length > 0) {
      gsap.fromTo(
        valuesRef.value.querySelectorAll('.value-item'),
        { opacity: 0, y: 20 },
        { 
          opacity: 1, 
          y: 0, 
          stagger: 0.15,
          duration: 0.6,
          scrollTrigger: {
            trigger: valuesRef.value,
            start: "top 75%",
          }
        }
      );
    }
  }
});
</script>

<template>
  <section ref="containerRef" class="py-20 px-6 md:px-10 bg-white dark:bg-gray-900">
    <div class="container mx-auto max-w-6xl">
      <!-- Section title -->
      <h2 class="text-3xl md:text-4xl font-bold text-center mb-12">Vizija ir misija</h2>
      
      <!-- Vision and Mission cards in a grid -->
      <div class="grid md:grid-cols-2 gap-8 mb-16">
        <!-- Vision Card -->
        <div 
          ref="visionRef"
          class="rounded-lg p-6 md:p-8 shadow-lg dark:shadow-accent/10 relative overflow-hidden"
          :style="{ 
            backgroundColor: 'white', 
            borderLeft: `4px solid ${primaryColor}`,
            boxShadow: `0 10px 15px -3px ${primaryColor}20, 0 4px 6px -2px ${primaryColor}10`
          }"
        >
          <h3 
            class="text-2xl font-bold mb-4"
            :style="{ color: primaryColor }"
          >
            Vizija
          </h3>
          
          <p class="text-lg text-gray-700 dark:text-gray-300">
            {{ vision }}
          </p>
          
          <!-- Decorative element -->
          <div 
            class="absolute -top-10 -right-10 w-40 h-40 rounded-full opacity-10"
            :style="{ backgroundColor: primaryColor }"
            aria-hidden="true"
          ></div>
        </div>
        
        <!-- Mission Card -->
        <div 
          ref="missionRef"
          class="rounded-lg p-6 md:p-8 shadow-lg dark:shadow-accent/10 relative overflow-hidden"
          :style="{ 
            backgroundColor: 'white', 
            borderLeft: `4px solid ${accentColor}`,
            boxShadow: `0 10px 15px -3px ${accentColor}20, 0 4px 6px -2px ${accentColor}10`
          }"
        >
          <h3 
            class="text-2xl font-bold mb-4"
            :style="{ color: accentColor }"
          >
            Misija
          </h3>
          
          <p class="text-lg text-gray-700 dark:text-gray-300">
            {{ mission }}
          </p>
          
          <!-- Decorative element -->
          <div 
            class="absolute -top-10 -right-10 w-40 h-40 rounded-full opacity-10"
            :style="{ backgroundColor: accentColor }"
            aria-hidden="true"
          ></div>
        </div>
      </div>
      
      <!-- Values section -->
      <div v-if="values && values.length" ref="valuesRef">
        <h3 class="text-2xl font-bold text-center mb-10">Mūsų vertybės</h3>
        
        <div class="grid sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-5 gap-6">
          <div 
            v-for="(value, index) in values" 
            :key="index"
            class="value-item flex flex-col items-center p-5 bg-white dark:bg-gray-800 rounded-lg shadow-md transition-all duration-300 hover:shadow-lg hover:translate-y-[-5px]"
          >
            <!-- Icon or image if provided -->
            <div 
              v-if="value.icon" 
              class="flex items-center justify-center w-16 h-16 rounded-full mb-4"
              :style="{ 
                backgroundColor: index % 2 === 0 ? `${primaryColor}15` : `${accentColor}15`,
                color: index % 2 === 0 ? primaryColor : accentColor 
              }"
            >
              <component :is="value.icon" class="w-8 h-8" />
            </div>
            
            <!-- Title -->
            <h4 
              class="text-xl font-bold mb-2 text-center"
              :style="{ color: index % 2 === 0 ? primaryColor : accentColor }"
            >
              {{ value.title }}
            </h4>
            
            <!-- Description -->
            <p class="text-sm text-gray-600 dark:text-gray-400 text-center">
              {{ value.description }}
            </p>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<style scoped>
/* Any additional scoped styles */
</style>
