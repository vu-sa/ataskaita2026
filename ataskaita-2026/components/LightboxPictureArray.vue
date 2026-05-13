<template>
    <div class="grid grid-cols-3 gap-6 mt-8">
        <div v-for="(photo, index) in photos" class="flex flex-col items-center gap-3">
            <img role="button" tabindex="0"
                @click="handleImgClick(index)" 
                class="rounded-md h-36 w-60 object-cover shadow-sm hover:shadow-xl transition-shadow cursor-pointer" 
                style="object-position: 50% 40%;" :src="photo" 
            />
        </div>
    </div>

    <VueEasyLightbox :visible="visibleRef" :imgs="photos" @hide="onHide" :index="indexRef">
    </VueEasyLightbox>
</template>

<script setup lang="ts">
import VueEasyLightbox from 'vue-easy-lightbox'
import 'vue-easy-lightbox/dist/external-css/vue-easy-lightbox.css'
import { ref } from 'vue';

const props = defineProps<{
    photos: string[]
}>();

const visibleRef = ref(false);

const indexRef = ref(0);

const handleImgClick = (index: number) => {
    indexRef.value = index;
    visibleRef.value = true;
}

const onHide = () => {
    visibleRef.value = false;
}
</script>