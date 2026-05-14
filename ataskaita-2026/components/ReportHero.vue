<template>
  <section class="report-hero" :aria-label="title">
    <div ref="gridRef" class="report-hero__grid dot-grid" />
    <div class="report-hero__inner">
      <span class="section-eyebrow report-hero__eyebrow">{{ eyebrow }}</span>

      <img class="report-hero__logo" :src="logoSrc" :alt="title" />

      <h1 class="report-hero__title">{{ title }}</h1>
      <p class="report-hero__period">{{ period }}</p>

      <div class="report-hero__actions">
        <VPButton
          v-for="action in actions"
          :key="action.link"
          :href="action.link"
          :text="action.text"
          :theme="action.theme"
        />
      </div>
    </div>
  </section>
</template>

<script setup lang="ts">
import { computed, ref, onMounted, onUnmounted } from 'vue';
import { useDark } from '@vueuse/core';
import VPButton from 'vitepress/dist/client/theme-default/components/VPButton.vue';

interface HeroAction {
  theme?: 'brand' | 'alt';
  text: string;
  link: string;
}

const props = defineProps<{
  eyebrow: string;
  title: string;
  period: string;
  logoLight: string;
  logoDark: string;
  actions: HeroAction[];
}>();

const isDark = useDark();
const logoSrc = computed(() => (isDark.value ? props.logoDark : props.logoLight));

// Dot-grid wave: each cycle picks a new random travel direction so the
// brighter wave enters from a different side every time.
const gridRef = ref<HTMLElement>();

const waveDirections = [
  { angle: '115deg', from: '105% 105%', to: '-5% -5%' }, // bottom-right -> top-left
  { angle: '115deg', from: '-5% -5%', to: '105% 105%' }, // top-left -> bottom-right
  { angle: '65deg', from: '105% -5%', to: '-5% 105%' },  // top-right -> bottom-left
  { angle: '65deg', from: '-5% 105%', to: '105% -5%' },  // bottom-left -> top-right
];

let currentDir = -1;

function randomizeWave() {
  const el = gridRef.value;
  if (!el) return;
  let next = Math.floor(Math.random() * waveDirections.length);
  if (next === currentDir) next = (next + 1) % waveDirections.length;
  currentDir = next;
  const d = waveDirections[next];
  el.style.setProperty('--wave-angle', d.angle);
  el.style.setProperty('--wave-from', d.from);
  el.style.setProperty('--wave-to', d.to);
}

onMounted(() => {
  randomizeWave();
  gridRef.value?.addEventListener('animationiteration', randomizeWave);
});

onUnmounted(() => {
  gridRef.value?.removeEventListener('animationiteration', randomizeWave);
});
</script>

<style scoped>
.report-hero {
  position: relative;
  overflow: hidden;
  padding: 4rem 1.5rem 3.5rem;
  isolation: isolate;
}

.report-hero__grid {
  position: absolute;
  inset: 0;
  z-index: -1;
  -webkit-mask-image: radial-gradient(ellipse 70% 65% at 50% 35%, #000 0%, transparent 78%);
  mask-image: radial-gradient(ellipse 70% 65% at 50% 35%, #000 0%, transparent 78%);
  opacity: 0.9;

  /* wave defaults — randomised per cycle by the component script */
  --wave-angle: 115deg;
  --wave-from: 105% 105%;
  --wave-to: -5% -5%;
}

/* A slow, soft wave of brighter dots travelling across the grid */
.report-hero__grid::after {
  content: "";
  position: absolute;
  inset: 0;
  background-image: radial-gradient(var(--vusa-red) 1.7px, transparent 1.7px);
  background-size: 22px 22px;
  -webkit-mask-image: linear-gradient(var(--wave-angle), transparent 38%, #000 50%, transparent 62%);
  mask-image: linear-gradient(var(--wave-angle), transparent 38%, #000 50%, transparent 62%);
  -webkit-mask-repeat: no-repeat;
  mask-repeat: no-repeat;
  -webkit-mask-size: 280% 280%;
  mask-size: 280% 280%;
  animation: hero-dots-wave 11s ease-in-out infinite;
}

@keyframes hero-dots-wave {
  0% {
    -webkit-mask-position: var(--wave-from);
    mask-position: var(--wave-from);
  }
  100% {
    -webkit-mask-position: var(--wave-to);
    mask-position: var(--wave-to);
  }
}

@media (prefers-reduced-motion: reduce) {
  .report-hero__grid::after {
    animation: none;
    opacity: 0;
  }
}

.report-hero__inner {
  max-width: 48rem;
  margin: 0 auto;
  display: flex;
  flex-direction: column;
  align-items: center;
  text-align: center;
}

.report-hero__eyebrow {
  margin-bottom: 2rem;
}

.report-hero__logo {
  height: 200px;
  max-width: 100%;
  width: auto;
  margin-bottom: 1.75rem;
}

.report-hero__title {
  font-size: clamp(2rem, 6vw, 3.25rem);
  font-weight: 800;
  line-height: 1.05;
  letter-spacing: -0.02em;
  margin: 0;
  color: var(--vusa-ink);
}

.report-hero__period {
  position: relative;
  font-size: clamp(1.05rem, 2.5vw, 1.4rem);
  font-weight: 700;
  letter-spacing: 0.04em;
  color: var(--vusa-red);
  margin: 0.6rem 0 0;
  padding-bottom: 0.75rem;
}

.report-hero__period::after {
  /* yellow energy accent under the period */
  content: "";
  position: absolute;
  left: 50%;
  bottom: 0;
  transform: translateX(-50%);
  width: 2.5rem;
  height: 4px;
  background: var(--vusa-yellow);
}

.report-hero__actions {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  gap: 0.75rem;
  margin-top: 2rem;
}

.report-hero__actions :deep(a.VPButton) {
  text-decoration: none;
}

@media (min-width: 768px) {
  .report-hero {
    padding: 5.5rem 1.5rem 4.5rem;
  }

  .report-hero__logo {
    height: 300px;
  }
}
</style>
