# VU SA P tikslai

<script setup lang="ts">
import TimelineItemSection from '@/TimelineItemSection.vue'

const goals = {
  '1': [
    { type: 'success', content: 'Parengtos studijų dalykų aprašų tobulinimo rekomendacijos (remiantis problemos analize ir Vilniaus universiteto studijų programų reglamentu) ir iškomunikuotos VU CHGF sprendimų priėmėjams (-oms) (prodekanams (-ėms) ir studijų kolegijai), kurie (-ios) skatins dėstytojus (-as) peržiūrėti savo dėstomų dalykų aprašus ir juos pataisyti.' },
    { type: 'warning', content: 'Kiekviename SPK patvirtinti patobulinti po 2 studijų dalykų aprašai iš kiekvienos studijų programos.' },
    { type: 'error', content: 'Bent po 2 iš kiekvienos studijų programos VU CHGF studijų dalykų aprašai yra vientiso formato ir atitinka šabloną pagal Vilniaus universiteto studijų programų reglamentą.' },
  ],
  '2': [
    { type: 'success', content: 'Sudarytas studentų (-čių) pasirinktų mokymo metodų, kuriuos studentai norėtų matyti labiausiai, sąrašas.' },
    { type: 'success', content: 'Bent 5 dėstytojai (-os) į savo dėstomo dalyko metodikas įtraukia studentų (-čių) pasirinktus mokymo metodus.' },
    { type: 'warning', content: 'Parengta įgyvendintų mokymo metodų rezultatų ataskaita, kurioje pateiktas studentų (-čių) ir dėstytojų grįžtamasis ryšys.' },
  ],
  '3': [
    { type: 'error', content: 'Mokymosi platformoje yra pasiekiami 75 proc. aukštosios matematikos I ir II bei termodinamikos ir mechanikos paskaitų įrašai.' },
    { type: 'success', content: 'Įvyksta 4 studentų (-čių) mokymosi sesijos, kuriose bendrai sudalyvauja bent 100 studentų (-čių).' },
    { type: 'not-planned', content: 'Bent 75 proc. veiklose dalyvavusių studentų (-čių) veiklą vertina teigiamai.' },
  ],
  '4': [
    { type: 'warning', content: 'Patvirtinta darbo grupė ir atstovai (-ės), parengtas peržiūrų darbų sąrašas (šablonas, kalba, ECTS ± 10 proc.), aiškios rolės ir kontaktai.' },
    { type: 'not-planned', content: 'Parengtas duomenimis grįstas atviro dalykų aprašų talpinimo pasiūlymas ir rekomendacijų paketas.' },
    { type: 'not-planned', content: 'VU FilF Tarybos posėdžio metu patvirtintas sutarimas pasiūlymo siekiniams suderinti įgyvendinimo grafiką (šablonas, terminas, publikavimas), įsipareigojimus ir atsakingus asmenis.' },
    { type: 'not-planned', content: 'VMA yra naujas polapis, kurio naujinimo progresas su įkeliamais dalykų aprašais yra stebimas bent 5 žmonių.' },
  ],
  '5': [
    { type: 'success', content: 'VU FsF yra parengtos DI naudojimo gairės.' },
    { type: 'warning', content: 'Patvirtintos DI naudojimo gairės VU FsF Taryboje.' },
    { type: 'warning', content: 'VU FsF studentai (-ės) ir dėstytojai (-os) yra informuoti apie DI naudojimo galimybes ir patvirtintas DI naudojimo gaires bent 4 komunikacijos kanalais.' },
  ],
  'gmc': [
    { type: 'warning', content: 'Apklausos metu sužinota, kad 10 proc. studentų praktikų polapis padėjo susirasti praktikos vietą.' },
    { type: 'warning', content: 'Įgyvendintas praktikos vadov(i)ų kompetencijų kėlimas.' },
    { type: 'warning', content: 'Bent 50 proc. apklaustųjų studentų (-čių) teigia žinantys (-čios) apie praktikų procesą.' },
  ],
  '6': [
    { type: 'warning', content: 'Studentai (-ės) iš 10 modulių įvardina, kad VMA yra pagrindinė dėstytojų ir studentų (-čių) komunikacijos platforma ir ja naudojamasi nuosekliai.' },
    { type: 'warning', content: 'Apklausą apie iš dėstytojų gaunamą grįžtamąjį ryšį užpildo 40 proc. VU IF studentų (-čių).' },
  ],
  '7': [
    { type: 'warning', content: 'Bent 50 proc. rudens semestre dėstomų studijų dalykų studentai (-ės) gavo grįžtamąjį ryšį ne per ilgesnį kaip dviejų savaičių laikotarpį po atsiskaitymo.' },
    { type: 'warning', content: 'Kiekvienos studijų programos grupės studentai (-ės) yra informuoti (-os) apie grįžtamojo ryšio svarbą, jo formas ir žino, kad turi jį gauti numatytu dviejų savaičių laikotarpiu.' },
    { type: 'not-planned', content: 'Dėstytojai (-os) supažindinti su grįžtamojo ryšio reikšme studentų (-čių) mokymosi procesui, jiems (-oms) pateikti aiškūs siūlymai dėl tinkamų grįžtamojo ryšio formų bei rekomenduotas teikimo dažnis – per dvi savaites po atsiskaitymo.' },
    { type: 'warning', content: 'VU KF sprendimų priėmėjai (-os) priima VU SA KF pateiktus siūlymus ir taiko juos siekiant gerinti grįžtamojo ryšio teikimo kokybę studijų procese.' },
  ],
  '8': [
    { type: 'warning', content: 'VU SA KnF paviešinta kokybiško grįžtamojo ryšio teikimo metodika.' },
    { type: 'warning', content: 'Informacija apie su grįžtamuoju ryšiu susijusias iniciatyvas ar akcijas patalpinta bent 3 skirtinguose komunikacijos kanaluose (Facebook, Instagram, laiškai).' },
    { type: 'warning', content: 'Visose VU KnF SPK yra priimamas bent 1 pokytis, susijęs su grįžtamojo ryšio teikimu.' },
    { type: 'warning', content: 'Apklausoje daugiau nei 60 proc. dalyvavusių studentų (-čių) yra suteikę (-usios) ar sulaukę (-usios) kokybiško grįžtamojo ryšio.' },
  ],
  '9': [
    { type: 'success', content: 'Is.vu.lt 2025–2026 m. rudens semestro apklausos pildymas pirmos ir antros studijų programų pakopų padidėjo 3 proc., lyginant su 2024–2025 m. rudens semestro apklausomis.' },
    { type: 'warning', content: 'Atsižvelgiant į VU SA MF siūlymus, įvyksta bent trys pedagoginės kvalifikacijos kėlimo iniciatyvos.' },
    { type: 'warning', content: 'Bent 6 studijų moduliuose įvyksta arba suplanuoti studentams (-ėms) palankūs pokyčiai.' },
  ],
  '10': [
    { type: 'success', content: 'Ne mažiau kaip 70 proc. studentų (-čių) atstovų (-ių) SPK posėdžių metu pateikia bent vieną argumentuotą pasiūlymą ar komentarą dėl studijų kokybės gerinimo.' },
    { type: 'warning', content: 'Ne mažiau kaip 35 proc. SPK aptartų studentų (-čių) grįžtamojo ryšio atvejų turi įgyvendintas rekomendacijas dėl dėstymo kokybės gerinimo.' },
    { type: 'warning', content: 'Įgyvendintos ne mažiau kaip 3 skirtingos komunikacijos iniciatyvos (renginiai, mokymai, publikacijos, vaizdo įrašai ir kt.), skirtos kokybiško grįžtamojo ryšio svarbai pristatyti.' },
  ],
  '11': [
    { type: 'success', content: '80 procentų apklausos apie VU ŠA vykdomų renginių ir iniciatyvų bendruomeninių poreikių patenkinimą respondentų teigia, kad yra atliepiami jų bendruomeniniai poreikiai.' },
    { type: 'success', content: 'Kartu su kitomis švietimo institucijomis vykdytuose renginiuose, iniciatyvose ir karjeros planavimo veiklose sudalyvavo bent 150 studentų (-čių).' },
  ],
  '12': [
    { type: 'warning', content: '20 proc. VU IS apklausose atsakiusių studentų (-čių) teigia, kad VU TF dėstytojai (-os) ir seminarų vedėjai (-os) teikia grįžtamąjį ryšį.' },
    { type: 'success', content: 'VU SA TF sukurtoje apklausoje grįžtamąjį ryšį apie dėstytojus per metus pateikė bent 100 VU TF studentų (-čių).' },
    { type: 'success', content: 'VU TF studentai (-ės), dėstytojai (-os) ir seminarų vedėjai (-os) yra supažindinti (-os) su grįžtamojo ryšio teikimo sistema.' },
  ],
  '13': [
    { type: 'warning', content: 'VU TSPMI puslapyje atnaujinta informacija apie mainų galimybes.' },
    { type: 'warning', content: 'Bent 50 proc. studentų (-čių), dalyvavusių mainų programoje, pasinaudojo mentorių tinklu.' },
    { type: 'warning', content: 'Sukurta bendradarbiavimo partnerystė su mažiausiai 15 tarptautinių institucijų.' },
  ],
  '14': [
    { type: 'error', content: 'Problemų analizės dokumentas yra įkeliamas į VU SA VM archyvą.' },
    { type: 'error', content: 'Daugiau nei 30 proc. apklaustųjų, dalyvavusių moduliuose, kuriuos vedė konstruktyvų grįžtamąjį ryšį teikiantys dėstytojai (-os), teigia, kad gauto grįžtamojo ryšio kokybė pagerėjo.' },
    { type: 'error', content: 'Bent vienu VU SA VM komunikacijos kanalu yra paskelbiama ataskaita, kurioje apibendrinami užbaigtų focus grupių, apklausų rezultatai, lektorių pateikti konstruktyvūs atsiliepimai ir priimti pakeitimai.' },
  ],
}
</script>

