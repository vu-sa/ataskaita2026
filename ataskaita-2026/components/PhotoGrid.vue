<template>
    <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-4 mt-16">
        <div v-for="photo in photos" class="flex flex-col items-center gap-3 group">
            <a :href="photo.href" class="photo-card notch-corner w-full">
                <img class="w-full h-40! object-cover transition-all duration-500 transform group-hover:scale-105"
                     :src="photo.link"
                     :style="photo.objectPosition ? { objectPosition: photo.objectPosition } : { objectPosition: '50% 10%' }">
            </a>
            <strong class="tracking-tight text-lg/5 text-center">{{ photo.title }}</strong>
        </div>
    </div>
</template>

<script setup lang="ts">
defineProps<{
    photos: {
        href?: string;
        link: string;
        title: string;
        objectPosition?: string;
    }[];
}>();
</script>

<style scoped>
/* Notched corner to match the report's signature motif. Shadow lives here
   via filter:drop-shadow so it traces the notch (clip-path clips box-shadow). */
.photo-card {
    display: block;
    overflow: hidden;
    filter: drop-shadow(0 2px 6px rgba(28, 21, 23, 0.10));
    transition: filter 0.3s ease;
}

.group:hover .photo-card {
    filter: drop-shadow(0 14px 24px rgba(189, 40, 53, 0.28));
}
</style>
