<template>
  <section class="grid grid-cols-1 sm:grid-cols-2 gap-6 p-4">
    <PersonAvatar 
      v-for="member in sortedMembers" 
      :key="member.name" 
      :size="avatarSize" 
      :src="member.avatar" 
      :alt="member.name"
    >
      <div class="flex flex-col leading-5">
        <strong class="text-md/4">{{ member.name ? member.name : getName(member.avatar) }}</strong>
        <span v-if="showPadalinys && member.padalinys" class="text-xs text-gray-600 dark:text-gray-400 font-medium">
          {{ member.padalinys }}
        </span>
        <span v-if="showTitle && member.title" class="text-xs">{{ member.title }}</span>
        <span v-if="!member.fullTerm && member.period" class="text-xs text-slate-500">
          {{ member.period }}
        </span>
      </div>
    </PersonAvatar>
  </section>
</template>

<script setup lang="ts">
import PersonAvatar from "./PersonAvatar.vue";
import { TeamMember } from "./lib/personUtils";
import { computed } from 'vue';

const props = defineProps<{
  members: TeamMember[];
  showTitle?: boolean;
  showPadalinys?: boolean;
  sortByPadalinys?: boolean;
  avatarSize?: 'tiny' | 'small' | 'normal';
}>();

// Default props
const showTitle = props.showTitle !== false; // Default to true
const showPadalinys = props.showPadalinys !== false; // Default to true
const sortByPadalinys = props.sortByPadalinys !== false; // Default to true
const avatarSize = props.avatarSize || 'normal'; // Default to normal size

// Sort members by padalinys if requested
const sortedMembers = computed(() => {
  if (!sortByPadalinys) return props.members;
  
  return [...props.members].sort((a, b) => {
    // If both have padalinys, sort by padalinys
    if (a.padalinys && b.padalinys) {
      return a.padalinys.localeCompare(b.padalinys);
    }
    // If only one has padalinys, put the one with padalinys first
    if (a.padalinys) return -1;
    if (b.padalinys) return 1;
    // If neither has padalinys, sort by name
    return a.name.localeCompare(b.name);
  });
});

// get name from src if none 
// e.g from this ataskaita-2023/src/public/img/koordinatoriu-nuotraukos/organizacines-srities-koordinatoriai/Vidmantė-Krušinskaitė-(TSPMI).jpg to this Vidmantė Krušinskaitė
const getName = (src: string) => {
  const name = src.split("/").pop()?.split(".")[0]?.split("-").slice(0, 2).join(" ");
  return name ? name : "";
};
</script>