## VU SA CHGF

VU CHGF studijų dalykų aprašai yra peržiūrėti ir bent 2 kiekvienos studijų programos dalykų aprašai patobulinti, atsižvelgiant į pakitusias dėstymo praktikas, vertinimą, literatūrą, studijų dalyko aprašo šabloną.

<TimelineItemSection :items="goals['1']" />

::: tip ☑️ Kas įgyvendinta?

- Parengtas aiškus ir struktūruotas rekomendacijų pristatymas, atspindintis studentų (-čių) lūkesčius (remiantis problemos analize ir Vilniaus universiteto studijų programų reglamentu) dėl informacijos, kuri turėtų būti pateikiama studijų dalykų aprašuose. Pastarasis aprašymas buvo pristatytas VU CHGF prodekanei doc. dr. Tatjanai Kochanei.

- VU CHGF Studijų kolegijos posėdžio metu Studijų programos komitetų (SPK) pirmininkai (-ės) supažindinti (-os) su fakulteto bendruomenei aktualia netinkamų ar nekorektiškų studijų dalykų (modulių) rengimo problematika, pasiūlytos rekomendacijos dėl informacijos, pateikiamos studijų dalykų aprašuose. Rekomendacijos buvo perduotos tolesniam svarstymui siekiant, kad informacija pasiektų visus dėstytojus (-as).

