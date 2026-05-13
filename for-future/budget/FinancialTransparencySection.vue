<script setup lang="ts">
import { ref, onMounted, computed } from 'vue';
import { gsap } from 'gsap';
import { ScrollTrigger } from 'gsap/ScrollTrigger';
import { Euro, BarChart3, TrendingUp } from 'lucide-vue-next';

gsap.registerPlugin(ScrollTrigger);

interface BudgetItem {
  category: string;
  amount: number;
  color?: string;
  icon?: any; // Component reference
}

interface ComparisonItem {
  label: string;
  beforeValue: number;
  afterValue: number;
  unit?: string;
  increaseIsGood?: boolean;
}

interface FinancialTransparencyProps {
  sectionTitle?: string;
  budgetItems: BudgetItem[];
  comparisons?: ComparisonItem[];
  primaryColor?: string;
  accentColor?: string;
  summary?: string;
  totalBudget?: number;
  year?: string;
}

const props = withDefaults(defineProps<FinancialTransparencyProps>(), {
  sectionTitle: 'Finansinis skaidrumas',
  comparisons: () => [],
  primaryColor: '#fbad13',
  accentColor: '#b5333e',
  summary: '',
  year: '2024-2025',
});

// Computed values
const totalAmount = computed(() => {
  return props.totalBudget || props.budgetItems.reduce((sum, item) => sum + item.amount, 0);
});

const percentages = computed(() => {
  return props.budgetItems.map(item => ({
    ...item,
    percentage: Math.round((item.amount / totalAmount.value) * 100)
  }));
});

// Refs for animation
const containerRef = ref<HTMLElement | null>(null);
const titleRef = ref<HTMLElement | null>(null);
const chartRef = ref<HTMLElement | null>(null);
const summaryRef = ref<HTMLElement | null>(null);
const comparisonRef = ref<HTMLElement | null>(null);

onMounted(() => {
  // Animate the title
  if (titleRef.value) {
    gsap.fromTo(
      titleRef.value,
      { opacity: 0, y: 20 },
      {
        opacity: 1,
        y: 0,
        duration: 0.8,
        scrollTrigger: {
          trigger: titleRef.value,
          start: "top 80%",
        }
      }
    );
  }
  
  // Animate the chart bars with stagger
  if (chartRef.value) {
    const chartBars = chartRef.value.querySelectorAll('.budget-bar');
    
    gsap.fromTo(
      chartBars,
      { width: 0, opacity: 0 },
      {
        width: 'var(--bar-width)',
        opacity: 1,
        duration: 1,
        stagger: 0.15,
        ease: "power2.out",
        scrollTrigger: {
          trigger: chartRef.value,
          start: "top 70%",
        }
      }
    );
  }

  // Animate comparison items
  if (comparisonRef.value) {
    const items = comparisonRef.value.querySelectorAll('.comparison-item');
    
    gsap.fromTo(
      items,
      { opacity: 0, y: 20 },
      {
        opacity: 1,
        y: 0,
        duration: 0.6,
        stagger: 0.1,
        scrollTrigger: {
          trigger: comparisonRef.value,
          start: "top 75%",
        }
      }
    );
  }
});
</script>

