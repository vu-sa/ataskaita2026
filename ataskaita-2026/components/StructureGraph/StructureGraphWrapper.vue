<template>
  <div class="h-96 sm:h-[468px]">
    <ClientOnly>
      <StructureGraph :min-zoom="0.2" :nodes :edges show-fullscreen @show-dialog="handleModal" />
      <template #fallback>
        <div class="flex items-center justify-center h-full bg-gray-100 dark:bg-gray-800 rounded-sm">
          <div class="text-center">
            <p class="text-gray-500">Organizacijos struktūra kraunasi...</p>
          </div>
        </div>
      </template>
    </ClientOnly>
  </div>

  <dialog ref="dialogRef" class="w-full h-full bg-zinc-50 dark:bg-zinc-900 ml-4 mt-4">
    <div class="h-full">
      <ClientOnly>
        <StructureGraph v-if="showGraph" :min-zoom="0.2" :nodes :edges :animated show-close @close="dialogRef?.close()" />
      </ClientOnly>
    </div>
  </dialog>
</template>

<script setup lang="ts">
import { ref, defineAsyncComponent } from 'vue'
import { useTemplateRef } from 'vue'

// Import graph component only on client-side
const StructureGraph = defineAsyncComponent(() => import('./StructureGraph.vue'))

defineProps<{
  nodes: Record<string, any>[]
  edges: Record<string, any>[]
}>()

const dialogRef = useTemplateRef<HTMLDialogElement | null>('dialogRef')
const showGraph = ref(false)

function handleModal() {
  dialogRef.value?.showModal()
  showGraph.value = true
}

const animated = ref(true)
</script>