- Siekiant įvertinti ir surinkti grįžtamąjį ryšį apie realaus studijų dalykų įgyvendinimo atitikimą skirtingiems VU CHGF studijų programose atliekamiems dalykams, buvo vykdomos focus grupės. Įvyko visų (išskyrus MA programos „Kartografija“) studijų programų susitikimai, kurie parodė, kad beveik visose programose yra keistinų ir tobulinamų studijų dalykų aprašų.

- Po focus grupių ir atliktos analizės buvo suformuotas pasiūlymas atnaujinti bent po 3 studijų dalykų aprašus skirtingose programose. Bendrai buvo suformuoti skirtingi pasiūlymai 37-iems studijų dalykų aprašams.

- Siūlymai keisti studijų dalykų aprašus pateikti 22-iems dėstytojams (-oms) iš 37.

- Buvo atnaujinti 9 dalykų aprašai.

:::

## VU SA EVAF

VU EVAF dėstytojai (-os) savo studijų dalykuose įdiegia studentų (-čių) pasirinktus mokymo metodus, kuriuos studentai (-ės) laiko naudingais.

<TimelineItemSection :items="goals['2']" />

::: tip ☑️ Kas įgyvendinta?

- Buvo sukurta ir išplatinta apklausa, kurios metu VU EVAF studentai (-ės) galėjo išreikšti savo nuomonę apie papildomai studijų procese naudojamus mokymosi metodus. Apklausoje savo nuomonę išreiškė 93 studentai (-ės).

- Apklausos rezultatų išvados parodė, kad studentai (-ės) studijų procese labiausiai norėtų matyti šiuos papildomus mokymosi metodus: paskaitų metu klausytis kviestinių lektorių paskaitų, daugiau dirbti grupėse, turėti paskaitas įmonių erdvėse.

- Atrinktiems studijų metodams buvo paruoštas aprašymas, kuriame nurodyti konkretūs metodo pritaikymo studijų procese pavyzdžiai bei aprašymai. Aprašymas vėliau buvo teikiamas atrinktiems dėstytojams (-oms).

- 5 dėstytojai (-os) norėjo bendradarbiauti įdiegiant studentų (-čių) pasirinktus dėstymo metodus. Savo dėstymo metodologijoje naujus mokymosi metodus įtraukė: doc. dr. Laimutė Urbšienė (studijų dalyke „Finansų rinkos ir vertybiniai popieriai“ papildomai vyko aukciono simuliacinis žaidimas), dr. Greta Keliuotytė-Staniulėnienė (studijų dalyke „Finansų rinkų techninė ir fundamentali analizė“ buvo įtrauktos grupinės diskusijos, kurių metu buvo galima gauti papildomų balų), dr. Brigita Šidlauskienė-Riazanova (studijų dalyke „Tarptautinė ekonomika“ buvo naudojama „Kahoot“ platforma bei įtraukti kviestiniai svečiai), dr. Jelena Stankevičienė (studijų dalyke „Finansų pagrindai“ buvo organizuojami vizitai į įmones, naudotasi Bloomberg Lab galimybėmis, vykdytos grupinės diskusijos, naudota platforma „Slido“), dr. Neringa Ramanauskė (studijų dalyke „Mikroekonomika I“ pritaikyta platforma „Slido“ papildomiems balams gauti).

- Buvo sudaryta papildoma apklausa, kurioje studentai (-ės) galėjo nurodyti, ar papildomi mokymosi metodai pagerino jų studijų patirtį.

:::

## VU SA FF

Gerinti VU FF I pakopos I kurso studentų (-čių) studijų aplinką ir prieinamumą, diegiant savarankiško mokymosi kultūrą bei informuojant apie studijų valdymo galimybes.

<TimelineItemSection :items="goals['3']" />

::: tip ☑️ Kas įgyvendinta?

- VU FF sukurtos mokymosi grupelės jaunesnio kurso studentams (-ėms). Įgyvendinant šių mokymosi grupelių veiklą buvo surasti vadovauti galintys 5 vyresnio kurso studentai (-ės).

- VU SA FF vidiniais kanalais buvo išviešintos mokymosi grupelės, kuriose bendrai sudalyvavo apie 100 studentų (-čių).

:::

## VU SA FilF

VU FilF virtualioje mokymosi aplinkoje (skiltyje „Dalykų aprašai“) atvirai paskelbti bent 35 proc. 2025 / 2026 m. m. vykdomų BA ir MA dalykų aprašai, paruošti vieningu šablonu, remiantis VU parengta pagalbine medžiaga dalykų (modulių) aprašams. Kiekvienas aprašas: (a) parengtas programos vykdomąja kalba (LT / EN / PL / RU), (b) atitinka ECTS krūvio skaičiuoklę (± 10 proc. paklaida).

<TimelineItemSection :items="goals['4']" />

::: tip ☑️ Kas įgyvendinta?

- Sudaryta VU SA FilF darbo grupė, atsakinga už dalykų aprašų peržiūrą ir atnaujinimą.

- Darbo grupės nariai (-ės) bei atstovai (-ės) dalyvavo atstovų mokymuose, jei neturėjo kompetencijų iš anksčiau. Darbo grupės nariai (-ės) parengė studijų dalykų, kuriems atnaujinimas yra skubus, naujinimo rekomendacijas.

- Įvyko susitikimas su VU FilF Studijų skyriumi, kuriam buvo pristatyta iškelta problematika, aptartas veiksmų planas ir gautas grįžtamasis ryšys. Su Studijų skyriumi sutarta nekurti atviros prieigos kurso VMA sistemoje, nes tai atkartotų VU IS turinį, kuris nėra užpildomas reikalingais dalykų aprašais. Nutarta peržiūrėti esamą studijų dalykų aprašų situaciją ir įvertinti reikalingus pokyčius.

