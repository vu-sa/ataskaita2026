<template>
  <div class="vusa-card-wrap group">
    <div
      class="vusa-card notch-corner relative p-6"
      :class="[
        { 'vusa-card--highlight': highlight },
        contentClass
      ]"
    >
      <!-- Main content -->
      <div class="flex flex-col z-10 relative">
        <slot></slot>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
defineProps({
  highlight: {
    type: Boolean,
    default: false
  },
  contentClass: {
    type: String,
    default: ''
  }
});
</script>

<style scoped>
/* Signature: sharp editorial surface with a cut-out notch corner.
   The shadow lives on the wrapper via filter:drop-shadow so it traces
   the notched shape (a box-shadow would be clipped away by clip-path). */
.vusa-card-wrap {
  filter: drop-shadow(0 6px 14px rgba(28, 21, 23, 0.10));
  transition: filter 0.3s ease, transform 0.3s ease;
}

.dark .vusa-card-wrap {
  filter: none;
}

.vusa-card-wrap:hover {
  transform: translateY(-4px);
}

.vusa-card {
  background: var(--vusa-surface);
  height: 100%;
}

.vusa-card--highlight {
  border-left: 4px solid var(--vusa-red);
}
</style>
