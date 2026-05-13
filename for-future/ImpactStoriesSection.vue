<script setup lang="ts">
import { ref, onMounted } from 'vue';
import { gsap } from 'gsap';
import { ScrollTrigger } from 'gsap/ScrollTrigger';
import TestimonialCarousel from './TestimonialCarousel.vue';
import { Quote } from 'lucide-vue-next';

gsap.registerPlugin(ScrollTrigger);

interface ImpactStory {
  studentName: string;
  studentPhoto?: string;
  quote: string;
  impactMetrics?: string[];
}

interface ImpactStoriesProps {
  sectionTitle?: string;
  stories: ImpactStory[];
  featuredStory?: ImpactStory;
  primaryColor?: string;
  accentColor?: string;
}

const props = withDefaults(defineProps<ImpactStoriesProps>(), {
  sectionTitle: 'Poveikio istorijos',
  primaryColor: '#fbad13',
  accentColor: '#b5333e',
});

// Animation refs
const containerRef = ref<HTMLElement | null>(null);
const titleRef = ref<HTMLElement | null>(null);
const featuredStoryRef = ref<HTMLElement | null>(null);
const carouselRef = ref<HTMLElement | null>(null);

onMounted(() => {
  // Animate title
  if (titleRef.value) {
    gsap.fromTo(
      titleRef.value,
      { opacity: 0, y: 20 },
      {
        opacity: 1,
        y: 0,
        duration: 0.8,
        scrollTrigger: {
          trigger: titleRef.value,
          start: "top 80%",
        }
      }
    );
  }
  
  // Animate featured story
  if (featuredStoryRef.value) {
    gsap.fromTo(
      featuredStoryRef.value,
      { opacity: 0, y: 30 },
      {
        opacity: 1,
        y: 0,
        duration: 0.8,
        scrollTrigger: {
          trigger: featuredStoryRef.value,
          start: "top 75%",
        }
      }
    );
  }
  
  // Animate carousel
  if (carouselRef.value) {
    gsap.fromTo(
      carouselRef.value,
      { opacity: 0, y: 30 },
      {
        opacity: 1,
        y: 0,
        duration: 0.8,
        scrollTrigger: {
          trigger: carouselRef.value,
          start: "top 75%",
        }
      }
    );
  }
});
</script>

<template>
  <section 
    ref="containerRef"
    class="py-20 px-6 md:px-10 bg-white dark:bg-gray-900"
  >
    <div class="container mx-auto max-w-6xl">
      <!-- Section title -->
      <h2 
        ref="titleRef"
        class="text-3xl md:text-4xl font-bold text-center mb-12"
      >
        {{ sectionTitle }}
      </h2>
      
      <!-- Featured impact story if provided -->
      <div 
        v-if="featuredStory"
        ref="featuredStoryRef"
        class="mb-16 bg-gray-50 dark:bg-gray-800 rounded-lg overflow-hidden"
      >
        <div class="grid md:grid-cols-2">
          <!-- Image side -->
          <div v-if="featuredStory.studentPhoto" class="h-full">
            <img 
              :src="featuredStory.studentPhoto" 
              :alt="featuredStory.studentName"
              class="w-full h-full object-cover aspect-square md:aspect-auto"
            />
          </div>
          
          <!-- Content side -->
          <div class="p-8 flex flex-col justify-center">
            <div 
              class="inline-flex items-center justify-center w-12 h-12 rounded-full mb-6"
              :style="{ backgroundColor: `${primaryColor}20` }"
            >
              <Quote 
                class="w-6 h-6" 
                :style="{ color: primaryColor }"
              />
            </div>
            
            <blockquote class="text-xl italic mb-6">
              "{{ featuredStory.quote }}"
            </blockquote>
            
            <div class="mb-6">
              <p class="font-bold text-lg">{{ featuredStory.studentName }}</p>
            </div>
            
            <!-- Impact metrics if provided -->
            <div v-if="featuredStory.impactMetrics && featuredStory.impactMetrics.length">
              <h4 
                class="text-lg font-bold mb-3"
                :style="{ color: accentColor }"
              >
                Poveikis
              </h4>
              
              <ul class="space-y-2">
                <li 
                  v-for="(metric, index) in featuredStory.impactMetrics" 
                  :key="index"
                  class="flex items-start gap-2"
                >
                  <span 
                    class="w-2 h-2 rounded-full mt-1.5"
                    :style="{ backgroundColor: accentColor }"
                  ></span>
                  <span>{{ metric }}</span>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
      
      <!-- Impact stories carousel -->
      <div 
        v-if="stories && stories.length > 0"
        ref="carouselRef"
      >
        <h3 class="text-2xl font-bold mb-8 text-center">
          Studentų istorijos
        </h3>
        
        <TestimonialCarousel
          :testimonials="stories.map(story => ({
            name: story.studentName,
            content: story.quote,
            image: story.studentPhoto
          }))"
          :primary-color="primaryColor"
          :accent-color="accentColor"
        />
      </div>
    </div>
  </section>
</template>

<style scoped>
/* Any additional styling needed */
</style>
