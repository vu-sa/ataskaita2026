<template>
  <div class="relative">
    <!-- Optional title -->
    <h2 v-if="title" class="text-3xl font-bold text-center">
      {{ title }}
    </h2>

    <!-- Mosaic grid -->
    <div class="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-4 mt-8 gap-3 md:gap-4 grid-flow-row-dense">
      <div v-for="(image, index) in images" :key="index"
        class="last:md:col-span-1 last:max-md:hidden relative group overflow-hidden notch-corner transition-all duration-300 h-full"
        :class="getLayoutClass(index)" @click="openLightbox(index)">
        <div class="relative h-full w-full">
          <!-- Image -->
          <img :src="image.src" :alt="image.alt || image.name || ''"
            class="h-full w-full object-cover transition-transform duration-700 group-hover:scale-110"
            :style="{ objectPosition: image.objectPosition || 'center' }">


          <!-- Hover overlay with caption -->
          <div v-if="image.caption"
            class="absolute inset-0 bg-gradient-to-t from-black/70 via-transparent to-transparent opacity-0 group-hover:opacity-100 transition-opacity duration-300 flex flex-col justify-end p-4">
            <p class="text-white/90 text-sm">
              {{ image.caption }}
            </p>
          </div>
        </div>
      </div>
    </div>

    <!-- Lightbox -->
    <VueEasyLightbox :visible="lightboxVisible" :imgs="lightboxImgs" :index="lightboxIndex"
      @hide="lightboxVisible = false" />
  </div>
</template>

<script setup lang="ts">
import { ref, computed } from 'vue';
import VueEasyLightbox from 'vue-easy-lightbox';
import 'vue-easy-lightbox/dist/external-css/vue-easy-lightbox.css';

interface MosaicImage {
  src: string;
  alt?: string;
  name?: string;
  caption?: string;
  featured?: boolean;
  objectPosition?: string;
}

const props = defineProps<{
  title?: string;
  images: MosaicImage[];
}>();

// Lightbox state
const lightboxVisible = ref(false);
const lightboxIndex = ref(0);
const lightboxImgs = computed(() => props.images.map(img => img.src));

// Open lightbox
const openLightbox = (index: number) => {
  lightboxIndex.value = index;
  lightboxVisible.value = true;
};

// Determine layout class based on index and featured status
const getLayoutClass = (index: number) => {
  const classes = [];

  // Make some images span multiple columns or rows for visual interest
  const featured = props.images[index]?.featured;

  if (featured) {
    classes.push('md:col-span-2 md:row-span-2');
  } else {
    // Add some visual variation
    if (index % 7 === 3) {
      classes.push('md:col-span-2');
    } else if (index % 11 === 5) {
      classes.push('md:row-span-2');
    }
  }

  return classes;
};
</script>

<style scoped>
/* Override VitePress default styles for images in our mosaic */
.grid img {
  height: 100% !important;
  object-fit: cover !important;
  width: 100% !important;
  aspect-ratio: 1 / 1;
}

/* Set minimum heights for grid items to ensure consistent layout */
.grid>div {
  min-height: 200px;
}

/* Featured and row-spanning items should be taller */
.grid>div[class*="row-span-2"] {
  min-height: 400px;
}

/* Ensure proper height and positioning for all containers */
.grid>div,
.grid>div>div {
  height: 100%;
  position: relative;
}
</style>
