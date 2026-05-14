<template>
  <div class="relative">
    <!-- Section title -->
    <h2 class="timeline-title">{{ title }}</h2>

    <!-- Timeline container -->
    <div class="relative max-w-3xl mx-auto mt-12">
      <!-- Single red rail -->
      <div class="timeline-rail" />

      <!-- Timeline items -->
      <div
        v-for="(event, index) in events"
        :key="index"
        class="relative pl-12 md:pl-16 pb-14 last:pb-0"
      >
        <!-- Rail marker -->
        <div class="timeline-dot">
          <div class="timeline-dot__pulse" />
        </div>

        <!-- Date -->
        <div
          :ref="el => { if (el) timelineRefs[index] = el }"
          class="timeline-date"
        >
          {{ event.date }}
        </div>

        <!-- Content card -->
        <div :ref="el => { if (el) contentRefs[index] = el }">
          <BaseCard>
            <h3 class="text-xl font-bold">
              {{ event.title }}
            </h3>
            <p class="text-gray-600 dark:text-gray-300 my-1! leading-6!">
              {{ event.description }}
            </p>

            <!-- Optional image -->
            <img
              v-if="event.image"
              :src="event.image"
              :alt="event.title"
              class="w-full h-48 object-cover shadow-sm mt-4"
            >

            <!-- Optional button -->
            <div v-if="event.link" class="mt-4">
              <VPButton :href="event.link" text="Sužinoti daugiau" class="transition-all duration-300" />
            </div>
          </BaseCard>
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

  props.events.forEach((_, index) => {
    const timelineEl = timelineRefs.value[index];
    const contentEl = contentRefs.value[index];

    if (timelineEl && contentEl) {
      gsap.set([timelineEl, contentEl], {
        opacity: 0,
        x: 30
      });

      gsap.to([timelineEl, contentEl], {
        opacity: 1,
        x: 0,
        duration: 0.7,
        ease: "power2.out",
        scrollTrigger: {
          trigger: contentEl,
          start: "top bottom-=100",
          toggleActions: "play none none none"
        },
        stagger: 0.15
      });
    }
  });
});
</script>

<style scoped>
.timeline-title {
  font-weight: 700;
  font-size: clamp(1.875rem, 4vw, 2.25rem);
  line-height: 1.2;
  text-align: center;
  margin-bottom: 1rem;
  border-top: 0 !important;
  padding-top: 0 !important;
}

.timeline-rail {
  position: absolute;
  top: 0.5rem;
  bottom: 0.5rem;
  left: 1.25rem;
  width: 3px;
  background: linear-gradient(
    to bottom,
    transparent,
    var(--vusa-red) 8%,
    var(--vusa-yellow) 92%,
    transparent
  );
}

@media (min-width: 768px) {
  .timeline-rail {
    left: 1.75rem;
  }
}

.timeline-dot {
  position: absolute;
  left: 1.25rem;
  top: 0.35rem;
  width: 1.05rem;
  height: 1.05rem;
  transform: translateX(-50%);
  background: var(--vusa-surface);
  border: 3px solid var(--vusa-red);
  border-radius: 9999px;
  z-index: 2;
  display: flex;
  align-items: center;
  justify-content: center;
}

@media (min-width: 768px) {
  .timeline-dot {
    left: 1.75rem;
  }
}

.timeline-dot__pulse {
  width: 0.4rem;
  height: 0.4rem;
  border-radius: 9999px;
  background: var(--vusa-red);
  animation: timeline-ping 1.6s cubic-bezier(0, 0, 0.2, 1) infinite;
}

@keyframes timeline-ping {
  75%, 100% {
    transform: scale(2.4);
    opacity: 0;
  }
}

.timeline-date {
  font-weight: 800;
  font-size: clamp(1.25rem, 3vw, 1.6rem);
  line-height: 1.1;
  letter-spacing: -0.01em;
  color: var(--vusa-red);
  margin-bottom: 0.85rem;
}

/* Raised surface so cards separate from the section-band behind them */
:deep(.vusa-card) {
  background: var(--vusa-surface-raised);
}
</style>