- Įvyko susitikimas su VU FilF Studijų prodekane, kuriai pristatyta problematika ir preliminarios darbo grupės parengtos rekomendacijos. Aptarta studentams (-ėms) svarbiausios naujinimo vietos bei galimybė svarstyti šį klausimą Studijų kolegijoje.

- Kartu su Studijų skyriumi pristatytas dalykų aprašų naujinimo klausimas. Studijų skyrius pateikė informaciją dėl dalykų, tvirtinamų bendrai Studijų kolegijoje. Studentų atstovė Gabija Smailytė pristatė problematiką, surinktą kontekstinę medžiagą apie šio klausimo poreikį, patikslintas rekomendacijas. Siekta susitarimo, kad šis klausimas būtų ne tik inicijuojamas studentų atstovų (-ių), bet ir SPK pirmininkų (-ių), kadangi savalaikė dalykų aprašų peržiūra yra viena iš SPK funkcijų. Kartu remtasi ir ankstesniu Studijų kolegijos sutarimu visus kitam semestrui vykdomų dalykų aprašus atnaujinti prieš juos skelbiant, tai pažymint naujinimo data dalyko aprašo apačioje, išreikštas prašymas nuodugniai peržiūrėti dalykų aprašus, o ne tik atnaujinti datą.

- Parengtos dalykų aprašų peržiūros instrukcijos atstovams (-ėms) pasinaudojant preliminariomis rekomendacijomis. Šiuo metu instrukcijos pasidalintos tik atstovų (-ių) tarpe; kartu parengtas studijų dalykų peržiūros progreso stebėjimo įrankis, kuriame dalykai peržiūrymi: atskiriant individualiuosius dalykus ir bendrus BA privalomus dalykus / PD bei bendrus MA PD, nes šių dalykų aprašai tvirtinami dar ir Studijų kolegijoje. Šiame įrankyje naudojami 2026 m. stojimui paskelbti studijų programų tinkleliai (nebent šiais metais neskelbiama).

- Peržiūrėta bent dalis dalykų aprašų bei pateikti komentarai šių studijų programų: Intermedialios literatūros studijos, Lietuvių filologija, Lietuvių filologija: kultūros ir medijų studijos, Lietuvių filologija: redagavimas, Prancūzų filologija, Vertimas (BA).

:::

## VU SA FsF

VU FsF yra parengtos ir patvirtintos DI naudojimo gairės, su kuriomis yra supažindinti (-os) FsF studentai (-ės) ir dėstytojai (-os).

<TimelineItemSection :items="goals['5']" />

::: tip ☑️ Kas įgyvendinta?

- VU SA FsF Dekanate pristatytas vykdomas metų tikslas ir jo aktualumas, taip pat vyko atskiras susitikimas su VU FsF Prodekane doc. dr. Jolanta Aleknevičiene. Šių susitikimų metu aptarta, kaip fakultete pritaikyti dirbtinio intelekto (DI) gaires, ir suderinta, kokias aktualias temas į jas įtraukti.

- Buvo sudaryta darbo grupė, susidedanti iš 5 dėstytojų, priklausančių skirtingiems institutams ir 2 studentų (-čių) atstovų (-ių), kurie (-ios) yra supažindinti (-os) su kontekstine informacija ir rengė dirbtinio intelekto (DI) naudojimo fakultete gaires.

- Suorganizuota focus grupė su studentais (-ėmis) dėl dirbtinio intelekto (DI) reglamentavimo poreikio. Focus grupėje dalyvavo 2–4 kurso bakalauro studentai (-ės), kurie pasidalino savo patirtimi, naudojant dirbtinį intelektą (DI) studijų procese. Buvo apibrėžti esminiai ir svarbiausi tematiniai dirbtinio intelekto (DI) naudojimo reglamentavimo poreikio pagrindiniai laukai: aiškios komunikacijos trūkumas, apibrėžtis procentais, dirbtinio intelekto (DI) įrankiai, dirbtinio intelekto (DI) įrankių naudojimo diferencijavimas, deklaravimas ir citavimas, dirbtinio intelekto (DI) paieška ir tikrinimas, mokymai, dėstytojai (-os) ir studentai (-ės) bei saugumo aspektai. Šioje focus grupėje dalyvavo 10 žmonių.

- Dalyvauta darbo grupėje dėl DI reglamentavimo rašto darbuose. Šioje darbo grupėje studentus (-es) atstovavo VU SA FsF akademinio proceso reikalų koordinatorė Gabrielė Šlepetytė ir VU SA FsF pirmininkė Austėja Pupelytė. Darbo grupė turėjo vieną susitikimą, kurio metu aptarė pagrindinius DI naudojimo reglamentavimo aspektus ir tolimesnį darbą.

- Studijų kolegijos posėdyje pristatytas pirminis gairių variantas. Studijų kolegijos posėdžio metu buvo priimtas sprendimas gaires tvirtinti atskirai kiekviename VU FsF SPK.

- Studentams (-ėms) balandžio 16 d. buvo surengtas renginys apie DI naudojimo tematiką ir akademinį raštingumą.

:::

## VU SA GMC

VU GMC studentams (-ėms) yra suteikiami ištekliai praktikos pasirinkimui ir eigai, užtikrinant veikiančią praktikų sistemą.

<TimelineItemSection :items="goals['gmc']" />

::: tip ☑️ Kas įgyvendinta?

