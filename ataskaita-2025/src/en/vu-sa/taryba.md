<script setup>
import PersonAvatar from '@/PersonAvatar.vue'
import TeamAvatarLayout from "@/TeamAvatarLayout.vue";
import { getPersonsByRole } from "@/lib/personUtils";

const pirmininkai = getPersonsByRole(["Pirminink", "l.e.p. Pirminink"], "padaliniai");
const prezidente = getPersonsByRole("Prezidentė", "dariniai");
prezidente[0].padalinys = undefined;
prezidente[0].fullTerm = true;

const taryba = [
  prezidente[0],
  ...pirmininkai,
];

</script>

# VU SR Board

![VU SR Board](/img/dariniai/Taryba.jpg){.rounded-sm}

::: tip **VU SR Board** is...
 the governing body of VU SR, which decides on cooperation and internal issues of the organisation. This governing body consists of the heads (chairpersons) of the VU SR Units and the VU SR President, who organizes the activities of this governing body. 
:::

::: details For the period 2024-2025, the VU SR Board consisted of...

<TeamAvatarLayout :members="taryba" :showTitle="false" :showPadalinys="true" />

:::

During the reporting period, 19 VU SR Boardmeetings were held, 11 of which were electronic.   

The following decisions have been discussed and voted on by the VU SR Board 2024-2025:   

- Approved the members of the VU SR Institutional Strengthening Fund;  
- Approved the cost estimates for major events exceeding  3,000 EUR;  
- Considered the budget planning for 2025 and the updated operational planning process;  
- Established working groups on the renewal of the membership test and the crediting of general competences;  
- Approved the membership of the Vilnius University Investment Student Foundation in the Union of Vilnius Youth Organisations "Apskritasis stalas";  
- Approved changes to the CO<sub>2</sub> footprint calculation process;  
- Approved the date of the VU SR Reporting-Election Conference;  
- Developed the VU SR Strategic Action Plan for 2025-2028. 
