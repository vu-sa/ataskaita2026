<script setup lang="ts">
import TeamAvatarLayout from "@/TeamAvatarLayout.vue";
import MultiPersonAvatar from "@/MultiPersonAvatar.vue";
import padaliniai from "./data/padaliniai.csv"
import { getPersonsByRole, getPersonsByColumn, getPersonsByDepartment, getPersonByName, TeamMember } from "@/lib/personUtils";

import teamPhotos from "./data/teamPhotos.json";
import PhotoGrid from '../components/PhotoGrid.vue'

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
  { name: "Justas Norkus", title: "VU JEK", avatar: "", src: "", fullTerm: true },
  { name: "Loranas Vaitkus", title: "START FM", avatar: "", src: "", fullTerm: true },
  { name: "Vytenis Almonaitis", title: "Kendo klubas", avatar: "", src: "", fullTerm: true },
  { name: "Ugnė Mazaliauskaitė", title: "VU Karjeros dienos", avatar: "", src: "", fullTerm: true },
  { name: "Paulina Šalkauskaitė", title: "VU Debatų klubas", avatar: "", src: "", fullTerm: true },
  { name: "Enrika Gurevičiūtė", title: "VU SA programa „Be etikečių“", avatar: "", src: "", fullTerm: true },
  { name: "Guoda Giniotytė", title: "VU Studentų Investicinis fondas", avatar: "", src: "", fullTerm: true },
  { name: "Miglė Kučinskaitė", title: "ESN Vilnius University", avatar: "", src: "", fullTerm: true },
  { name: "Airina Mikulėnaitė", title: "VU Teisės klinika", avatar: "", src: "", fullTerm: true },
  { name: "Domas Sakalauskas", title: "The COINS konferencija", avatar: "", src: "", fullTerm: true },
  { name: "Raminta Kučinskytė", title: "Jaunųjų žurnalistų draugija", avatar: "", src: "", fullTerm: true },
  { name: "Gintarė Vaičekauskytė", title: "HEMA kovos menų klubas", avatar: "", src: "", fullTerm: true },
  { name: "Toma Vilkaitė", title: "Tvarumo ambasadorių tinklas", avatar: "", src: "", fullTerm: true },
  { name: "Greta Tamkevičiūtė", title: "VU SA programa „Studentai - moksleiviams, moksleiviai - studentams“", avatar: "", src: "", fullTerm: true },
  { name: "Ugnė Gudaitytė", title: "Rašytojų klubas", avatar: "", src: "", fullTerm: true },
  { name: "Monika Petravičiūtė", title: "Fotoklubas", avatar: "", src: "", fullTerm: true },
  { name: "Antanas Gražulis", title: "Lotynistų klubas", avatar: "", src: "", fullTerm: true },
  { name: "Robert Berlin", title: "Laisvalaikio draugija „Kauliukas“", avatar: "", src: "", fullTerm: true },
  { name: "Kotryna Katinaitė", title: "Klubas „Artì“", avatar: "", src: "", fullTerm: true },
  { name: "Agata Liachovič", title: "Studentų mokslinė draugija „(Un)discovered Asia“", avatar: "", src: "", fullTerm: true },
  { name: "Gytis Oškelis", title: "Studentų pilietinio pasipriešinimo komitetas", avatar: "", src: "", fullTerm: true },
  { name: "Žygimantas Mazėtis", title: "Krepšinio klubas „Aurora Basket“", avatar: "", src: "", fullTerm: true },
  { name: "Mykolas Radziukynas", title: "Astronomų klubas", avatar: "", src: "", fullTerm: true },
  { name: "Vytautas Gricius", title: "VU Bokso klubas „Perkūnas“", avatar: "", src: "", fullTerm: true },
  { name: "Daniela Žagunytė-Totilaitė", title: "Hip Hoppo šokių klubas „Anarchy“", avatar: "", src: "", fullTerm: true },
  { name: "Brigita Kavaliauskaitė", title: "Kriminologų SMD", avatar: "", src: "", fullTerm: true },
];

</script>

# Ačiū, kad esate kartu

![VU SA](</img/dariniai/VU SA.jpg>)

## Sritys

<PhotoGrid :photos="teamPhotos.lt" />

## Centrinis biuras

![Centrinis biuras](</img/dariniai/CB.jpg>)