- VU SA GMC sudarė ir įgyvendino apklausą, kurios metu buvo siekiama sužinoti, ar VU GMC puslapyje esantis praktikų polapis padėjo studentams (-ėms) labiau suprasti praktikų procesą ir susirasti praktiką. Apklausą iš viso užpildė 176 studentai (-ės) iš 2–4 kursų, atstovaujantys (-čios) 7 skirtingoms studijų programoms. Iš praktiką atliekančių studentų 70 proc. nurodė, kad praktikos vietą rasti buvo lengva, o net 97 proc. apklaustųjų teigė esantys (-čios) patenkinti (-os) savo praktikos vieta (GMC ar kita įstaiga). 75 proc. studentų (-čių) nurodė nežinantys (-čios) arba nesantys (-čios) tikri (-os), kur reikėtų ieškoti ar į ką kreiptis pagalbos, norint susirasti praktikos vietą.

- Buvo atlikta papildoma VU GMC praktikų polapio analizė ir sudaryti pasiūlymai administracijai, kuriais siekiama atnaujinti puslapyje esančią informaciją, kad ji taptų aiškesnė ir padėtų studentams (-ėms) sklandžiau rinktis praktikos vietą.

- Buvo įvykdyti pokalbiai su doktorantų (-čių) atstovais (-ėmis), doktorantūros mokykla bei didaktikos centru apie praktikas ir galimybę kelti praktikos vadovų kompetencijas. Susitikimų metu pritarta idėjai, kad reikia organizuoti mokymus, kuriuose galėtų dalyvauti psichologijos, edukologijos ar didaktikos specialistas bei moderatorius, kurie galėtų dalintis patirtimis, kaip elgtis kritinėse situacijose, kaip pasiruošti vadovauti praktikai bei kokių klaidų reikėtų vengti. Sutarta, kad doktorantai už dalyvavimą šiuose mokymuose gautų 0,25 ECTS kreditų.

- VU SA GMC puslapyje atsirado nauja skiltis „Profesinė praktika“, kurioje buvo sukelta ir paviešinta visa detali informacija apie praktikas, jų atlikimą bei pagrindinius žingsnius, kuriuos reikia atlikti iki praktikos pradžios. Puslapis buvo kuriamas bendradarbiaujant su VU GMC administracija.

- Buvo surasti studentai (-ės), kurie (-ios) atliko tarptautinę praktiką, bei aptarta komunikacinės kampanijos vizija apie tarptautines praktikas, kurias siūlo VU GMC ne tik padalinyje, bet ir pas socialinius partnerius Lietuvoje bei užsienyje.

:::

## VU SA IF

Tarp VU IF studentų (-čių) ir dėstytojų vyksta nuosekli komunikacija, pagrįsta grįžtamuoju ryšiu.

<TimelineItemSection :items="goals['6']" />

::: tip ☑️ Kas įgyvendinta?

- Išanalizuotos naujausios VU IS apklausos, siekiant sudaryti 5 dažniausiai pasikartojančių problemų, kurios būtų susijusios su virtualios mokymosi aplinkos (VMA) naudojimu, sąrašas.

- Įvyko susitikimas su Akademinių reikalų ir tarptautinių ryšių prodekanu asist. dr. Norbertu Černiausku, kurio metu buvo aptarta virtualios mokymosi aplinkos (VMA) (ne)naudojimo situacija fakultete bei pristatytos pastarosios aplinkos naudojimo gairės, kuriomis būtų skatinamas dėstytojų naudojimasis virtualia mokymosi aplinka (VMA).

- Buvo sukurtos virtualios mokymosi aplinkos (VMA) naudojimo gairės dėstytojams (-oms).

- Buvo surasti studentų (-čių) atstovai (-ės), kurie stebėtų ir identifikuotų, ar VMA yra tinkamai naudojamas studijų procese.

- Remiantis VU FsF sudarytomis grįžtamojo ryšio gairėmis, buvo sukurtos VU IF pritaikytos grįžtamojo ryšio gairės, kurios vėliau buvo išplatintos skirtinguose viešinimo kanaluose.

- Vykusiame VU IF studentų (-čių) visuotiniame susirinkime buvo pristatyti VU apklausos rezultatai bei įžvalgos, atskirai pabrėžta grįžtamojo ryšio svarba.

- VU SA IF organizavo apklausą apie dėstytojų teikiamą grįžtamąjį ryšį, vėliau atliko šios apklausos analizę ir priėjo prie išvadų, kuriomis remiantis bus papildomai skatinamas grįžtamasis ryšys iš dėstytojų.

:::

## VU SA KF

Ne mažiau nei 50 proc. rudens semestre VU KF dėstomų studijų dalykų studentai (-ės) gauna grįžtamąjį ryšį ne vėliau, kaip po dviejų savaičių po atsiskaitymo.

<TimelineItemSection :items="goals['7']" />

::: tip ☑️ Kas įgyvendinta?

- VU SA KF pirmakursių stovyklos metu buvo įgyvendintos veiklos, kurių metu pristatyta grįžtamojo ryšio svarba bei aktualumas studijų procesui.

- Įvyko 6 focus grupės su VU KF SPK studentų (-čių) atstovais (-ėmis) ir kontaktiniais asmenimis, siekiant identifikuoti problemines vietas dėstytojų grįžtamojo ryšio teikimo procese. Jų metu paaiškėjo, kad grįžtamojo ryšio teikimas fakultete yra netolygus. Dauguma studentų (-čių) nurodė, jog jiems (-oms) trūksta grįžtamojo ryšio po tarpinių atsiskaitymų, taip pat pasigedo išsamesnių, asmeninių komentarų po pristatymų ar egzaminų. Buvo išreikštas poreikis, kad dėstytojai (-os) aiškiai nurodytų, kokiu būdu teiks grįžtamąjį ryšį ir kaip studentai (-ės) galėtų jo prašyti.

