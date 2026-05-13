<script setup lang="ts">
import { ref, onMounted, computed } from 'vue';
import { gsap } from 'gsap';
import { ScrollTrigger } from 'gsap/ScrollTrigger';
import { Trophy, Award, GraduationCap, Heart, Users } from 'lucide-vue-next';

// Register ScrollTrigger
gsap.registerPlugin(ScrollTrigger);

interface Achievement {
  title: string;
  description: string;
  category?: string; // 'representation', 'academic', 'social', 'community'
  icon?: any; // Component reference
  metrics?: string[];
}

interface FeaturedAchievement {
  title: string;
  description: string;
  category?: string;
}

interface AchievementsProps {
  sectionTitle?: string;
  achievements?: Achievement[];
  featuredAchievement?: FeaturedAchievement;
  showCategories?: boolean;
  primaryColor?: string;
  accentColor?: string;
  bgColor?: string;
}

const props = withDefaults(defineProps<AchievementsProps>(), {
  sectionTitle: 'Pasiekimai',
  showCategories: true,
  primaryColor: '#fbad13',
  accentColor: '#b5333e',
  bgColor: '#f8f9fa'
});

// Get category icon
const getCategoryIcon = (category: string) => {
  switch (category) {
    case 'representation':
      return Award;
    case 'academic':
      return GraduationCap;
    case 'social':
      return Heart;
    case 'community':
      return Users;
    default:
      return Trophy;
  }
};

// Group achievements by category if needed
const groupedAchievements = computed(() => {
  if (!props.achievements || !props.showCategories) return null;
  
  const groups: Record<string, Achievement[]> = {
    representation: [],
    academic: [],
    social: [],
    community: []
  };
  
  props.achievements.forEach(achievement => {
    if (achievement.category && groups[achievement.category]) {
      groups[achievement.category].push(achievement);
    }
  });
  
  return groups;
});

// Get category names in Lithuanian
const categoryNames = {
  representation: 'Studentų atstovavimas',
  academic: 'Akademiniai procesai',
  social: 'Socialinė gerovė',
  community: 'Bendruomenės veiklos'
};

// Refs for animation
const containerRef = ref<HTMLElement | null>(null);
const titleRef = ref<HTMLElement | null>(null);
const featuredRef = ref<HTMLElement | null>(null);
const categoryRefs = ref<Record<string, HTMLElement>>({});
const cardRefs = ref<HTMLElement[]>([]);

// Set up animation on mount
onMounted(() => {
  if (containerRef.value && titleRef.value) {
    // Animate title
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
    
    // Animate featured achievement if exists
    if (featuredRef.value) {
      gsap.fromTo(
        featuredRef.value,
        { opacity: 0, y: 30 },
        {
          opacity: 1,
          y: 0,
          duration: 0.8,
          delay: 0.2,
          scrollTrigger: {
            trigger: featuredRef.value,
            start: "top 80%",
          }
        }
      );
    }
    
    // Animate category headers if using categories
    if (props.showCategories && Object.keys(categoryRefs.value).length > 0) {
      gsap.fromTo(
        Object.values(categoryRefs.value),
        { opacity: 0, x: -20 },
        {
          opacity: 1,
          x: 0,
          stagger: 0.15,
          duration: 0.6,
          scrollTrigger: {
            trigger: containerRef.value,
            start: "top 70%",
          }
        }
      );
    }
    
    // Animate achievement cards with stagger
    if (cardRefs.value.length > 0) {
      gsap.fromTo(
        cardRefs.value,
        { opacity: 0, y: 30 },
        {
          opacity: 1,
          y: 0,
          stagger: 0.1,
          duration: 0.6,
          scrollTrigger: {
            trigger: containerRef.value,
            start: "top 70%",
          }
        }
      );
    }
  }
});
</script>

