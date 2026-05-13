<template>
    <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-4 mt-16">
        <div v-for="photo in photos" class="flex flex-col items-center gap-3 group">
            <a :href="photo.href" class="overflow-hidden rounded-md shadow-sm hover:shadow-xl transition-all duration-300 w-full">
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
