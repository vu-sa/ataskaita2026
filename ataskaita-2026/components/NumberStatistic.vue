<template>
    <BaseCard>
        <div class="flex flex-col items-center">
            <div
                class="text-6xl font-extrabold mb-1 leading-none"
                style="color: var(--vusa-red);"
            >
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
