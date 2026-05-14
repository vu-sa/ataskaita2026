<template>
  <div class="relative">
    <!-- Section title -->
    <h2 class="text-3xl md:text-4xl font-bold text-center mb-16">
      {{ title }}
    </h2>

    <!-- Timeline container -->
    <div class="relative max-w-5xl mx-auto mt-12">
      <!-- Center line -->
      <div
        class="absolute left-1/2 transform -translate-x-1/2 h-full w-1 bg-gradient-to-b from-amber-100 via-amber-400 to-amber-100 dark:from-amber-900 dark:via-amber-500 dark:to-amber-900" />

      <!-- Timeline items -->
      <div v-for="(event, index) in events" :key="index" class="relative mb-12">
        <div class="flex flex-col md:flex-row items-center group"
          :class="index % 2 === 0 ? 'md:flex-row' : 'md:flex-row-reverse'">
          <!-- Date marker -->
          <div class="flex-1 md:w-1/2 text-center"
            :class="index % 2 === 0 ? 'md:text-right md:pr-10' : 'md:text-left md:pl-10'">
            <div :ref="el => { if (el) timelineRefs[index] = el }"
              class="inline-block px-4 py-2 rounded-lg text-white font-bold text-lg shadow-md bg-gradient-to-r from-amber-500 to-amber-400 transform transition-transform duration-300 group-hover:scale-110">
              {{ event.date }}
            </div>
          </div>

          <!-- Center dot -->
          <div
            class="absolute left-1/2 transform -translate-x-1/2 w-6 h-6 rounded-full max-md:-top-8 bg-white dark:bg-gray-800 border-4 border-amber-500 z-10 flex items-center justify-center">
            <div class="w-2 h-2 rounded-full bg-amber-500 animate-ping opacity-75" />
          </div>

          <!-- Content -->
          <div class="flex-1 md:w-1/2 mt-6 md:mt-0 text-center"
            :class="index % 2 === 0 ? 'md:text-left md:pl-10' : 'md:text-right md:pr-10'">
            <div :ref="el => { if (el) contentRefs[index] = el }">
              <BaseCard>
                <h3 class="text-xl font-bold">
                  {{ event.title }}
                </h3>
                <p class="text-gray-600 dark:text-gray-300 my-1! leading-6!">
                  {{ event.description }}
                </p>

                <!-- Optional image -->
                <img v-if="event.image" :src="event.image" :alt="event.title"
                  class="w-full h-48 object-cover rounded-md shadow-sm mt-4">

                <!-- Optional button -->
                <div v-if="event.link" class="mt-4">
                  <VPButton :href="event.link" text="Sužinoti daugiau" class="transition-all duration-300" />
                </div>
              </BaseCard>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue';
import gsap from 'gsap';
import { BaseCard } from './ui/card';
import VPButton from "vitepress/dist/client/theme-default/components/VPButton.vue";

interface TimelineEvent {
  date: string;
  title: string;
  description: string;
  image?: string;
  link?: string;
}

const props = defineProps<{
  title: string;
  events: TimelineEvent[];
}>();

const timelineRefs = ref<HTMLElement[]>([]);
const contentRefs = ref<HTMLElement[]>([]);

onMounted(async () => {
  const { default: ScrollTrigger } = await import('gsap/ScrollTrigger');
  gsap.registerPlugin(ScrollTrigger);

  // Add animation for timeline items
  props.events.forEach((_, index) => {
    const timelineEl = timelineRefs.value[index];
    const contentEl = contentRefs.value[index];

    if (timelineEl && contentEl) {
      gsap.set([timelineEl, contentEl], {
        opacity: 0,
        y: index % 2 === 0 ? -30 : 30
      });

      gsap.to([timelineEl, contentEl], {
        opacity: 1,
        y: 0,
        duration: 0.8,
        ease: "power2.out",
        scrollTrigger: {
          trigger: contentEl,
          start: "top bottom-=100",
          toggleActions: "play none none none"
        },
        stagger: 0.2
      });
    }
  });
});
</script>