<template>
  <section 
    ref="containerRef"
    class="py-20 px-6 md:px-10"
    :style="{ backgroundColor: bgColor }"
  >
    <div class="container mx-auto max-w-7xl">
      <!-- Section title -->
      <h2 
        ref="titleRef"
        class="text-3xl md:text-4xl font-bold text-center mb-14 relative"
      >
        <!-- Decorative elements -->
        <span 
          class="absolute w-10 h-1 rounded-full left-1/2 -translate-x-1/2 -bottom-3"
          :style="{ backgroundColor: primaryColor }"
        ></span>
        <span 
          class="absolute w-20 h-1 rounded-full left-1/2 -translate-x-1/2 -bottom-6"
          :style="{ backgroundColor: accentColor }"
        ></span>
        
        {{ sectionTitle }}
      </h2>
      
      <!-- Featured achievement if available -->
      <div 
        v-if="featuredAchievement"
        ref="featuredRef"
        class="mb-16 p-8 bg-white dark:bg-gray-800 shadow-lg rounded-lg border-l-4"
        :style="{ borderColor: primaryColor }"
      >
        <div class="flex items-start gap-6">
          <div 
            class="hidden md:flex shrink-0 w-16 h-16 rounded-full items-center justify-center"
            :style="{ backgroundColor: `${primaryColor}20` }"
          >
            <component 
              :is="getCategoryIcon(featuredAchievement.category || '')" 
              class="w-8 h-8"
              :style="{ color: primaryColor }"
            />
          </div>
          
          <div>
            <h3 class="text-2xl font-bold mb-3" :style="{ color: primaryColor }">
              {{ featuredAchievement.title }}
            </h3>
            <p class="text-gray-700 dark:text-gray-300 text-lg">
              {{ featuredAchievement.description }}
            </p>
          </div>
        </div>
      </div>
      
      <!-- Categorized achievements if using categories -->
      <div v-if="showCategories && groupedAchievements" class="space-y-16">
        <div 
          v-for="(achievements, category) in groupedAchievements" 
          :key="category"
          v-show="achievements.length > 0"
          class="space-y-8"
        >
          <!-- Category heading -->
          <div 
            :ref="el => { if(el) categoryRefs[category] = el as HTMLElement }"
            class="flex items-center gap-3 mb-6"
          >
            <div 
              class="w-12 h-12 rounded-full flex items-center justify-center"
              :style="{ backgroundColor: `${primaryColor}20` }"
            >
              <component 
                :is="getCategoryIcon(category)" 
                class="w-6 h-6"
                :style="{ color: primaryColor }"
              />
            </div>
            <h3 class="text-2xl font-bold" :style="{ color: primaryColor }">
              {{ categoryNames[category] }}
            </h3>
          </div>
          
          <!-- Achievements in this category -->
          <div class="grid md:grid-cols-2 lg:grid-cols-3 gap-8">
            <div 
              v-for="(achievement, index) in achievements" 
              :key="`${category}-${index}`"
              :ref="el => { if(el) cardRefs.push(el as HTMLElement) }"
              class="rounded-lg p-6 bg-white dark:bg-gray-800 shadow-md hover:shadow-lg transition-all duration-300 flex flex-col"
              :style="{
                borderTop: `3px solid ${category === 'representation' || category === 'social' ? primaryColor : accentColor}`
              }"
            >
              <!-- Title -->
              <h4 
                class="text-xl font-bold mb-3"
                :style="{
                  color: category === 'representation' || category === 'social' ? primaryColor : accentColor
                }"
              >
                {{ achievement.title }}
              </h4>
              
              <!-- Description -->
              <p class="text-gray-600 dark:text-gray-300 mb-4 flex-grow">
                {{ achievement.description }}
              </p>
              
              <!-- Metrics if available -->
              <div 
                v-if="achievement.metrics && achievement.metrics.length > 0"
                class="mt-4 pt-4 border-t border-gray-200 dark:border-gray-700"
              >
                <ul class="space-y-2">
                  <li 
                    v-for="(metric, mIndex) in achievement.metrics" 
                    :key="mIndex"
                    class="flex items-start gap-2 text-sm text-gray-600 dark:text-gray-400"
                  >
                    <span 
                      class="w-1.5 h-1.5 rounded-full mt-1.5"
                      :style="{
                        backgroundColor: category === 'representation' || category === 'social' ? primaryColor : accentColor
                      }"
                    ></span>
                    {{ metric }}
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
      
      <!-- Non-categorized achievements grid -->
      <div v-if="!showCategories && achievements" class="grid md:grid-cols-2 lg:grid-cols-3 gap-8">
        <div 
          v-for="(achievement, index) in achievements" 
          :key="index"
          :ref="el => { if(el) cardRefs[index] = el as HTMLElement }"
          class="rounded-lg p-6 bg-white dark:bg-gray-800 shadow-md hover:shadow-lg transition-all duration-300 flex flex-col"
          :style="{
            borderTop: `3px solid ${index % 2 === 0 ? primaryColor : accentColor}`
          }"
        >
          <!-- Icon -->
          <div 
            class="mb-4 w-12 h-12 rounded-full flex items-center justify-center"
            :style="{
              backgroundColor: index % 2 === 0 ? `${primaryColor}20` : `${accentColor}20`,
            }"
          >
            <component 
              :is="achievement.category ? getCategoryIcon(achievement.category) : (achievement.icon || Trophy)" 
              class="w-6 h-6"
              :style="{
                color: index % 2 === 0 ? primaryColor : accentColor
              }"
            />
          </div>
          
          <!-- Title -->
          <h3 
            class="text-xl font-bold mb-3"
            :style="{
              color: index % 2 === 0 ? primaryColor : accentColor
            }"
          >
            {{ achievement.title }}
          </h3>
          
          <!-- Description -->
          <p class="text-gray-600 dark:text-gray-300 mb-4 flex-grow">
            {{ achievement.description }}
          </p>
          
          <!-- Metrics if available -->
          <div 
            v-if="achievement.metrics && achievement.metrics.length > 0"
            class="mt-4 pt-4 border-t border-gray-200 dark:border-gray-700"
          >
            <ul class="space-y-2">
              <li 
                v-for="(metric, mIndex) in achievement.metrics" 
                :key="mIndex"
                class="flex items-start gap-2 text-sm text-gray-600 dark:text-gray-400"
              >
                <span 
                  class="w-1.5 h-1.5 rounded-full mt-1.5"
                  :style="{
                    backgroundColor: index % 2 === 0 ? primaryColor : accentColor
                  }"
                ></span>
                {{ metric }}
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<style scoped>
/* Additional styles can be added here if needed */
</style>
