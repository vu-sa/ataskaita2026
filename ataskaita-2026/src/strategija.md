<script setup lang="ts">
import VusaStructure from "../components/StructureGraph/presets/VusaStructure.vue";
import VisionMissionSection from '../components/VisionMissionSection.vue';
import strategy from "./data/strategy.json"

import {
  Users,
  Award,
  Scale,
  Handshake,
  TrendingUp
} from 'lucide-vue-next';

// Extract value icons
const valueIcons = {
  "Atvirumas": Users,
  "Atsakomybė": Scale,
  "Veiklos kokybė": Award,
  "Vieningumas": Handshake,
  "Tobulėjimas": TrendingUp
};

// Add icons to values
const valuesWithIcons = strategy.lt.values.map(value => ({
  ...value,
  icon: valueIcons[value.title] || Award
}));
</script>

# VU SA strategija

## VU SA struktūra

<VusaStructure lang="lt" />

<!-- SECTION:intro:START -->

**Vizija** – atvira aplinka savarankiškam studento tobulėjimui vieningoje Vilniaus universiteto bendruomenėje.

**Misija** – efektyviai atstovaujant Vilniaus universiteto studentams bei puoselėjant universitetinę kultūrą, kurti palankiausias sąlygas studento saviraiškai.

### Vertybės

- Atvirumas;
- Atsakomybė;
- Veiklos kokybė;
- Vieningumas;
- Tobulėjimas.

### Strateginės kryptys

- Kokybiškos studijos ir joms pritaikyta aplinka;
- Stipri organizacija;
- Darni universitetinė bendruomenė.

<!-- SECTION:intro:END -->
