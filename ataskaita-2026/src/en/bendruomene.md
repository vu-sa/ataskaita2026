<script setup lang="ts">
import TeamAvatarLayout from "@/TeamAvatarLayout.vue";
import MultiPersonAvatar from "@/MultiPersonAvatar.vue";
import padaliniai from "../data/padaliniai.csv"
import { getPersonsByRole, getPersonsByColumn, getPersonsByDepartment, getPersonByName, TeamMember } from "@/lib/personUtils";

import teamPhotos from "../data/teamPhotos.json";
import PhotoGrid from '@/PhotoGrid.vue'

// Get all representatives coordinators from all units
const atstovai = getPersonsByRole("Atstovų koordinator", "padaliniai");

// Get academic process coordinators  
const akademiniai = getPersonsByRole("Akademinio proceso", "padaliniai");

// Get social process coordinators
const socialiniai = getPersonsByRole("Socialinio proceso", "padaliniai");

// Get communication coordinators
const komunikaciniai = getPersonsByRole("Komunikacijos koordinator", "padaliniai");

// Get marketing coordinators
const marketinginiai = getPersonsByRole("Marketing", "padaliniai");

// Get organizational coordinators
const organizaciniai = getPersonsByRole("Organizacinės srities koordinator", "padaliniai");

// Get Žmogiškųjų išteklių koordinatorius
const zmogiskieji = getPersonsByRole("Žmogiškųjų išteklių koordinator", "padaliniai");

// Get integration coordinators
const integracija = getPersonsByRole("Integracijos proceso koordinator", "padaliniai");

const isac = getPersonsByRole("Tarptautinių studentų reikalų koordinator", "padaliniai");

// administratoriai

const administratoriai = getPersonsByRole("Administrator", "padaliniai");

const cb = getPersonsByDepartment("Centrinis biuras", "dariniai");

const sic = getPersonsByDepartment("VU SA Studentų iniciatyvų centras", "dariniai");

const pirmininkai = getPersonsByRole(["Pirminink", "l.e.p. Pirminink"], "padaliniai");
const prezidente = getPersonsByRole("Prezidentė", "dariniai");
prezidente[0].padalinys = undefined;
prezidente[0].fullTerm = true;

const taryba = [
  prezidente[0],
  ...pirmininkai,
];

const isf = getPersonsByColumn("Darinys", "VU SA Institucinio stiprinimo fondas", "dariniai");

const dag = getPersonsByColumn("Darinys", "VU SA Duomenų apsaugos grupė", "dariniai");

const iniciatyvos = getPersonsByColumn("Padalinys", "Iniciatyvos", "padaliniai");

</script>

# Thank you for being part of our community!

![VU SA](</img/dariniai/VU SA.jpg>)

## Fields

<PhotoGrid :photos="teamPhotos.lt" />

## Central Office

![Centrinis biuras](</img/dariniai/CB.jpg>)

<TeamAvatarLayout :members="cb" :showTitle="true" :showPadalinys="false" />

## VU SR Board

![Taryba](</img/dariniai/Taryba.jpg>)

<TeamAvatarLayout :members="taryba" :showTitle="false" :showPadalinys="true" />


## VU SR Parliament

![Parlamentas](</img/dariniai/Parlamentas.jpg>)


## ISF

![ISF](</img/dariniai/ISF.jpg>)

<TeamAvatarLayout :members="isf" :showTitle="true" :showPadalinys="false" />

More on ISF [here](/en/stipri-organizacija/isf.md).

## Data Security Group

![DAG](</img/dariniai/DAG.jpg>)

<TeamAvatarLayout :members="dag" :showTitle="true" :showPadalinys="false" />

## Student Initiatives Center

![SIC](</img/dariniai/SIC.jpg>)

<TeamAvatarLayout :members="sic" :showTitle="true" :showPadalinys="false" />

## Representatives coordinators

![Atstovai](</img/dariniai/Atstovai.jpg>)

<TeamAvatarLayout :members="atstovai" :showTitle="false" :showPadalinys="true" />

## Academic process coordinators

![Akad](</img/dariniai/Akad.jpg>)

<TeamAvatarLayout :members="akademiniai" :showTitle="false" :showPadalinys="true" />

## Social process coordinators

![Soc](</img/dariniai/Soc.jpg>)

<TeamAvatarLayout :members="socialiniai" :showTitle="false" :showPadalinys="true" />

## Communication coordinators

![Kom](</img/dariniai/Kom.jpg>)

<TeamAvatarLayout :members="komunikaciniai" :showTitle="false" :showPadalinys="true" />

## Marketing coordinators

![Marketingas](</img/dariniai/Mark.jpg>)

<TeamAvatarLayout :members="marketinginiai" :showTitle="false" :showPadalinys="true" />

## Organisational coordinators

![Organizaciniai](</img/dariniai/Org.jpg>)

<!-- Organizacinės srities koordinatoriai rūpinasi studentų socialine gerove, sprendžia gyvenimo bendrabučiuose, stipendijų ir kitus socialinės dimensijos klausimus. -->

<TeamAvatarLayout :members="organizaciniai" :showTitle="false" :showPadalinys="true" />

## Human Resources coordinators

![Žmogiškieji](</img/dariniai/HR.jpg>)

<TeamAvatarLayout :members="zmogiskieji" :showTitle="false" :showPadalinys="true" />

## Cooridinators of the Integration Process

![Integracija](</img/dariniai/Integr.jpg>)

<TeamAvatarLayout :members="integracija" :showTitle="false" :showPadalinys="true" />

## International Student Affairs Coordinators

![Tarptautiniai](</img/dariniai/ISAC.jpg>)

<TeamAvatarLayout :members="isac" :showTitle="false" :showPadalinys="true" />

## Administrators

![Administratoriai](</img/dariniai/Admin.jpg>)

<TeamAvatarLayout :members="administratoriai" :showTitle="false" :showPadalinys="true" />

## Managers of Initiatives

![Iniciatyvų vadovai](</img/dariniai/PKP vadovai.jpg>)

<TeamAvatarLayout :members="iniciatyvos" :showTitle="true" :showPadalinys="false" />
