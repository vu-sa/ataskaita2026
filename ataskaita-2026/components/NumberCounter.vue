<template>
    <span ref="target">{{ prefix }}{{ formattedNumber }}{{ suffix }}</span>
</template>

<script setup lang="ts">
import { gsap } from "gsap";
import { ref, watch, computed } from "vue";
import { useIntersectionObserver } from '@vueuse/core'

const props = defineProps({
    endNumber: {
        type: Number,
        required: true
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
    },
    delay: {
        type: Number,
        default: 200
    },
    useEasing: {
        type: Boolean,
        default: true
    },
    useGrouping: {
        type: Boolean,
        default: false
    },
    decimals: {
        type: Number,
        default: 0
    },
    formatter: {
        type: Function,
        default: null
    }
});

const target = ref(null)
const targetIsVisible = ref(false)
const numberRef = ref(0);

// Format number based on props
const formattedNumber = computed(() => {
    if (props.formatter) {
        return props.formatter(numberRef.value);
    }
    
    // Apply formatting options
    if (props.useGrouping) {
        return new Intl.NumberFormat('lt-LT', {
            minimumFractionDigits: props.decimals,
            maximumFractionDigits: props.decimals,
        }).format(numberRef.value);
    }
    
    return numberRef.value.toFixed(props.decimals);
});

// Run the animation only once on intersection
const { stop } = useIntersectionObserver(target, ([{ isIntersecting }]) => {
    if (isIntersecting) {
        stop()
        targetIsVisible.value = true
    }
})

watch(targetIsVisible, (isVisible) => {
    if (isVisible) {
        gsap.to(numberRef, {
            value: props.endNumber,
            duration: props.duration / 1000, // Convert ms to seconds for GSAP
            delay: props.delay / 1000,
            ease: props.useEasing ? "power2.out" : "none",
            roundProps: props.decimals === 0 ? "value" : undefined,
        });
    }
})
</script>