<template>
  <section class="py-20 px-6 md:px-10 bg-white dark:bg-gray-900">
    <div class="container mx-auto max-w-6xl">
      <!-- Section title -->
      <h2 
        ref="titleRef"
        class="text-3xl md:text-4xl font-bold text-center mb-12"
      >
        {{ sectionTitle }}
      </h2>
      
      <!-- Total budget display -->
      <div class="flex flex-col items-center justify-center mb-12 text-center">
        <div class="inline-flex items-center justify-center w-24 h-24 rounded-full mb-4"
          :style="{ backgroundColor: `${primaryColor}15` }">
          <Euro 
            class="w-12 h-12" 
            :style="{ color: primaryColor }"
          />
        </div>
        <h3 class="text-2xl font-bold mb-1">Bendras biudžetas</h3>
        <p class="text-4xl font-bold mb-2"
           :style="{ color: primaryColor }">
          {{ new Intl.NumberFormat('lt-LT').format(totalAmount) }} €
        </p>
        <p class="text-gray-600 dark:text-gray-400">{{ year }} metai</p>
      </div>

      <!-- Summary if provided -->
      <div 
        v-if="summary"
        ref="summaryRef"
        class="bg-gray-100 dark:bg-gray-800 p-6 rounded-lg mb-12 max-w-3xl mx-auto"
      >
        <p class="text-gray-700 dark:text-gray-300">{{ summary }}</p>
      </div>

      <!-- Budget visualization -->
      <div ref="chartRef" class="mb-16">
        <h3 class="text-2xl font-bold mb-8 text-center">Biudžeto paskirstymas</h3>
        
        <div class="space-y-6">
          <div 
            v-for="(item, index) in percentages" 
            :key="index"
            class="space-y-2"
          >
            <div class="flex justify-between items-center">
              <div class="flex items-center">
                <component 
                  :is="item.icon || BarChart3" 
                  class="w-5 h-5 mr-2"
                  :style="{ color: item.color || (index % 2 === 0 ? primaryColor : accentColor) }"
                />
                <span class="font-medium">{{ item.category }}</span>
              </div>
              <div class="text-right">
                <span class="font-bold">{{ item.percentage }}%</span>
                <span class="text-sm text-gray-500 dark:text-gray-400 ml-2">
                  ({{ new Intl.NumberFormat('lt-LT').format(item.amount) }} €)
                </span>
              </div>
            </div>
            
            <!-- Progress bar -->
            <div class="h-5 bg-gray-200 dark:bg-gray-700 rounded-full overflow-hidden">
              <div 
                class="h-full budget-bar transition-all duration-700"
                :style="{
                  backgroundColor: item.color || (index % 2 === 0 ? primaryColor : accentColor),
                  '--bar-width': `${item.percentage}%`
                }"
              ></div>
            </div>
          </div>
        </div>
      </div>
      
      <!-- Year-over-year comparisons -->
      <div 
        v-if="comparisons && comparisons.length > 0"
        ref="comparisonRef"
        class="grid md:grid-cols-2 lg:grid-cols-3 gap-6"
      >
        <div 
          v-for="(comparison, index) in comparisons" 
          :key="index"
          class="comparison-item bg-white dark:bg-gray-800 p-6 rounded-lg shadow-md"
        >
          <h4 class="font-bold text-lg mb-3">{{ comparison.label }}</h4>
          
          <div class="flex items-center justify-between">
            <div>
              <p class="text-sm text-gray-500 dark:text-gray-400">Praėję metai</p>
              <p class="font-bold text-xl">
                {{ new Intl.NumberFormat('lt-LT').format(comparison.beforeValue) }}
                <span v-if="comparison.unit" class="text-sm">{{ comparison.unit }}</span>
              </p>
            </div>
            
            <div class="flex items-center text-2xl px-2">
              <TrendingUp 
                v-if="comparison.afterValue >= comparison.beforeValue" 
                :style="{ 
                  color: comparison.increaseIsGood !== false ? 'rgb(34, 197, 94)' : 'rgb(239, 68, 68)'
                }"
                class="w-5 h-5" 
              />
              <TrendingUp 
                v-else 
                :style="{ 
                  color: comparison.increaseIsGood === false ? 'rgb(34, 197, 94)' : 'rgb(239, 68, 68)',
                  transform: 'rotate(180deg)'
                }"
                class="w-5 h-5" 
              />
            </div>
            
            <div>
              <p class="text-sm text-gray-500 dark:text-gray-400">Dabartiniai metai</p>
              <p class="font-bold text-xl"
                 :style="{ 
                   color: comparison.afterValue >= comparison.beforeValue 
                     ? (comparison.increaseIsGood !== false ? 'rgb(34, 197, 94)' : 'rgb(239, 68, 68)') 
                     : (comparison.increaseIsGood === false ? 'rgb(34, 197, 94)' : 'rgb(239, 68, 68)')
                 }">
                {{ new Intl.NumberFormat('lt-LT').format(comparison.afterValue) }}
                <span v-if="comparison.unit" class="text-sm">{{ comparison.unit }}</span>
              </p>
            </div>
          </div>
          
          <!-- Change percentage -->
          <div class="mt-3 text-right">
            <span 
              class="text-sm font-medium px-2 py-1 rounded-full"
              :style="{ 
                backgroundColor: 
                  comparison.afterValue >= comparison.beforeValue 
                    ? (comparison.increaseIsGood !== false ? 'rgba(34, 197, 94, 0.1)' : 'rgba(239, 68, 68, 0.1)') 
                    : (comparison.increaseIsGood === false ? 'rgba(34, 197, 94, 0.1)' : 'rgba(239, 68, 68, 0.1)'),
                color: 
                  comparison.afterValue >= comparison.beforeValue 
                    ? (comparison.increaseIsGood !== false ? 'rgb(34, 197, 94)' : 'rgb(239, 68, 68)') 
                    : (comparison.increaseIsGood === false ? 'rgb(34, 197, 94)' : 'rgb(239, 68, 68)')
              }"
            >
              {{ comparison.afterValue >= comparison.beforeValue ? '+' : '' }}
              {{ Math.round((comparison.afterValue - comparison.beforeValue) / comparison.beforeValue * 100) }}%
            </span>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<style scoped>
.budget-bar {
  width: 0;
}
</style>
