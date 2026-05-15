<script setup lang="ts">
import { Carousel, type CarouselApi, CarouselContent, CarouselItem, CarouselNext, CarouselPrevious } from '@/ui/carousel'
import { watchOnce, useBreakpoints, useWindowSize } from '@vueuse/core'
import { ref, computed } from 'vue'
import TestimonialElement from "./TestimonialElement.vue";

const props = defineProps<{
  testimonials: {
    img: string
    name: string
    position: string
    anchor: string
    quotePreview: string
    objectPosition?: string
  }[];
  link: string;
  buttonText: string;
}>()

const emblaMainApi = ref<CarouselApi>()
const selectedIndex = ref(0)

// Set up responsive breakpoints
const breakpoints = useBreakpoints({
  sm: 640,
  md: 768,
  lg: 1024,
  xl: 1280
})

const isMobile = breakpoints.smaller('sm')
const isTablet = breakpoints.between('sm', 'md')
const isDesktop = breakpoints.greater('md')

// Responsive carousel options
const carouselOptions = computed(() => {
  return {
    loop: true,
    skipSnaps: false,
    // Dragging feels better on mobile, less so on desktop
    draggable: isMobile.value || isTablet.value,
    // Use different slide spacing based on screen size
    align: isMobile.value ? 'center' as const : 'start' as const,
    // Show partial next slide on larger screens
    containScroll: isMobile.value ? 'trimSnaps' as const : 'keepSnaps' as const
  }
})

// Determine number of visible thumbnails based on screen width
const { width } = useWindowSize()
const visibleThumbs = computed(() => {
  if (width.value < 640) return 3  // Mobile: show 3
  if (width.value < 768) return 5  // Small tablet: show 5
  return 7 // Desktop: show 7
})

// Calculate exact percentage width for thumbnails
const thumbWidthPercentage = computed(() => {
  // Calculate exact percentages with a small gap allowance
  if (width.value < 640) return (100 / 3) - 1 + '%' // Mobile: ~32.33%
  if (width.value < 768) return (100 / 5) - 0.5 + '%' // Small tablet: ~19.5%
  return (100 / 7) - 0.3 + '%' // Desktop: ~14%
})

const onCarouselInit = (api: CarouselApi) => {
  emblaMainApi.value = api
  
  if (!emblaMainApi.value)
    return

  emblaMainApi.value.on('select', onSelect)
  emblaMainApi.value.on('reInit', onSelect)
};


function onSelect() {
  if (!emblaMainApi.value)
    return
  selectedIndex.value = emblaMainApi.value.selectedScrollSnap()
  
  // Scroll thumbnails into view when needed
  scrollThumbnailIntoView(selectedIndex.value)
}

// Helper function to scroll thumbnail into view
function scrollThumbnailIntoView(index: number) {
  // Find the thumbnail element and scroll it into view if needed
  const thumbnailsContainer = document.querySelector('.testimonial-thumbnails-scroll')
  const thumbnailElements = thumbnailsContainer?.querySelectorAll('.flex-shrink-0')
  
  if (thumbnailsContainer && thumbnailElements && thumbnailElements[index]) {
    const thumbnail = thumbnailElements[index] as HTMLElement
    
    // Calculate scroll position to center the thumbnail
    const containerWidth = thumbnailsContainer.clientWidth
    const thumbnailOffsetLeft = thumbnail.offsetLeft
    const thumbnailWidth = thumbnail.offsetWidth
    
    const scrollPosition = thumbnailOffsetLeft - (containerWidth / 2) + (thumbnailWidth / 2)
    
    // Scroll smoothly
    thumbnailsContainer.scrollTo({
      left: scrollPosition,
      behavior: 'smooth'
    })
  }
}

function onThumbClick(index: number) {
  if (!emblaMainApi.value)
    return
    
  // Update the selected index immediately for responsive UI
  selectedIndex.value = index
  
  // Scroll to the selected slide
  emblaMainApi.value.scrollTo(index)
}

watchOnce(emblaMainApi, (api) => {
  if (!api)
    return

  // Initial selection
  onSelect()
  
  // Set up event listeners
  api.on('select', onSelect)
  api.on('reInit', onSelect)
})
</script>

<template>
  <div class="w-full max-w-full overflow-hidden">
    <Carousel 
      class="w-full" 
      :opts="carouselOptions" 
      @init-api="onCarouselInit"
    >
      <CarouselContent>
        <CarouselItem v-for="testimonial in props.testimonials" :key="testimonial.name">
          <TestimonialElement 
            class="p-2 sm:p-3 md:p-4 h-auto sm:h-96!" 
            :img-src="testimonial.img" 
            :name="testimonial.name" 
            :position="testimonial.position" 
            :href="`${link}${testimonial.anchor}`" 
            :object-position="testimonial.objectPosition"
            :button-text="buttonText"
          >
            {{ testimonial.quotePreview }}
          </TestimonialElement>
        </CarouselItem>
      </CarouselContent>
      <CarouselPrevious class="hidden sm:flex absolute !left-2 sm:!left-4 bg-white/80 dark:bg-gray-800/80 hover:bg-white dark:hover:bg-gray-800 border border-amber-500/30" />
      <CarouselNext class="hidden sm:flex absolute !right-2 sm:!right-4 bg-white/80 dark:bg-gray-800/80 hover:bg-white dark:hover:bg-gray-800 border border-amber-500/30" />
    </Carousel>

    <!-- Use a simple grid layout for thumbnails instead of carousel -->
    <div class="testimonial-thumbnails-scroll w-full mt-4 sm:mt-6 md:mt-8 px-4 sm:px-8 md:px-12 overflow-x-auto">
      <div class="flex flex-nowrap">
        <div 
          v-for="(testimonial, index) in props.testimonials" 
          :key="testimonial.name" 
          class="cursor-pointer transition-all duration-300 flex-shrink-0"
          :style="{
            width: thumbWidthPercentage,
            paddingRight: '4px',
            paddingLeft: index === 0 ? '0' : '4px'
          }"
          @click="onThumbClick(index)"
        >
          <div class="p-1">
            <div
              class="notch-corner-sm p-[2px] transition-all duration-300"
              :class="selectedIndex === index ? 'bg-amber-500' : 'bg-transparent'"
            >
              <img
                :alt="`Thumbnail of ${testimonial.name}`"
                :src="testimonial.img"
                :style="testimonial.objectPosition ? { objectPosition: testimonial.objectPosition } : { objectPosition: '50% 30%' }"
                class="block w-full aspect-[1/2.5] h-16! sm:h-20! md:h-30! object-cover notch-corner-sm transition-all duration-300"
                :class="[selectedIndex === index ? '' : 'opacity-70 hover:opacity-100']"
              >
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>


