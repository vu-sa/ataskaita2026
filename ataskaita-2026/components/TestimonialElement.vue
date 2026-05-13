<template>
  <figure class="flex flex-col md:flex-row items-center gap-4 sm:gap-6 md:gap-8">
    <div class="p-2 sm:p-4 md:p-8 w-full md:w-5/12">
      <img :style="objectPosition ? { objectPosition } : { objectPosition: '70% 20%' }"
        class="shadow-md h-60! sm:h-80! md:h-96! w-full object-cover rounded-md" :src="imgSrc"
        :alt="`Photo of ${name}`">
    </div>
    <div class="relative p-2 sm:p-4 md:p-8 flex items-start flex-col w-full md:w-7/12">
      <svg
        class="absolute w-24 sm:w-28 md:w-36 h-24 sm:h-28 md:h-36 text-zinc-500/10 dark:text-zinc-100/20 right-2 sm:right-4 md:right-8 -bottom-4 sm:-bottom-6 md:-bottom-8"
        xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 24 24">
        <g fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
          <path d="M6 15h15" />
          <path d="M21 19H6" />
          <path d="M15 11h6" />
          <path d="M21 7h-6" />
          <path d="M9 9h1a1 1 0 1 1-1 1V7.5a2 2 0 0 1 2-2" />
          <path d="M3 9h1a1 1 0 1 1-1 1V7.5a2 2 0 0 1 2-2" />
        </g>
      </svg>
      <blockquote class="mx-4 sm:mx-6 md:mx-8 lg:mx-0">
        <p class="font-bold text-sm/5 sm:text-md/6 md:text-xl/8 tracking-normal italic text-left">
          <slot />
        </p>
      </blockquote>
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
