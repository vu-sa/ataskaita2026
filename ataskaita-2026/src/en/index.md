---
layout: home
---

<script setup lang="ts">
import { computed } from 'vue';
import stats from "../data/stats.json"
import galleryImages from "../data/gallery.json"
import timelineData from "../data/timeline.json"
import people from "../data/dariniai.csv"

import VPButton from "vitepress/dist/client/theme-default/components/VPButton.vue";
import ReportHero from "@/ReportHero.vue";
import PersonAvatar from "@/PersonAvatar.vue";
import EnhancedNumberStatistic from "@/EnhancedNumberStatistic.vue";
import ImageMosaic from "@/ImageMosaic.vue";
import InteractiveTimeline from "@/InteractiveTimeline.vue";

import { Building, Star, Lightbulb, Users, Turtle } from 'lucide-vue-next';

const iconMap = {
  Star,
  Building,
  Lightbulb,
  Users,
  Turtle,
};

const heroActions = [
  { theme: 'brand', text: 'Learn about this year!', link: '/en/mvp/strateginiai' },
  { theme: 'alt', text: 'Download PDF Report', link: '/VU_SR_Report_2025_2026.pdf' },
];

const timelineEvents = timelineData.en;
</script>

<ReportHero
  eyebrow="United for the future of students!"
  title="ANNUAL REPORT"
  period="2025–2026"
  logo-light="/img/logos/vusa-en-b.png"
  logo-dark="/img/logos/vusa-en-w.png"
  :actions="heroActions"
/>

<!-- Introduction -->
<section class="section-band lg:px-2 px-1.5 isolate py-16">
  <div class="max-w-6xl mx-auto">
    <span class="section-eyebrow"><span class="eyebrow-num">01</span> Introduction</span>
    <figure class="grid grid-cols-1 md:grid-cols-2 gap-8 items-center mt-8">
      <figcaption class="text-left order-2 md:order-1 flex flex-col border-l-4 border-[var(--vusa-red)] pl-6">
        <p class="text-md font-medium italic mb-4 leading-6!">
          “We will enter the upcoming academic year with newly approved strategic projects that touch every member of our community.”
        </p>
        <p class="font-bold mb-4 leading-6!">
          I invite you to explore the work done throughout the year in the VU SR 2025-2026 report.
        </p>
        <PersonAvatar class="mt-4" :src="`/img/people/${people[0]['Nuotraukos pavadinimas']}`" size="small">
          <p style="margin: 0" class="font-bold leading-5!">{{ people[0]['Vardas Pavardė'] }}</p>
          <p style="margin: 0" class="opacity-80 text-sm">{{ people[0]['Pareigos'] }}</p>
        </PersonAvatar>
      </figcaption>
      <video playsinline autoplay controls muted loop class="mx-auto order-1 md:order-2 z-20 shadow-lg notch-corner aspect-video w-full">
        <source src="/video/Kleja.mp4" type="video/mp4">
        Your browser does not support the video tag.
      </video>
    </figure>
  </div>
</section>

<!-- Statistics -->
<section class="lg:px-2 px-1.5 isolate py-16">
  <div class="max-w-6xl mx-auto">
    <span class="section-eyebrow"><span class="eyebrow-num">02</span> VU SR in numbers</span>
    <div class="mt-4 mb-2">
      <h2 style="border: 0; padding: 0">VU SR is:</h2>
    </div>
    <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-5 gap-6 mt-10">
      <template v-for="stat in stats.en" :key="stat.label">
        <EnhancedNumberStatistic
          :end-number="stat.value"
          :title="stat.label"
          :icon="iconMap[stat.icon]"
        >
          {{ stat.description }}
        </EnhancedNumberStatistic>
      </template>
    </div>
  </div>
</section>

<!-- Timeline -->
<section class="section-band lg:px-2 px-1.5 isolate py-16">
  <div class="max-w-6xl mx-auto">
    <span class="section-eyebrow"><span class="eyebrow-num">03</span> The year</span>
    <InteractiveTimeline
      title="VU SR 2025-2026 highlights"
      :events="timelineEvents"
    />
  </div>
</section>

<!-- Gallery -->
<section class="lg:px-2 px-1.5 isolate py-16">
  <div class="max-w-6xl mx-auto">
    <span class="section-eyebrow"><span class="eyebrow-num">04</span> Moments</span>
    <ImageMosaic
      title="VU SR moments"
      :images="galleryImages.en"
    />
  </div>
</section>

<!-- Call to Action -->
<section class="lg:px-2 px-1.5 isolate my-20">
  <div class="max-w-5xl mx-auto text-center p-10 md:p-14 notch-corner-bl text-white relative overflow-hidden" style="background: linear-gradient(135deg, var(--vusa-red) 0%, var(--vusa-red-deep) 100%);">
    <div class="dot-grid absolute inset-0 opacity-30" style="--vusa-hairline: rgba(255,255,255,0.4);"></div>
    <div class="relative">
      <span class="section-eyebrow" style="color: var(--vusa-yellow);">Join us</span>
      <h2 class="mb-4 mt-4" style="border: 0; padding: 0; color: #fff;">Join the VU SR community</h2>
      <p class="text-lg mb-8 md:px-12">Every VU student can join VU SR.</p>
      <div class="flex flex-wrap justify-center gap-4 mt-8">
        <VPButton href="https://vusa.lt/tapk-nariu" text="Become a member" />
        <VPButton href="/VU_SR_Report_2025_2026.pdf" text="Download PDF" theme="brand" />
        <VPButton href="https://vusa.lt/lt/kontaktai/centrinis-biuras" text="Contact" theme="alt" />
      </div>
    </div>
  </div>
</section>
