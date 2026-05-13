---
layout: home

hero:
  name: "VU SR report"
  text: "for 2025-2026"
  tagline: "VU SR report for 2025-2026"
  image:
    light:
      src: /img/logos/vusa-en-b.png
      alt: VU SR
    dark:
      src: /img/logos/vusa-en-w.png
      alt: VU SR
  actions:
    - theme: brand
      text: Learn about this year!
      link: /en/mvp/strateginiai
    - theme: alt
      text: Download PDF Report
      link: /VU_SR_Report_2025_2026.pdf
---

<script setup lang="ts">
import { computed } from 'vue';
import stats from "../data/stats.json"
import galleryImages from "../data/gallery.json"
import timelineData from "../data/timeline.json"
import people from "../data/dariniai.csv"

import VPButton from "vitepress/dist/client/theme-default/components/VPButton.vue";
import PersonAvatar from "@/PersonAvatar.vue";
import EnhancedNumberStatistic from "@/EnhancedNumberStatistic.vue";
import ImageMosaic from "@/ImageMosaic.vue";
import InteractiveTimeline from "@/InteractiveTimeline.vue";

import { Building, Star, Lightbulb, Users } from 'lucide-vue-next';

const iconMap = {
  Star,
  Building,
  Lightbulb,
  Users,
};

const timelineEvents = timelineData.en;
</script>

<section class="lg:px-2 px-1.5 isolate">
  <div class="mx-auto relative">
    <figure class="grid grid-cols-1 md:grid-cols-2 gap-4 items-center rounded-xl p-6">
      <figcaption class="my-4 px-6 text-left order-2 md:order-1 flex flex-col">
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
      <video playsinline autoplay controls muted loop class="mx-auto order-1 md:order-2 z-20 shadow-lg rounded-lg aspect-video">
        <source src="/video/kleja-en.webm" type="video/webm">
        Your browser does not support the video tag.
      </video>
    </figure>
  </div>
</section>

<section class="lg:px-2 px-1.5 isolate my-12">
  <div class="max-w-6xl mx-auto">
    <div class="text-center">
      <h2 style="border: 0; padding: 0" class="font-bold mb-2">VU SR is:</h2>
    </div>
    <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6 mt-10">
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

<section class="lg:px-2 px-1.5 isolate my-8 py-4">
  <div class="max-w-6xl mx-auto">
    <InteractiveTimeline
      title="VU SR 2025-2026 highlights"
      :events="timelineEvents"
    />
  </div>
</section>

<section class="lg:px-2 px-1.5 isolate my-8 py-4">
  <div class="max-w-6xl mx-auto">
    <ImageMosaic
      title="VU SR moments"
      :images="galleryImages.en"
    />
  </div>
</section>

<section class="lg:px-2 px-1.5 isolate my-20">
  <div class="max-w-5xl mx-auto text-center p-10 bg-gradient-to-br from-amber-500/10 via-white to-amber-500/5 dark:from-amber-900/20 dark:via-gray-800 dark:to-amber-900/10 rounded-2xl shadow-lg backdrop-blur-sm">
    <h2 class="text-3xl font-bold mb-4">Join the VU SR community</h2>
    <p class="text-lg mb-8 px-12">Every VU student can join VU SR.</p>
    <div class="flex flex-wrap justify-center gap-4 mt-8">
      <VPButton href="https://vusa.lt/tapk-nariu" text="Become a member" />
      <VPButton href="/VU_SR_Report_2025_2026.pdf" text="Download PDF" theme="brand" />
      <VPButton href="https://vusa.lt/lt/kontaktai/centrinis-biuras" text="Contact" theme="alt" />
    </div>
  </div>
</section>
