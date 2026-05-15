<script setup lang="ts">
import TeamAvatarLayout from "@/TeamAvatarLayout.vue";
import MultiPersonAvatar from "@/MultiPersonAvatar.vue";
import padaliniai from "../data/padaliniai.csv"
import { getPersonsByRole, getPersonsByColumn, getPersonsByDepartment, getPersonByName, TeamMember } from "@/lib/personUtils";

import teamPhotos from "../data/teamPhotos.json";
import PhotoGrid from '@/PhotoGrid.vue'

// Get all representatives coordinators from all units
const atstovai = getPersonsByRole(["Atstovų koordinator", "Atstov(i)ų"], "padaliniai");

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

const isac = getPersonsByRole(["Tarptautinių studentų reikalų koordinator", "Tarptautinių studentų (-čių) reikalų koordinator"], "padaliniai");

// administratoriai

const administratoriai = getPersonsByRole("Administrator", "padaliniai");

const cb = getPersonsByDepartment("Centrinis biuras", "dariniai");

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

const revizija = getPersonsByColumn("Darinys", "VU SA Revizijos komisija", "dariniai");

const iniciatyvos = [
  { name: "Justas Norkus", title: "Vilnius University Young Energy Professionals Club", avatar: "", src: "", fullTerm: true },
  { name: "Loranas Vaitkus", title: "START FM", avatar: "", src: "", fullTerm: true },
  { name: "Vytenis Almonaitis", title: "Kendo Club", avatar: "", src: "", fullTerm: true },
  { name: "Ugnė Mazaliauskaitė", title: "VU Career Days", avatar: "", src: "", fullTerm: true },
  { name: "Paulina Šalkauskaitė", title: "VU Debate Club", avatar: "", src: "", fullTerm: true },
  { name: "Enrika Gurevičiūtė", title: "“Be etikečių” Program", avatar: "", src: "", fullTerm: true },
  { name: "Guoda Giniotytė", title: "Vilnius University Student Investment Fund", avatar: "", src: "", fullTerm: true },
  { name: "Miglė Kučinskaitė", title: "ESN Vilnius University", avatar: "", src: "", fullTerm: true },
  { name: "Airina Mikulėnaitė", title: "VU Legal Clinic", avatar: "", src: "", fullTerm: true },
  { name: "Domas Sakalauskas", title: "The COINS Conference", avatar: "", src: "", fullTerm: true },
  { name: "Raminta Kučinskytė", title: "Young Journalists’ Association", avatar: "", src: "", fullTerm: true },
  { name: "Gintarė Vaičekauskytė", title: "HEMA Martial Arts Club", avatar: "", src: "", fullTerm: true },
  { name: "Toma Vilkaitė", title: "Sustainability Ambassadors Network", avatar: "", src: "", fullTerm: true },
  { name: "Greta Tamkevičiūtė", title: "VU SR Program “Students for Schoolchildren, Schoolchildren for Students”", avatar: "", src: "", fullTerm: true },
  { name: "Ugnė Gudaitytė", title: "Writers' Club", avatar: "", src: "", fullTerm: true },
  { name: "Monika Petravičiūtė", title: "Photo Club", avatar: "", src: "", fullTerm: true },
  { name: "Antanas Gražulis", title: "Latin Club", avatar: "", src: "", fullTerm: true },
  { name: "Robert Berlin", title: "“Kauliukas” Leisure Society", avatar: "", src: "", fullTerm: true },
  { name: "Kotryna Katinaitė", title: "Club “Artì”", avatar: "", src: "", fullTerm: true },
  { name: "Agata Liachovič", title: "Student Research Society “(Un)discovered Asia”", avatar: "", src: "", fullTerm: true },
  { name: "Gytis Oškelis", title: "Student Committee for Civil Resistance", avatar: "", src: "", fullTerm: true },
  { name: "Žygimantas Mazėtis", title: "Aurora Basket Basketball Club", avatar: "", src: "", fullTerm: true },
  { name: "Mykolas Radziukynas", title: "Astronomy Club", avatar: "", src: "", fullTerm: true },
  { name: "Vytautas Gricius", title: "Vilnius University Boxing Club “Perkūnas”", avatar: "", src: "", fullTerm: true },
  { name: "Daniela Žagunytė-Totilaitė", title: "Hip Hop Dance Club “Anarchy”", avatar: "", src: "", fullTerm: true },
  { name: "Brigita Kavaliauskaitė", title: "Criminology Student Research Society", avatar: "", src: "", fullTerm: true },
];

