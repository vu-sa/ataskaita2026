---
title: VU SA Metinė ataskaita 2025-2026
layout: home
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
import ReportHero from "@/ReportHero.vue";
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
  TrendingUp,
  Turtle
} from 'lucide-vue-next';

// Map icon strings to icon components
const iconMap = {
  Star,
  Building,
  Lightbulb,
  Users,
  Trophy,
  Turtle
};

// Hero actions
const heroActions = [
  { theme: 'brand', text: 'Sužinok apie šių metų veiklą!', link: '/strategija' },
  { theme: 'alt', text: 'Atsisiųsk PDF ataskaitą', link: '/VU_SA_Ataskaita_2025_2026.pdf' },
];

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

<ReportHero
  eyebrow="Vieningai už studentų (-čių) ateitį!"
  title="METINĖ ATASKAITA"
  period="2025–2026 m."
  logo-light="/img/logos/vusa-lt-b.png"
  logo-dark="/img/logos/vusa-lt-w.png"
  :actions="heroActions"
/>

<!-- Introduction -->
<section class="section-band lg:px-2 px-1.5 isolate py-16">
  <div class="max-w-6xl mx-auto">
    <span class="section-eyebrow"><span class="eyebrow-num">01</span> Įžanga</span>
    <figure class="grid grid-cols-1 md:grid-cols-2 gap-8 items-center mt-8">
      <figcaption class="text-left order-2 md:order-1 flex flex-col border-l-4 border-[var(--vusa-red)] pl-6">
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
      <video playsinline autoplay controls muted loop class="mx-auto order-1 md:order-2 z-20 shadow-lg notch-corner aspect-video w-full">
        <source src="/video/Kleja.mp4" type="video/mp4">
        Your browser does not support the video tag.
      </video>
    </figure>
  </div>
</section>

<!-- Statistics Section with Icons -->
<section class="lg:px-2 px-1.5 isolate py-16">
  <div class="max-w-6xl mx-auto">
    <span class="section-eyebrow"><span class="eyebrow-num">02</span> VU SA skaičiais</span>
    <div class="mt-4 mb-2">
      <h2 style="border: 0; padding: 0">VU SA tai:</h2>
    </div>
    <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-5 gap-6 mt-10">
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
<section class="section-band lg:px-2 px-1.5 isolate py-16">
  <div class="max-w-6xl mx-auto">
    <span class="section-eyebrow"><span class="eyebrow-num">03</span> Metų eiga</span>
    <InteractiveTimeline 
      title="VU SA 2025–2026 m. svarbiausios veiklos" 
      :events="timelineEvents" 
    />
  </div>
</section>

<!-- Gallery Section -->
<section class="lg:px-2 px-1.5 isolate py-16">
  <div class="max-w-6xl mx-auto">
    <span class="section-eyebrow"><span class="eyebrow-num">04</span> Akimirkos</span>
    <ImageMosaic 
      title="VU SA veiklos akimirkos" 
      :images="galleryImages.lt" 
    />
  </div>
</section>

<!-- Testimonials Section -->
<section class="section-band lg:px-2 px-1.5 isolate py-16">
  <div class="max-w-6xl mx-auto">
    <span class="section-eyebrow"><span class="eyebrow-num">05</span> Sveikinimai</span>
    <h2 class="text-center mb-12 mt-4">Sveikinimai</h2>
    <TestimonialCarousel :testimonials="congrats.lt" link="/sveikinimai" button-text="Sveikinimo kalba" />
  </div>
</section>

<!-- Call to Action -->
<section class="lg:px-2 px-1.5 isolate my-20">
  <div class="max-w-5xl mx-auto text-center p-10 md:p-14 notch-corner-bl text-white relative overflow-hidden" style="background: linear-gradient(135deg, var(--vusa-red) 0%, var(--vusa-red-deep) 100%);">
    <div class="dot-grid absolute inset-0 opacity-30" style="--vusa-hairline: rgba(255,255,255,0.4);"></div>
    <div class="relative">
      <span class="section-eyebrow" style="color: var(--vusa-yellow);">Prisijunk</span>
      <h2 class="mb-4 mt-4" style="border: 0; padding: 0; color: #fff;">Prisijunk prie VU SA bendruomenės</h2>
      <p class="text-lg mb-8 md:px-12">Kiekvienas ir kiekviena VU studentas (-ė) gali prisijungti prie VU SA!</p>
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
  </div>
</section>