- Buvo parengta studentams (-ėms) lengvai suprantama grįžtamojo ryšio atmintinė, padedanti atpažinti kokybišką grįžtamąjį ryšį ir skatinanti jį taikyti studijų procese.

- Pastebėjus problemines vietas, VU KF studentų (-čių) atstovai (-ės) įgyvendino pokalbius su atitinkamais dėstytojais (-omis), pristatydami dabartinę grįžtamojo ryšio situaciją. Pokalbių metu susitarta su 11 dėstytojų dėl dažnesnio grįžtamojo ryšio teikimo.

- Parengtos apklausos kiekvienai studijų programai, siekiant įvertinti grįžtamojo ryšio iš dėstytojų teikimo dažnumą ir kokybę rudens semestre, akcentuojant numatytą dviejų savaičių laikotarpį. Šias apklausas užpildė 170 studentų. Pagal pateiktus apklausos rezultatus buvo nustatyta, kad 65 proc. dėstytojų teikia grįžtamąjį ryšį studentams (-ėms) per dviejų savaičių laikotarpį nuo atsiskaitymo.

- VU SA KF socialiniuose tinkluose pasidalinta trumpalaikių įrašų ciklu apie galimybę bei būtinybę susitarti su dėstytojais (-omis) dėl grįžtamojo ryšio teikimo būdų bei numatyto dviejų savaičių termino pavasario semestre.

- VU KF dėstytojams (-oms) buvo suorganizuoti grįžtamojo ryšio mokymai, kuriuos vedė VU ŠA Direktorė prof. dr. Renata Bilbokaitė. Mokymų metu dėstytojams (-oms) buvo pristatytos grįžtamojo ryšio teikimo metodikos, nauda ir praktikos, kaip grįžtamąjį ryšį galima gauti ir teikti. Dėstytojų atsiliepimai buvo teigiami, todėl mokymus žadama kartoti ateityje.

- VU KF administracijai atskiru teikimu buvo pateikti siūlymai nuo VU SA KF dėl grįžtamojo ryšio teikimo kokybės gerinimo studijų procese.

:::

## VU SA KnF

VU KnF dėstytojai (-os) ir studentai (-ės) aktyviai suteikia kokybišką grįžtamąjį ryšį.

<TimelineItemSection :items="goals['8']" />

::: tip ☑️ Kas įgyvendinta?

- Siekiant gerinti studentų (-čių) patirtį studijų metu VU KnF buvo parengta kokybiško grįžtamojo ryšio teikimo metodika, paviešinta skirtingais vidiniais kanalais.

- Naudojant parengtą grįžtamojo ryšio metodiką buvo paruoštas potencialių pasiūlymų sąrašas pokyčiams, kurie turėtų būti įgyvendinti VU KnF SPK.

- Įvyko studijų kolegijos posėdis, kuriame aptartas ir pristatytas potencialių pasiūlymų sąrašas.

- Sudarytas ir VU KnF studentams (-ėms) vidiniais ir išoriniais kanalais paviešintas grįžtamojo ryšio vadovas. Su vadovu galima susipažinti čia.

:::

## VU SA MF

VU MF veikia vidinė studijų kokybės užtikrinimo sistema, grįsta studentų (-čių) grįžtamuoju ryšiu ir atitinkanti vidinius kokybės kriterijus.

<TimelineItemSection :items="goals['9']" />

::: tip ☑️ Kas įgyvendinta?

- Gruodžio ir balandžio mėn. vykusiuose susitikimuose su kontaktiniais asmenimis aptartos studentams (-ėms) aktualios studijų problemos bei informuota apie VU SA MF inicijuotus sprendimo būdus. Priminta, kad su studijų vykdymu susijusias problemas galima teikti užpildant VU MF Studijų skyriaus specializuotą formą arba informuojant studentų (-čių) atstovus (-es) SPK.

- El. laiškais ir socialiniuose tinkluose studentams (-ėms) pristatytos VU SA MF konstruktyvaus grįžtamojo ryšio gairės – dokumentas, kuriame pateikiami praktiniai patarimai, kaip teikti tikslius, sprendimais grįstus komentarus, kurie leistų sistemingai gerinti studijų kokybę.

- VU SA MF parengė vidinius studijų kokybės kriterijus bei aptarė juos su VU MF administracija ir Edukacinių kompetencijų skyriumi. Dokumentu pasidalinta su studentų (-čių) atstovais (-ėmis) VU MF dariniuose, akcentuojant studijų modulių analizę, grįstą tarptautiniais standartais ir gerosiomis praktikomis.

- VU SA MF inicijavo susitikimą su VU MF Edukacinių kompetencijų skyriumi (EKS), siekiant stiprinti studijų kokybę ir modulių analizę. Susitikimo metu aptarti studentų (-čių) lūkesčiai pedagoginių kompetencijų stiprinimo srityje (apimant dėstymo metodų ir atsiskaitymų kokybės klausimus), aptarta studentų (-čių) atstovų (-ių) veikla SPK.

- Remiantis VU IS apklausų ir focus grupių duomenimis, VU MF studentų (-čių) atstovai (-ės) išanalizavo probleminius studijų modulius, atsižvelgdami (-os) į studentų (-čių) pasitenkinimą. Parengti 9 modulių analizės dokumentai, inicijuoti susitikimai su modulių koordinuojančiais (-čiomis) dėstytojais (-omis), teikiant konstruktyvų grįžtamąjį ryšį.