</script>

# Thank you for being part of our community!

![VU SA](</img/dariniai/VU SA.jpg>)

## Fields

<PhotoGrid :photos="teamPhotos.lt" />

## Central Office

![Centrinis biuras](</img/dariniai/CB.jpg>)

<TeamAvatarLayout :showAvatar="false" :members="cb" :showTitle="true" :showPadalinys="false" />

## VU SR Board

![Taryba](</img/dariniai/Taryba.jpg>)

<TeamAvatarLayout :showAvatar="false" :members="taryba" :showTitle="false" :showPadalinys="true" />


## VU SR Parliament

![Parlamentas](</img/dariniai/Parlamentas.jpg>)


## VU SR Revision Commission

![Revision Commission](</img/dariniai/Revizija.jpg>)

<TeamAvatarLayout :showAvatar="false" :members="revizija" :showTitle="true" :showPadalinys="false" />

More on the Revision Commission [here](/en/vu-sa/revizijos-komisija.md).

## ISF

![ISF](</img/dariniai/ISF.jpg>)

<TeamAvatarLayout :showAvatar="false" :members="isf" :showTitle="true" :showPadalinys="false" />

More on ISF [here](/en/stipri-organizacija/isf.md).

## Data Security Group

![DAG](</img/dariniai/DAG.jpg>)

<TeamAvatarLayout :showAvatar="false" :members="dag" :showTitle="true" :showPadalinys="false" />

## Representatives coordinators

![Atstovai](</img/dariniai/Atstovai.jpg>)

<TeamAvatarLayout :showAvatar="false" :members="atstovai" :showTitle="false" :showPadalinys="true" />

## Academic process coordinators

![Akad](</img/dariniai/Akad.jpg>)

<TeamAvatarLayout :showAvatar="false" :members="akademiniai" :showTitle="false" :showPadalinys="true" />

## Social process coordinators

![Soc](</img/dariniai/Soc.jpg>)

<TeamAvatarLayout :showAvatar="false" :members="socialiniai" :showTitle="false" :showPadalinys="true" />

## Communication coordinators

![Kom](</img/dariniai/Kom.jpg>)

<TeamAvatarLayout :showAvatar="false" :members="komunikaciniai" :showTitle="false" :showPadalinys="true" />

## Marketing coordinators

![Marketingas](</img/dariniai/Mark.jpg>)

<TeamAvatarLayout :showAvatar="false" :members="marketinginiai" :showTitle="false" :showPadalinys="true" />

## Organisational coordinators

![Organizaciniai](</img/dariniai/Org.jpg>)

<!-- Organizacinės srities koordinatoriai rūpinasi studentų socialine gerove, sprendžia gyvenimo bendrabučiuose, stipendijų ir kitus socialinės dimensijos klausimus. -->

<TeamAvatarLayout :showAvatar="false" :members="organizaciniai" :showTitle="false" :showPadalinys="true" />

## Human Resources coordinators

![Žmogiškieji](</img/dariniai/HR.jpg>)

<TeamAvatarLayout :showAvatar="false" :members="zmogiskieji" :showTitle="false" :showPadalinys="true" />

## Cooridinators of the Integration Process

![Integracija](</img/dariniai/Integr.jpg>)

<TeamAvatarLayout :showAvatar="false" :members="integracija" :showTitle="false" :showPadalinys="true" />

## International Student Affairs Coordinators

![Tarptautiniai](</img/dariniai/ISAC.jpg>)

<TeamAvatarLayout :showAvatar="false" :members="isac" :showTitle="false" :showPadalinys="true" />

## Administrators

![Administratoriai](</img/dariniai/Admin.jpg>)

<TeamAvatarLayout :showAvatar="false" :members="administratoriai" :showTitle="false" :showPadalinys="true" />

## Managers of Initiatives

![Iniciatyvų vadovai](</img/dariniai/PKP vadovai.jpg>)

<TeamAvatarLayout :showAvatar="false" :members="iniciatyvos" :showTitle="true" :showPadalinys="false" :sortByPadalinys="false" />
