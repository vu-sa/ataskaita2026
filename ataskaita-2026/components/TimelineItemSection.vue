<template>
  <div class="flex flex-col leading-5 w-full relative mt-4">
    <div v-for="(item, index) in items" class="relative group">
      <!-- Timeline -->
      <div class="absolute h-full left-0 mt-1 group w-8">
        <div class="w-4 h-4 rounded-full bg-white dark:bg-zinc-800" style="border: 2px solid" :style="{
          'border-color':
            item.type === 'default'
              ? '#d9d9d9'
              : item.type === 'success'
                ? '#52c41a'
                : item.type === 'warning'
                  ? '#fbb01b'
                : item.type === 'not-planned'
                    ? '#d9d9d9'
                    : item.type === 'error'
                      ? '#ff4d4f'
                      : '#d9d9d9',
        }" />
        <div class="w-0.5 h-full absolute bg-zinc-300 dark:bg-zinc-700 group-last:hidden" style="left: 6.8px" />
      </div>
      <!-- Content -->
      <div class="ml-8">
        <div class="text-sm/6 font-semibold dark:text-zinc-100">
          {{
            english
              ? computeEnTitle(item.type, index)
              : computeTitle(item.type, index)
          }}
        </div>
        <div class="text-xs mb-6">
          {{ item.content }}
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
defineProps<{
  items: {
    title: string;
    content?: string;
    // get type from NTImelineItem
    type: string;
  }[];
  english?: boolean;
}>();

const computeTitle = (type: string, index: number) => {
  let title = "";

  switch (type) {
    case "default":
      title = "bus vykdoma";
      break;
    case "success":
      title = "įgyvendinta";
      break;
    case "warning":
      title = "įgyvendinama";
      break;
    case "not-planned":
      title = "atsisakyta";
      break;
    case "error":
      title = "neįgyvendinta";
      break;
  }

  return `${index + 1} uždavinys: ${title}`;
};

const computeEnTitle = (type: string, index: number) => {
  let title = "";

  switch (type) {
    case "default":
      title = "in progress";
      break;
    case "success":
      title = "implemented";
      break;
    case "warning":
      title = "under implementation";
      break;
    case "not-planned":
      title = "abandoned";
      break;
    case "error":
      title = "not implemented";
      break;
  }

  return `Task ${index + 1}: ${title}`;
};
</script>
