---
title: VU SA Metinė ataskaita 2025-2026
layout: home

hero:
  name: "VU SA ataskaita"
  text: "už 2025-2026 metus"
  tagline: "Vieningai Už Studentų Ateitį!"
  image:
    light:
      src: ./img/logos/vusa-lt-b.png
      alt: VU SA
    dark: 
      src: ./img/logos/vusa-lt-w.png
      alt: VU SA
  actions:
  - theme: brand
    text: Sužinok apie šių metų veiklą!
    link: /strategija
  - theme: alt
    text: Atsisiųsk PDF ataskaitą
    link: /VU_SA_Ataskaita_2025_2026.pdf
---

<script setup lang="ts">
import { ref, onMounted, computed } from 'vue';
import { useDark } from '@vueuse/core'
import congrats from "./data/congrats.json"
import stats from "./data/stats.json"
import galleryImages from "./data/gallery.json"
import timelineData from "./data/timeline.json"
import people from "./data/dariniai.csv"

// Import components
import VPButton from "vitepress/dist/client/theme-default/components/VPButton.vue";
import NumberStatistic from "@/NumberStatistic.vue";
import PersonAvatar from "@/PersonAvatar.vue";
import MultiPersonAvatar from "@/MultiPersonAvatar.vue";
import EnhancedNumberStatistic from "@/EnhancedNumberStatistic.vue";
import ImageMosaic from "@/ImageMosaic.vue";
import InteractiveTimeline from "@/InteractiveTimeline.vue";
import AchievementSection from "@/AchievementSection.vue";
import TestimonialCarousel from "@/TestimonialCarousel.vue";

// Import icons
import { 
  Trophy, 
  Users, 
  GraduationCap,
  HeartHandshake,
  BookOpen,
  Building,
  Star,
  Lightbulb,
  Award,
  Heart,
  Scale,
  Handshake,
  TrendingUp
} from 'lucide-vue-next';

// Map icon strings to icon components
const iconMap = {
  Star,
  Building,
  Lightbulb,
  Users,
  Trophy
};

// Primary colors for the site
const primaryColor = '#fbad13';
const accentColor = '#b5333e';

// Import person utility functions
import { getPersonByName, getPersonsByDepartment } from '@/lib/personUtils';

// Prepare team data for MultiPersonAvatar
const centralOfficeTeam = computed(() => {
  return getPersonsByDepartment('Centrinis biuras');
});

import {
  Carousel,
  CarouselContent,
  CarouselItem,
} from "@/ui/carousel";

// Timeline events data
const timelineEvents = timelineData.lt;

const isDark = useDark()

// Dynamic logo source based on dark/light mode
const logoSrc = computed(() => {
  return isDark.value ? './img/logos/vusa-lt-w.png' : './img/logos/vusa-lt-b.png';
});

</script>

<section class="lg:px-2 px-1.5 isolate">
  <div class="mx-auto relative">
    <figure class="grid grid-cols-1 md:grid-cols-2 gap-4 items-center rounded-xl p-6">
      <figcaption class="my-4 px-6 text-left order-2 md:order-1 flex flex-col">
        <p class="text-md font-medium italic mb-4 leading-6!">„Žengsime į būsimus studijų metus su jau patvirtintais naujais Organizacijos strateginiais projektais, liečiančiais kiekvieną mūsų bendruomenės narį ir narę. Didžiuojuosi Organizacija, mūsų visų įsitraukimu bei stipriomis partnerystėmis.  
        </p>
        <p class="font-bold mb-4 leading-6!">
          Kviečiu susipažinti su visais metuose nuveiktais darbais VU SA 2025–2026 metų ataskaitoje. Nuoširdžiai ačiū Jums už šiuos metus ir toliau dirbkime „Vieningai už studentų (-čių) ateitį!“
        </p>
        <PersonAvatar class="mt-4" :src="`/img/people/${people[0]['Nuotraukos pavadinimas']}`" size="small">
          <p style="margin: 0" class="font-bold leading-5!">{{ people[0]['Vardas Pavardė'] }}</p>
          <p style="margin: 0" class="opacity-80 text-sm">{{ people[0]['Pareigos'] }}</p>
        </PersonAvatar>
      </figcaption>
      <video playsinline autoplay controls muted loop class="mx-auto order-1 md:order-2 z-20 shadow-lg rounded-lg aspect-video">
        <source src="/video/kleja-lt.webm" type="video/webm">
        Your browser does not support the video tag.
      </video>
    </figure>
  </div>
</section>

<!-- Enhanced Statistics Section with Icons -->
<section class="lg:px-2 px-1.5 isolate my-12">
  <div class="max-w-6xl mx-auto">
    <div class="text-center">
      <h2 style="border: 0; padding: 0" class="font-bold mb-2">VU SA – tai:</h2>
    </div>
    <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6 mt-10">
      <template v-for="stat in stats.lt" :key="stat.label">
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

<!-- Interactive Timeline Section -->
<section class="lg:px-2 px-1.5 isolate my-8 py-4">
  <div class="max-w-6xl mx-auto">
    <InteractiveTimeline 
      title="VU SA 2025–2026 m. svarbiausios veiklos" 
      :events="timelineEvents" 
    />
  </div>
</section>

<!-- Gallery Section -->
<section class="lg:px-2 px-1.5 isolate my-8 py-4">
  <div class="max-w-6xl mx-auto">
    <ImageMosaic 
      title="VU SA veiklos akimirkos" 
      :images="galleryImages.lt" 
    />
  </div>
</section>

<!-- Testimonials Section -->
<section class="lg:px-2 px-1.5 isolate my-20">
  <div class="max-w-6xl mx-auto">
    <h2 class="text-3xl md:text-4xl font-bold text-center mb-12">Sveikinimai</h2>
    <TestimonialCarousel :testimonials="congrats.lt" link="/sveikinimai" button-text="Sveikinimo kalba" />
  </div>
</section>

<!-- Call to Action -->
<section class="lg:px-2 px-1.5 isolate my-20">
  <div class="max-w-5xl mx-auto text-center p-10 bg-gradient-to-br from-amber-500/10 via-white to-amber-500/5 dark:from-amber-900/20 dark:via-gray-800 dark:to-amber-900/10 rounded-2xl shadow-lg backdrop-blur-sm">
    <h2 class="text-3xl font-bold mb-4">Prisijunk prie VU SA bendruomenės</h2>
    <p class="text-lg mb-8 px-12">Kiekvienas ir kiekviena VU studentas (-ė) gali prisijungti prie VU SA!</p>
    <div class="flex flex-wrap justify-center gap-4 mt-8">
                <VPButton 
                  href="https://vusa.lt/tapk-nariu" 
                  text="Tapk nariu (-e)"
                />
                <VPButton 
                  href="/VU_SA_Ataskaita_2025_2026.pdf" 
                  text="Atsisiųsk ataskaitą" 
                  theme="brand"
                />
                <VPButton 
                  href="https://vusa.lt/lt/kontaktai/centrinis-biuras" 
                  text="Susisiek"
                  theme="alt"
                />
    </div>
  </div>
</section>
