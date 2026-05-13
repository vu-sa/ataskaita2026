<script setup lang="ts">
import { ref, onMounted } from 'vue';
import { gsap } from 'gsap';
import { ScrollTrigger } from 'gsap/ScrollTrigger';
import { LeafyGreen, Bike, Sprout, Recycle, Wind } from 'lucide-vue-next';

gsap.registerPlugin(ScrollTrigger);

interface SustainabilityInitiative {
  title: string;
  description: string;
  impact: string;
  icon?: any; // Component reference
}

interface SustainabilityGoal {
  title: string;
  target: number;
  current: number;
  unit: string;
}

interface SustainabilitySectionProps {
  sectionTitle?: string;
  introduction?: string;
  initiatives: SustainabilityInitiative[];
  goals?: SustainabilityGoal[];
  partners?: string[];
  quote?: { text: string; author: string; };
  primaryColor?: string;
  accentColor?: string;
}

const props = withDefaults(defineProps<SustainabilitySectionProps>(), {
  sectionTitle: 'Darnaus vystymosi iniciatyvos',
  introduction: '',
  goals: () => [],
  partners: () => [],
  primaryColor: '#fbad13',
  accentColor: '#b5333e',
});

// The default green color for sustainability
const greenColor = ref('#22c55e');

// Default sustainability icons
const defaultIcons = [LeafyGreen, Bike, Sprout, Recycle, Wind];

// Animation refs
const containerRef = ref<HTMLElement | null>(null);
const titleRef = ref<HTMLElement | null>(null);
const initiativesRef = ref<HTMLElement | null>(null);
const goalsRef = ref<HTMLElement | null>(null);
const partnersRef = ref<HTMLElement | null>(null);
const quoteRef = ref<HTMLElement | null>(null);

// Calculate progress percentage
const calculateProgress = (current: number, target: number): number => {
  const percentage = (current / target) * 100;
  return Math.min(percentage, 100); // Cap at 100%
};

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

  // Animate initiatives
  if (initiativesRef.value) {
    const initiatives = initiativesRef.value.querySelectorAll('.initiative-item');

    gsap.fromTo(
      initiatives,
      { opacity: 0, y: 20 },
      {
        opacity: 1,
        y: 0,
        stagger: 0.15,
        duration: 0.6,
        scrollTrigger: {
          trigger: initiativesRef.value,
          start: "top 75%",
        }
      }
    );
  }

  // Animate goals
  if (goalsRef.value) {
    // Animate the goal cards first
    gsap.fromTo(
      goalsRef.value.querySelectorAll('.goal-item'),
      { opacity: 0, y: 20 },
      {
        opacity: 1,
        y: 0,
        stagger: 0.15,
        duration: 0.6,
        scrollTrigger: {
          trigger: goalsRef.value,
          start: "top 75%",
        }
      }
    );

    // Then animate the progress bars with a delay
    gsap.fromTo(
      goalsRef.value.querySelectorAll('.progress-bar'),
      { width: 0 },
      {
        width: 'var(--progress-width)',
        duration: 1,
        stagger: 0.15,
        delay: 0.5,
        ease: "power2.out",
        scrollTrigger: {
          trigger: goalsRef.value,
          start: "top 75%",
        }
      }
    );
  }

  // Animate partners
  if (partnersRef.value) {
    gsap.fromTo(
      partnersRef.value.querySelectorAll('li'),
      { opacity: 0, x: -20 },
      {
        opacity: 1,
        x: 0,
        stagger: 0.1,
        duration: 0.5,
        scrollTrigger: {
          trigger: partnersRef.value,
          start: "top 80%",
        }
      }
    );
  }

  // Animate quote
  if (quoteRef.value) {
    gsap.fromTo(
      quoteRef.value,
      { opacity: 0, y: 20 },
      {
        opacity: 1,
        y: 0,
        duration: 0.8,
        scrollTrigger: {
          trigger: quoteRef.value,
          start: "top 80%",
        }
      }
    );
  }
});
</script>