- Įvyko 6 susitikimai su šių modulių kooordinuojančiais (-čiomis) dėstytojais (-omis): Žmogaus fiziologija ir biochemija (Kineziterapijos SP); Žmogaus fiziologijos pagrindai (Farmacijos SP); Dailės terapijos; Reabilitacijos (Menų terapijos SP); Medicininė regos korekcija ir optometrinės įrangos medicinoje taikymas; Regos sistema (fizika) ir jos koregavimo priemonės bei optometrinių tyrimų technologijos. Regos koregavimo priemonės (Optometrijos SP).

- Papildomai suplanuoti 2 susitikimai su šių dalykų koordinuojančiais (-čiomis) dėstytojais (-omis): Vaikų ligos ir kineziterapija, motorinės kontrolės raida (Kineziterapijos SP); Gyvybės mokslai (slaugos SP).

- Susitikimų metu parengti modulių kokybės tobulinimo planai su numatytais pokyčiais ir jų įgyvendinimo terminais. Planai apima dalyko aprašo tikslinimą, labiau įtraukiančių dėstymo metodų taikymą, atsiskaitymų kokybės gerinimą, savalaikį grįžtamąjį ryšį studentams (-ėms) po atsiskaitymų, aiškių ir prieinamų literatūros šaltinių pateikimą bei struktūruotą VMA naudojimą.

- Diskusijų rezultatai perduoti studijų programų kontaktiniams asmenims, taip pat stiprintas tiesioginis ryšys su studentais (-ėmis), užtikrinant informacijos apie vykdomus ir planuojamus pokyčius sklaidą bei nuoseklų studijų kokybės gerinimo proceso tęstinumą.

:::

## VU SA MIF

VU MIF SPK posėdžiuose sistemingai analizuojami studentų (-čių) grįžtamojo ryšio apie dėstymą rezultatai iš studijų programų apklausų, siekiant, kad bent 35 proc. aptartų atvejų būtų imtasi bent vieno pedagoginių kompetencijų tobulinimo veiksmo pagal gautą grįžtamąjį ryšį.

<TimelineItemSection :items="goals['10']" />

::: tip ☑️ Kas įgyvendinta?

- Buvo įgyvendinti VU SA MIF atstovų mokymai, kuriuose studentų (-čių) atstovai (-ės) buvo supažindinami (-os) su jų SPK specifika ir metų tinkleliu, išsikeltais lūkesčiais. Kartu su studentų (-čių) atstovais (-ėmis) buvo nagrinėtos studentams (-ėms) aktualios problemos ir pateikti pavyzdžiai, kaip argumentuoti esamas problematikas bei jas spręsti.

- Nuolatos buvo vykdyti individualūs pokalbiai su studentų (-čių) atstovais (-ėmis), kurių metu buvo aptariama atstovo (-ės) savijauta pareigose, išsikeltas tikslas bei ateities planai.

- Kiekvienoje studijų programoje (bakalauro ir magistrantūros pakopose) buvo išskirtas bent vienas tobulintinas aspektas.

- Siekiant įgyvendinti pokyčius studijų programose buvo inicijuoti SPK posėdžiai, kuriuose aptartos problemos ir jų galimi sprendimo būdai. Buvo įgyvendinti šie posėdžiai:

- Informacinių sistemų inžinerijos SPK, reaguojant į studentų (-čių) nusiskundimus, pakeistas vienas dėstytojas, o kito dėstytojo darbas pradėtas stebėti detaliau.

- Matematikos mokymo ir edukometrijos SPK siūlyta keisti dėstytoją, taip pat sujungti du studijų dalykai, siekiant pagerinti jų struktūrą.

- Matematikos SPK inicijuotas dėstytojo pakeitimas dėl dėstymo kokybės problemų.

- Duomenų mokslo ir Verslo duomenų analitikos SPK atnaujinti keli studijų dalykai, spręstos studijų kokybės problemos bei priimti programos tobulinimo sprendimai.

- Programų sistemų bakalauro programoje išspręsta studentų (-čių) duomenų viešinimo problema.

- Informacinių technologijų SPK identifikuotos studijų kokybės problemos ir inicijuotas dialogas su dėstytojais (-omis), numatant tolimesnius sprendimus.

- Finansų ir draudimo matematikos SPK iškelta studijų struktūros problema ir identifikuotas poreikis atnaujinti programos informaciją.

- Siekiant didinti bendruomenės informuotumą ir įsitraukimą, per lapkričio mėn. vykusius mokymus buvo organizuota paskaita VU SA MIF nariams, kurios metu pristatyta grįžtamojo ryšio reikšmė studijų kokybei bei aptarta, kaip korektiškai ir konstruktyviai pildyti apklausas. Gruodžio–sausio mėn. įgyvendinta komunikacijos kampanija, kurios metu viešinta informacija apie grįžtamojo ryšio naudą, svarbą bei praktinius jo taikymo pavyzdžius. Taip pat numatytas papildomas komunikacijos etapas gegužės mėn., siekiant užtikrinti tęstinę informacijos sklaidą.

:::

## VU SA ŠA

VU ŠA vykdomi renginiai ir iniciatyvos, kurie skatina (bendra)akademinę jauseną bei nuoseklų karjeros planavimą.

<TimelineItemSection :items="goals['11']" />

::: tip ☑️ Kas įgyvendinta?

- Buvo įvykdyta apklausa, kurios tikslas – išsiaiškini studentų (-čių) ir VU ŠA bendruomenės poreikius dėl įvairių renginių organizavimo. Apklausa parodė, kad bendruomenės nariai (-ės) norėtų turėti daugiau renginių neformalioje aplinkoje, daugiau aktyvių ar su sportu susijusių veiklų. Apklausoje dalyvavę dėstytojai (-os) taip pat išreiškė poreikį renginius daryti ne paskaitų metu, o apklausą pildę (-žiusios) studentai (-ės) patys (-čios) išreiškė norą prie tokių renginių prisidėti.

