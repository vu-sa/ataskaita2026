<template>
    <BaseCard>
        <div class="flex flex-col items-center">
            <div class="text-6xl font-bold bg-gradient-to-tr from-[#ffa900] to-[#fab939] mb-1 text-transparent bg-clip-text">
                <NumberCounter :end-number="endNumber"></NumberCounter>
            </div>
            <div class="w-60 text-center text-zinc-600 dark:text-zinc-300"><slot /></div>
        </div>
    </BaseCard>
</template>

<script setup lang="ts">
import NumberCounter from "./NumberCounter.vue";
import { BaseCard } from "./ui/card";

defineProps<{
    endNumber: number;
}>();
</script>