<template>
  <BaseCard :highlight="highlight">
    <div class="flex flex-col items-center text-center">
      <!-- Icon if provided -->
      <div v-if="icon" class="mb-4">
        <component :is="icon" class="w-10 h-10" style="color: var(--vusa-red);" />
      </div>

      <!-- Number with counter effect -->
      <div
        class="text-5xl md:text-6xl font-extrabold leading-none"
        style="color: var(--vusa-red);"
      >
        <NumberCounter :end-number="endNumber" :duration="duration" :suffix="suffix" :prefix="prefix" />
      </div>

      <!-- Title -->
      <span
        v-if="title"
        class="text-lg font-bold mt-2"
        style="color: var(--vusa-ink);"
      >{{ title }}</span>

      <!-- Description -->
      <div class="text-zinc-600 dark:text-zinc-300 mt-2">
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