- Vykdytas bendradarbiavimas su Šiaulių valstybine kolegija (ŠVK) bei Šiaulių technologijų mokymosi (ŠTM) centru dėl potencialių renginių ir bendradarbiavimo galimybių tarpusavyje.

- Įgyvendinant metų tikslą buvo suorganizuoti šie renginiai: Helovino vakarėlis (VU SA ŠA su ŠVK SA); Pyragų diena ŠA(VU SA ŠA su VU ŠA); Tarptautinės studentų dienos minėjimas renginyje „International Dinner“ (VU SA ŠA su VU ŠA); Šventinis filmų vakaras (VU SA ŠA su VU ŠA); Valentino vakaras (VU SA ŠA su ŠVK SA); Tarptautinės moters dienos minėjimas (VU SA ŠA su ŠVK SA).

:::

## VU SA TF

VU TF sukurta ir įdiegta vieninga grįžtamojo ryšio sistema, siekianti gerinti akademinio proceso kokybę.

<TimelineItemSection :items="goals['12']" />

::: tip ☑️ Kas įgyvendinta?

- Siekiant išsiaiškinti VU TF studentų (-čių) poreikius dėl grįžtamojo ryšio buvo suorganizuota 6 asmenų focus grupė su visų kursų kontaktiniais asmenimis ir surinkta studentų (-čių) nuomonė apie dėstytojų teikiamą grįžtamąjį ryšį.

- Esama grįžtamojo ryšio problematika buvo aptarta su Viešosios teisės katedros vedėju Johanu Baltrimu, Baudžiamosios justicijos katedros vedėja Ilona Mihailovič, Privatinės teisės katedros vedėja Vida Petrylaitė, Studijų programos komiteto pirmininku Rimantu Simaičiu.

- Suorganizuotas susitikimas su Prodekane studijoms Vigita Vėbraite, kuriame buvo aptarti studentų (-čių) atsiliepimai apie dėstytojų teikiamą grįžtamąjį ryšį, katedrų vedėjų ir SPK pirmininko išsakyti argumentai bei pristatyta VU SA TF planai rengti grįžtamojo ryšio tvarką fakultete numatantį dokumentą.

- Parengtas grįžtamojo ryšio teikimo tvarką numatantis dokumentas. Atsižvelgiant į VU akademinės etikos, studijų nuostatus, LR teisės aktus, kitų VU KAP ar aukštųjų mokyklų gerąsias praktikas. Parengtas dokumentas buvo pristatytas ir patvirtintas VU TF Dekanate ir SPK.

- VU SA TF pirmakursių stovykloje buvo įgyvendintos veiklos, kurių metu pristatyta grįžtamojo ryšio svarba bei aktualumas studijų procesui.

- VU SA TF socialiniuose tinkluose ir vidiniuose kanaluose buvo skelbiama informacija apie grįžtamąjį ryšį, jo naudą bei aktualumą studijų procesui. Kartu buvo paruošta ir paviešinta visus metus veikianti apklausa, kurioje studentai (-ės) gali teikti grįžtamąjį ryšį apie dėstytojus (-as).

:::

## VU SA TSPMI

VU TSPMI užtikrina veiksmingą mainų procesą išvykstantiems (-čioms) studentams (-ėms), teikdama efektyvią komunikaciją, logistinę ir akademinę paramą bei stiprius tarptautinius partnerystės ryšius.

<TimelineItemSection :items="goals['13']" />

::: tip ☑️ Kas įgyvendinta?

- Siekiant gerinti į mainus išvykstančių studentų (-čių) patirtį buvo įgyvendintas susitikimas su mainuose buvusiais (-iomis) studentais (-ėmis). Šio susitikimo metu buvo identifikuota, kad studentams (-ėms) trūksta komunikacijos ir pagalbos pildant dokumentus, aiškaus informacijos išdėstymo ir patarimų.

- Peržiūrėti dabartiniai duomenys, kurie yra teikiami VU TSPMI studentams (-ėms) prieš išvykstant į mainus. Atlikus analizę buvo nustatyta klaidinga informacija, identifikuoti universitetai, su kuriais pasibaigė sutartys.

- Buvo suburtas mentorių, kurie dalintųsi savo mainų patirtimi, tinklas. Šiame mentorių tinkle veikia 13 studentų (-čių). Prieš pradedant veiklą buvo įgyventi mokymai, kuriuos organizavo VU SA Centrinio biuro Tarptautinių studentų reikalų koordinatorė kartu su VU TSPMI administracija.

- Organizuojant mainų pristatymo renginį VU TSPMI, kartu buvo pristatyta naujai veikianti mentorių programa ir jos tikslai. Ateinančiais metais žadama tai kartoti.

- Susisiekta su 6 užsienio universitetų studentų atstovybėmis Vokietijoje, Lenkijoje, Šveicarijoje, Austrijoje, Švedijoje. Buvo suorganizuoti individualūs pokalbiai ir įvykdyti 3 vebinarai siekiant suprasti ir informuoti studentus apie universitetų socialinę ir akademinę aplinką.

:::

## VU SA VM

VU VM yra sukuriamas dvipusis studentų (-čių) atstovų (-ių) ir dėstytojų susitikimų modelis, kurio metu, remiantis per semestrą surinktais atsiliepimais, yra tobulinami studijų dalykai.

<TimelineItemSection :items="goals['14']" />

::: tip ☑️ Kas įgyvendinta?

- Siekiant išsiaiškinti VU VM studentams (-ėms) kylančių problemų mąstą ir kiekį buvo surengtos focus grupės, kurių metu apklausti studentai (-ės) pristatė studijų metu kylančiais iššūkiais.

:::
