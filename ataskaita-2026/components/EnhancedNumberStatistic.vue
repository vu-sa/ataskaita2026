<template>
  <BaseCard :highlight="highlight">
    <div class="flex flex-col items-center text-center">
      <!-- Icon if provided -->
      <div v-if="icon" class="mb-4">
        <div class="w-16 h-16 rounded-full bg-gradient-to-tr from-amber-500 to-amber-400 flex items-center justify-center shadow-lg">
          <component :is="icon" class="w-8 h-8 text-white" />
        </div>
      </div>
      
      <!-- Number with counter effect -->
      <div class="text-5xl md:text-6xl font-bold">
        <span class="bg-gradient-to-tr from-[#ffa900] to-[#fab939] text-transparent bg-clip-text">
          <NumberCounter :end-number="endNumber" :duration="duration" :suffix="suffix" :prefix="prefix" />
        </span>
      </div>
      
      <!-- Title -->
      <span v-if="title" class="text-xl bg-gradient-to-tr bg-clip-text text-transparent font-bold mb-2 from-[#ffa900] to-[#fab939]">{{ title }}</span>

      <!-- Description -->
      <div class="text-zinc-600 dark:text-zinc-300 mt-3">
        <slot></slot>
      </div>
    </div>
  </BaseCard>
</template>

<script setup lang="ts">
import NumberCounter from "./NumberCounter.vue";
import { BaseCard } from "./ui/card";

defineProps({
  endNumber: {
    type: Number,
    required: true
  },
  title: {
    type: String,
    default: ''
  },
  icon: {
    type: Function,
    default: null
  },
  highlight: {
    type: Boolean,
    default: false
  },
  prefix: {
    type: String,
    default: ''
  },
  suffix: {
    type: String,
    default: ''
  },
  duration: {
    type: Number,
    default: 2000 
  }
});
</script>