<TeamAvatarLayout :showAvatar="false" :members="cb" :showTitle="true" :showPadalinys="false" />

## VU SA Taryba

![Taryba](</img/dariniai/Taryba.jpg>)

<TeamAvatarLayout :showAvatar="false" :members="taryba" :showTitle="false" :showPadalinys="true" />

Daugiau apie Tarybą [skaitykite čia](/vu-sa/taryba.md).

## VU SA Parlamentas

![Parlamentas](</img/dariniai/Parlamentas.jpg>)

Daugiau apie Parlamentą [skaitykite čia](/vu-sa/parlamentas.md).

## VU SA Revizijos komisija

![Revizijos komisija](</img/dariniai/Revizija.jpg>)

<TeamAvatarLayout :showAvatar="false" :members="revizija" :showTitle="true" :showPadalinys="false" />

Daugiau apie Revizijos komisiją [skaitykite čia](/vu-sa/revizijos-komisija.md).

## ISF

![ISF](</img/dariniai/ISF.jpg>)

<TeamAvatarLayout :showAvatar="false" :members="isf" :showTitle="true" :showPadalinys="false" />

Daugiau apie ISF [skaitykite čia](/stipri-organizacija/isf.md).

## Duomenų apsaugos grupė

![DAG](</img/dariniai/DAG.jpg>)

<TeamAvatarLayout :showAvatar="false" :members="dag" :showTitle="true" :showPadalinys="false" />

## Atstovų koordinatoriai (-ės)

![Atstovai](</img/dariniai/Atstovai.jpg>)

<TeamAvatarLayout :showAvatar="false" :members="atstovai" :showTitle="false" :showPadalinys="true" />

## Akademinio proceso reikalų koordinatoriai (-ės)

![Akad](</img/dariniai/Akad.jpg>)

<TeamAvatarLayout :showAvatar="false" :members="akademiniai" :showTitle="false" :showPadalinys="true" />

## Socialinio proceso reikalų koordinatoriai (-ės)

![Soc](</img/dariniai/Soc.jpg>)

<TeamAvatarLayout :showAvatar="false" :members="socialiniai" :showTitle="false" :showPadalinys="true" />

## Komunikacijos koordinatoriai (-ės)

![Kom](</img/dariniai/Kom.jpg>)

<TeamAvatarLayout :showAvatar="false" :members="komunikaciniai" :showTitle="false" :showPadalinys="true" />

## Marketingo koordinatoriai (-ės)

![Marketingas](</img/dariniai/Mark.jpg>)

<TeamAvatarLayout :showAvatar="false" :members="marketinginiai" :showTitle="false" :showPadalinys="true" />

## Organizacinės srities koordinatoriai (-ės)

![Organizaciniai](</img/dariniai/Org.jpg>)

<!-- Organizacinės srities koordinatoriai rūpinasi studentų socialine gerove, sprendžia gyvenimo bendrabučiuose, stipendijų ir kitus socialinės dimensijos klausimus. -->

<TeamAvatarLayout :showAvatar="false" :members="organizaciniai" :showTitle="false" :showPadalinys="true" />

## Žmogiškųjų išteklių koordinatoriai (-ės)

![Žmogiškieji](</img/dariniai/HR.jpg>)

<TeamAvatarLayout :showAvatar="false" :members="zmogiskieji" :showTitle="false" :showPadalinys="true" />

## Integracijos proceso koordinatoriai (-ės)

![Integracija](</img/dariniai/Integr.jpg>)

<TeamAvatarLayout :showAvatar="false" :members="integracija" :showTitle="false" :showPadalinys="true" />

## Tarptautinių studentų reikalų koordinatoriai (-ės)

![Tarptautiniai](</img/dariniai/ISAC.jpg>)

<TeamAvatarLayout :showAvatar="false" :members="isac" :showTitle="false" :showPadalinys="true" />

## Administratoriai (-ės)

![Administratoriai](</img/dariniai/Admin.jpg>)

<TeamAvatarLayout :showAvatar="false" :members="administratoriai" :showTitle="false" :showPadalinys="true" />

## Iniciatyvų vadovai (-ės)

![Iniciatyvų vadovai](</img/dariniai/PKP vadovai.jpg>)

<TeamAvatarLayout :showAvatar="false" :members="iniciatyvos" :showTitle="true" :showPadalinys="false" :sortByPadalinys="false" />
