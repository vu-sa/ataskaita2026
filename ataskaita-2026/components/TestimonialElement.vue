<template>
  <figure class="flex flex-col md:flex-row items-center gap-4 sm:gap-6 md:gap-8">
    <div class="p-2 sm:p-4 md:p-8 w-full md:w-5/12">
      <img :style="objectPosition ? { objectPosition } : { objectPosition: '70% 20%' }"
        class="testimonial-photo h-60! sm:h-80! md:h-96! w-full object-cover notch-corner" :src="imgSrc"
        :alt="`Photo of ${name}`">
    </div>
    <div class="relative p-2 sm:p-4 md:p-8 flex items-start flex-col w-full md:w-7/12">
      <div class="testimonial-copy">
        <div class="testimonial-quote">
          <p class="font-bold text-sm/5 sm:text-md/6 md:text-xl/8 tracking-normal italic text-left">
            „<slot />“
          </p>
        </div>
        <figcaption class="leading-4 my-4 sm:my-6 md:my-8 text-left">
          <div class="text-base sm:text-lg font-bold">
            {{ name }}
          </div>
          <div class="opacity-80 text-xs sm:text-sm">
            {{ position }}
          </div>
        </figcaption>
        <VPButton class="z-10 transition-all duration-300 text-sm sm:text-base" :href="href" :text="buttonText" />
      </div>
    </div>
  </figure>
</template>

<script setup lang="ts">
import VPButton from "vitepress/dist/client/theme-default/components/VPButton.vue";

defineProps<{
  imgSrc: string;
  href: string;
  buttonText: string;
  name: string;
  position: string;
  objectPosition?: string;
}>();
</script>

<style scoped>
/* drop-shadow (not box-shadow) so it traces the notched clip-path */
.testimonial-photo {
  filter: drop-shadow(0 4px 10px rgba(28, 21, 23, 0.14));
}

.testimonial-copy {
  display: flex;
  flex-direction: column;
  align-items: flex-start;
  border-left: 4px solid var(--vusa-red);
  padding-left: 1.5rem;
}

.testimonial-quote {
  margin: 0;
  padding: 0;
  border: 0;
}
</style>