<template>
  <section ref="containerRef" class="py-20 px-6 md:px-10 bg-white dark:bg-gray-900">
    <div class="container mx-auto max-w-6xl">
      <!-- Section title with leaf icon -->
      <div ref="titleRef" class="flex flex-col items-center mb-10">
        <div class="w-16 h-16 rounded-full flex items-center justify-center mb-4"
          :style="{ backgroundColor: `${greenColor}15` }">
          <LeafyGreen class="w-8 h-8" :style="{ color: greenColor }" />
        </div>

        <h2 class="text-3xl md:text-4xl font-bold text-center">
          {{ sectionTitle }}
        </h2>
      </div>

      <!-- Introduction if provided -->
      <p v-if="introduction" class="text-lg text-center text-gray-700 dark:text-gray-300 mb-14 max-w-4xl mx-auto">
        {{ introduction }}
      </p>

      <!-- Sustainability Initiatives -->
      <div ref="initiativesRef" class="mb-16">
        <h3 class="text-2xl font-bold mb-8 text-center">
          Iniciatyvos
        </h3>

        <div class="grid md:grid-cols-2 lg:grid-cols-3 gap-8">
          <div v-for="(initiative, index) in initiatives" :key="index"
            class="initiative-item bg-white dark:bg-gray-800 rounded-lg p-6 shadow-md border-t-4 hover:shadow-lg transition-shadow duration-300"
            :style="{
              borderColor: greenColor
            }">
            <!-- Initiative icon -->
            <div class="inline-flex items-center justify-center w-12 h-12 rounded-full mb-4" :style="{
              backgroundColor: `${greenColor}15`
            }">
              <component :is="initiative.icon || defaultIcons[index % defaultIcons.length]" class="w-6 h-6" :style="{
                color: greenColor
              }" />
            </div>

            <!-- Initiative title -->
            <h4 class="text-xl font-bold mb-3" :style="{
              color: greenColor
            }">
              {{ initiative.title }}
            </h4>

            <!-- Initiative description -->
            <p class="text-gray-700 dark:text-gray-300 mb-4">
              {{ initiative.description }}
            </p>

            <!-- Initiative impact -->
            <div class="bg-gray-50 dark:bg-gray-700 p-3 rounded-md">
              <span class="font-bold">Poveikis:</span> {{ initiative.impact }}
            </div>
          </div>
        </div>
      </div>

      <!-- Goals and Partners in a two-column layout -->
      <div class="grid md:grid-cols-2 gap-8 mb-16">
        <!-- Goals column -->
        <div v-if="goals && goals.length > 0" ref="goalsRef" class="space-y-6">
          <h3 class="text-2xl font-bold mb-6" :style="{ color: greenColor }">
            Darnaus vystymosi tikslai
          </h3>

          <div v-for="(goal, index) in goals" :key="index"
            class="goal-item bg-white dark:bg-gray-800 rounded-lg p-5 shadow-md">
            <div class="flex justify-between items-center mb-2">
              <h4 class="font-bold">
                {{ goal.title }}
              </h4>
              <div class="text-sm">
                <span class="font-bold" :style="{ color: greenColor }">
                  {{ goal.current }}
                </span>
                <span class="text-gray-500 dark:text-gray-400">
                  / {{ goal.target }} {{ goal.unit }}
                </span>
              </div>
            </div>

            <!-- Progress bar -->
            <div class="h-3 bg-gray-200 dark:bg-gray-700 rounded-full overflow-hidden">
              <div class="h-full progress-bar transition-all duration-1000 rounded-full" :style="{
                backgroundColor: greenColor,
                '--progress-width': `${calculateProgress(goal.current, goal.target)}%`
              }" />
            </div>
          </div>
        </div>

        <!-- Partners column -->
        <div v-if="partners && partners.length > 0" ref="partnersRef">
          <h3 class="text-2xl font-bold mb-6" :style="{ color: accentColor }">
            Darnaus vystymosi partneriai
          </h3>

          <div class="bg-white dark:bg-gray-800 rounded-lg p-6 shadow-md">
            <ul class="space-y-3">
              <li v-for="(partner, index) in partners" :key="index" class="flex items-start gap-2">
                <span class="w-2 h-2 rounded-full mt-1.5" :style="{ backgroundColor: accentColor }" />
                <span>{{ partner }}</span>
              </li>
            </ul>
          </div>
        </div>
      </div>

      <!-- Image with SDG goals as decorative element -->
      <div class="relative mb-16 text-center">
        <div class="bg-gray-100 dark:bg-gray-800 rounded-lg p-6 inline-block">
          <!-- <img 
            src="../src/public/img/logos/un-sdg.png" 
            alt="UN Sustainable Development Goals" 
            class="max-w-full h-auto max-h-24"
          /> -->
        </div>
      </div>

      <!-- Quote if provided -->
      <div v-if="quote" ref="quoteRef" class="max-w-4xl mx-auto mb-8 rounded-lg overflow-hidden shadow-lg">
        <div class="p-8" :style="{
          backgroundColor: `${greenColor}10`,
          borderLeft: `5px solid ${greenColor}`
        }">
          <blockquote class="text-xl italic text-gray-700 dark:text-gray-300 mb-4">
            {{ quote.text }}
          </blockquote>

          <div class="text-right">
            <div class="font-bold" :style="{ color: greenColor }">
              {{ quote.author }}
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<style scoped>
.progress-bar {
  width: 0;
}
</style>
