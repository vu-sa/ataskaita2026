<script setup lang="ts">
import { ref, computed } from 'vue';
import MultiPersonAvatar from "../../components/MultiPersonAvatar.vue";
import { getPersonByName, extractNamesFromText } from "../../components/lib/personUtils";

// Extract and process names from the text
const senateFirstTermText = "Simonas Granskas, Julija Jarutytė, Gabrielė Kasperaitė, Justinas Kavoliūnas, Justas Lebedevas, Viktorija Milko, Martyna Pikelytė, Lukas Stakėla, Daniel Šematovič";
const senateSecondTermText = "Simonas Granskas, Ieva Gruodytė, Julija Jarutytė, Gabrielė Kasperaitė, Justinas Kavoliūnas, Viktorija Milko, Daniel Šematovič, Samanta Valiušaitytė, Povilas Virbašius";

// Extract names from text
const firstTermNames = extractNamesFromText(senateFirstTermText);
const secondTermNames = extractNamesFromText(senateSecondTermText);

// Define placeholder avatar colors for missing photos – amber & dark red from the theme
const placeholderBgColors = ['bg-amber-100 dark:bg-amber-800/30', 'bg-red-100 dark:bg-red-900/30'];

// Convert names to person objects for MultiPersonAvatar, adding custom styling for fallbacks
const firstTermPeople = computed(() => {
  const people = Array.isArray(getPersonByName(firstTermNames)) 
    ? getPersonByName(firstTermNames) as any[]
    : [getPersonByName(firstTermNames)];
    
  // Add custom styling for fallbacks
  return people.map((person, index) => ({
    ...person,
    fallbackClass: placeholderBgColors[index % placeholderBgColors.length]
  }));
});

const secondTermPeople = computed(() => {
  const people = Array.isArray(getPersonByName(secondTermNames))
    ? getPersonByName(secondTermNames) as any[]
    : [getPersonByName(secondTermNames)];
    
  // Add custom styling for fallbacks
  return people.map((person, index) => ({
    ...person,
    fallbackClass: placeholderBgColors[index % placeholderBgColors.length]
  }));
});
</script>

# Atstovavimas Vilniaus universitete

## VU Taryba

*Studentų (-čių) atstovai – Klėja Merčaitytė, Justinas Kondratas.*

VU Taryba – Universiteto valdymo organas, kuris prižiūri, ar
Universiteto veikla ir valdymas atitinka Universiteto misiją, veiklos
tikslus, uždavinius ir principus, bendruosius akademinius interesus,
Statute nustatytus viešumo ir atskaitomybės visuomenei reikalavimus.

Per ataskaitinį laikotarpį buvo suformuota naujai išrinkta VU Taryba,
kuriai šiemet atiteko svarbus uždavinys – išrinkti naująjį Vilniaus
universiteto Rektorių. Lygiagrečiai ataskaitiniu laikotarpiu VU SA
Parlamento sprendimu buvo perrinktas ir studentų (-čių) išorinis
atstovas – Justinas Kondratas.

Dar ankstesnėje VU Tarybos sudėtyje teko patvirtinti VU Rektoriaus
rinkimų tvarkos aprašą, paskelbti viešą tarptautinį konkursą VU
rektoriaus pareigoms eiti, patvirtino kandidatui prisistatyti skirtų
posėdžių tvarkaraštį taip pat teko apžvelgti Pedagogų rengimo centro
veiklą. VU Taryba turėjo ir posėdį Šiauliuose, kurio metu susitiko su
Šiaulių savivaldos vadovais. Diskusijos metu buvo iškeltas ir
tarptautinių studentų (-čių) integracijos mieste užtikrinimo klausimas.
Skirtingais klausimais VU Taryba teikė ir savo nuomonę VU Senatui, VU SA
atstovai (-ės) buvo iškėlę klausimą dėl užsienio kalba dėstomų studijų
programų kainų priėmimo proceso.

Gruodžio mėnesį, prisiekus naujiesiems (-ioms) VU Tarybos nariams
(-ėms), **buvo svarstyti šie svarbiausi klausimai**:

- Patvirtinta VU 2024 m veiklos ataskaita;
- Patvirtintas VU 2025 m. biudžetas;
- Išreikšti VU Tarybos lūkesčiai VU 2026-2030 m. Strateginiam veiklos
  planui;
- Atnaujintas VU Tarybos darbo reglamentas.

Naujoje VU Tarybos sudėtyje vyko pasitarimai dėl pagrindinių veiklos
tikslų ateinantiems metams bei išsakyti lūkesčiai dėl skirtingų
Universitete egzistuojančių tvarkų pokyčių reikiamybės.

Šiais metais buvo tęsiama metinio studentų (-čių) VU Taryboje pranešimo
tradicija – VU Prezidentė dalinosi įžvalgomis iš studentų (-čių)
gyvenimo Universitete, apimančiomis studijų kokybės, individualizavimo,
didesnio dėmesio atsparumo išorės grėsmės bei studentų (-čių) įtraukimo
į mokslines veiklas tematikoms. Taip pat dėmesys skirtas emocinės
gerovės puoselėjimo svarbai, tarptautinių studentų (-čių) integracijai,
doktorantūros studijų kokybės bei studentų (-čių) poreikius
atliepiančios Universiteto infrastruktūros užtikrinimui.

Ataskaitiniu laikotarpiu VU Tarybos studentų (-čių) atstovai dalyvavo ir
dvejose VU Senato strateginėse sesijose (apie jas plačiau galite
pasiskaityti sekančioje skiltyje).

## VU Senatas

*Studentų (-čių) atstovai (-ės) (Nuo 2024 m. birželio 7 d. iki 2024 m.
rugsėjo 20 d.) – Simonas Granskas, Julija Jarutytė, Gabrielė
Kasperaitė, Justinas Kavoliūnas, Justas Lebedevas, Viktorija Milko,
Martyna Pikelytė, Lukas Stakėla, Daniel Šematovič.*

*Studentų (-čių) atstovai (-ės) (nuo 2024 m. rugsėjo 20 d. iki dabar) –
Simonas Granskas, Ieva Gruodytė, Julija Jarutytė, Gabrielė Kasperaitė,
Justinas Kavoliūnas, Viktorija Milko, Daniel Šematovič, Samanta
Valiušaitytė, Povilas Virbašius.*

VU Senatas – Universiteto valdymo organas, sudarytas iš VU akademinės
bendruomenės narių. Senatas yra atsakingas už studijų kokybės priežiūrą
ir gerinimą, kultūros, mokslo, tyrimų ir dėstymo laisvės puoselėjimą
Universitete. Senato darbas yra suskirstytas į 3 pagrindines veiklos
sritis. Studijų, Mokslo bei Kokybės ir plėtros komitetai nagrinėja savo
veiklos sričiai aktualius klausimus ir išvadas teikia tvirtinti VU
Senatui.

Ataskaitiniu laikotarpiu (nuo 2023-2024 m.m. VU SA ARK iki 2024-2025
m.m. ARK) įvyko 11 Senato posėdžių ir 8 elektroniniai balsavimai. Taip
pat studentų (-čių) atstovai (-ės) dalyvavo dviejose VU Senato
strateginėse sesijose, iškilmingoje Vilniaus universiteto Garbės daktaro
vardo suteikimo ceremonijoje, iškilmingame Senato posėdyje, kurio metu
nauji VU Tarybos nariai perskaitė ir pasirašė įsipareigojimus Vilniaus
universitetui bei 87-ojo Vilniaus universiteto rektoriaus profesoriaus
Rimvydo Petrausko inauguracijos ceremonijoje. Viena iš VU Senato
strateginių sesijų buvo skirta VU SSGG (stiprybių, silpnybių, galimybių
ir grėsmių) analizės finalizavimui, o Gegužės mėnesio strateginėje
sesijoje diskutuota, kaip SSGG sesijos metu išsakytos įžvalgos gali
tapti naujosios VU strategijos ar kitų metų VU Senato darbo plano
dalimi.

Studentų atstovai aktyviai įsitraukė į darbo grupes: Vilniaus
universiteto kamieninio akademinio padalinio pavyzdinių nuostatų
atnaujinimo darbo grupėje, Vilniaus universiteto akademinio
nesąžiningumo prevencijos plano rengimo darbo grupėje, kuri suburta VU
SA iniciatyva. Šių darbo grupių rezultatai (atnaujinti KAP pavyzdiniai
nuostatai bei akademinio nesąžiningumo prevencijos planas) turėtų būti
patvirtinti VU Senate šiais mokslo metais.

Taip pat VU SA inicijavo VU Studijų programų komitetų nuostatų
pakeitimus, kurie šiuo metu yra svarstomi VU Senato Studijų komitete bei
turėtų būti patvirtinti ateinančiame VU Senato posėdyje.

### Studentams (-ėms) aktualiausi Senate svarstyti klausimai

#### Vilniaus universiteto studijuojančiųjų rašto darbų rengimo, gynimo ir kaupimo nuostatų tvirtinimas

priimtuose atnaujintuose nuostatuose atsisakoma
Padalinio rašto darbų tvarkos, taip jo buvusios kompetencijos klausimus
perkeliant į Padalinio metodinius rašto darbų rengimo nurodymus,
patikslinta, jog studijuojančiųjų pasirinkimui siūlomos baigiamųjų darbų
temos (taip pat studentų (-čių) pasiūlytos baigiamųjų darbų temos) turi
būti tvirtinamos studijų programos komitete, o darbų gynimo komisija,
vykdydama savo funkcijas, vadovausis tik šiais nuostatais.

#### Vilniaus universiteto mokslo doktorantūros reglamento tvirtinimas

Reglamentas papildytas nauju XII skyriumi,
apibrėžiančiu tarpkryptinės doktorantūros vykdymą. Tai – svarbus
žingsnis modernių ir lanksčių III-iosios pakopos studijų link.

#### Vilniaus universiteto studijų nuostatų patvirtinimas

Nuostatuose numatytą 15 studijų kreditų skolų
ir (ar) akademinių skolų normą studento (-ės) šalinimui iš Universiteto
padidinta iki didesnės nei 20 studijų kreditų skolų ir (ar) akademinių
skolų kreditų normos, taip siekiant užtikrinti tinkamą studentų
nubyrėjimo nuo studijų Vilniaus universitete valdymą.

#### Dirbtinio intelekto naudojimo Vilniaus universitete gairių patvirtinimas

Gairėse pateiktos rekomendacijos dėl tinkamo
dirbtinio intelekto įrankių pasitelkimo mokslinėje, mokymo(si) veikloje,
siekiant išvengti akademinės etikos, autorystės teisinių normų pažeidimų
ir asmeninės ar konfidencialios informacijos atskleidimo bei aptarti
pagrindiniai įrankiai, naudojami mokymo(si) ir mokslinėje veikloje.

#### Diplomų *Cum Laude* ir *Magna Cum Laude* kriterijų pakeitimai

Detalizuoti kriterijai, kurie atitinka
aukščiausių pasiekimų reikalavimą pretendentams (-ėms) į *Magna Cum
Laude* diplomus, įtrauktas papildomas reikalavimas, kad kamieniniai
padaliniai turi pateikti trumpą pagrindimą dėl absolvento (-ės) veiklos
kokybės ir reikšmingumo bei atsisakyta imperatyvo mokslinės veiklos
rezultatuose nurodyti VU prieskyrą.

#### Rezidentūros studijų reglamento patvirtinimas

Įdiegtas pakopinėmis kompetencijomis grįstas
mokymas, įgalinantis gydytojus (-as) rezidentus (-es) dar rezidentūros
studijų metu vykdyti savarankišką klinikinę veiklą. Reglamente taip pat
įtvirtinta rezidentūros studijų stabdymo galimybė. Detalizuotas ir
rezidento (-ės) profesinės praktikos atlikimas rezidentūros bazėje,
aprašant gydytojų rezidentų (-čių) garantijas, apimančias darbo trukmę,
budėjimų tvarką bei sąveika su rezidentų vadovais ir mentoriais.

#### VU SA atlikto VU studentų (-čių) akademinio nesąžiningumo tyrimo pristatymas bei Vilniaus universiteto akademinio nesąžiningumo prevencijos plano rengimo darbo grupės sudarymas

VU SA atliktas [VU studentų (-čių) akademinio nesąžiningumo tyrimas](https://www.vusa.lt/lt/naujiena/naujas-tyrimas-atskleidzia-akademinio-nesaziningumo-masta-vilniaus-universitete)
buvo pristatytas VU Senato posėdžio metu, sulaukė pozityvių komentarų
bei pastebėjimų. Tyrime išryškėjo poreikis Universitete pasitvirtinti
planą, kuris leistų užtikrinti efektyvią akademinio nesąžiningumo
prevenciją. Šis planas leis Universitetui sistemiškiau ir strategiškiau
veikti akademinio nesąžiningumo prevencijos srityje bei numatys
konkrečius veiksmus, kurių turi imtis tiek kamieniniai akademiniai
padaliniai, tiek įvairios sprendimų priėmimo struktūros.

#### Pristatymas „Doktorantūros studijos: problemos doktorantų (-čių) akimis ir galimi sprendimai"

Pirmą kartą VU Senato posėdyje greta
vicerektorės pranešimo apie doktorantūros studijas Vilniaus universitete
bei Doktorantūros ir podoktorantūros skyriaus vadovės pristatymo apie
Doktorantūros studijų apklausą pranešimą skaitė ir studentų (-čių)
atstovas. Jame iškeltos kertinės problemos, kurias VU SA mato iš
pokalbių su doktorantais (-ėmis) bei su DPS derintos apklausos:
socialiniai santykiai su darbo vadovu(-e); integracijos skirtumai;
finansiniai klausimai (daugiausiai susiję su doktorantūros fondo lėšų
panaudojimu) bei įdarbinamumas Universitete. Be veiklų, kurias vykdo VU
SA siekdama sumažinti šių problemų apimtį (Doktorantų (-čių) vadovų ir
vadovių mokymai, doktorantų (-čių) mentorystė ir pan.), buvo pasiūlyti
galimi problemų sprendimo būdai, kurie išsamiau aprašyti Doktorantų
(-čių) atstovavimo skiltyje. Taip pat buvo priimtas sprendimas
organizuoti atskirą VU Senato posėdį, skirtą aptarti doktorantūros
klausimus.

#### VU studentų (-čių) akimis

Kaip ir kiekvienais metais Senate VU SA Prezidentė pristatė, kaip
Universitetą mato studentai ir studentės. Pristatyme pasidžiaugta
integracijos, studentų (-čių) mokslinės veiklos plėtra, didėjančiu
dėmesiu III pakopos studijoms, tarptautiškumui ir kt. Taip pat trumpai
pasidalinta duomenimis iš pirmakursių integracijos tyrimo I dalies,
iškeltos tobulintinos Universiteto veiklos sritys: praktikų organizavimo
bei atlikimo kokybė, studijų turinio bei dėstymo metodų atnaujinimas,
tarpkryptiškumo plėtra, dėmesio pilietiškumui bei visuomenės atsparumui
didinimas, studijų, paslaugų, informacijos ir infrastruktūros pritaikymo
studentams (-ėms) su negalia, bendrabučių infrastruktūros modernizavimas
ir t.t.

## VU Rektoratas

*Studentų (-čių) atstovė – Klėja Merčaitytė*

Rektoratas yra VU rektoriui patarianti kolegija, svarstanti svarbiausius
VU klausimus, teikianti pastabas ir komentarus iš padalinių
perspektyvos. Rektorato sudėtyje yra VU rektorius, vicerektorius,
prorektoriai, kancleris, kamieninių padalinių vadovai, VU SA prezidentas
ir kiti rektoriaus paskirti nariai.

Ataskaitiniu laikotarpiu Rektorate buvo pristatyt doktorantų (-čių)
apklausos rezultatai, buvo svarstytas VU socialinės partnerystės ir
mokymosi visą gyvenimą programų administravimo tvarkos aprašai, buvo
diskutuota apie dėstytojų priėmimo į pareigas sąlygas ir jas numatantis
tvarkos aprašas. Taip pat aptartos studentų (-čių) įdarbinimo
Universitete plėtros galimybes, svarstyta VU prieskyros (afiliacijos)
naudojimo gairių projektas bei VU darnaus vystymosi tikslų įgyvendinimo
garės ir veiklų plano projektas. Rektorate taip pat turėjome diskusija
dėl VU Ryšių su alumnais palaikymo koncepcijos ir įgyvendinimo plano bei
dėl terminuotų sutarčių sudarymo su vyresniais kaip 65 metų akademiniais
darbuotojais. Išrinkus naująjį VU rektorių buvo pristatyta Rektoriaus
programos principai ir naujos VU strategijos rengimo eiga.

VU SA prezidentė Rektorate įsitraukė į studentams (-ėms) rūpimų klausimų
aptarimą, dalinosi VU SA naujienoms bei pristatė VU SA atlikto
2024–2025 m. m. pirmakursių integracijos tyrimo rezultatus,
akcentuodama rekomendacijas būsimam integracijos proceso sklandumui
užtikrinti.

## Akademinių reikalų prodekanų posėdžiai

*Studentų (-čių) atstovas – Povilas Virbašius*

Akademinių reikalų prodekanų posėdžių metu teikiamos išvados ir
rekomendacijos Universiteto studijų veiklai gerinti. Šiuose posėdžiuose
dalyvauja visi už studijas atsakingi Universiteto kamieninių akademinių
padalinių vadovų pavaduotojai (-os) bei studentų atstovai (-ės).

Ataskaitiniu laikotarpiu vyko 9 posėdžiai, kurių metu buvo aptarti
individualiųjų studijų pasirinkimo, tarptautiškumo, nubyrėjimo
prevencijos, studentų (-čių) priėmimo į Universitetą klausimai bei šių
procesų tendencijos. Taip pat svarstyti VU studijų nuostatų, VU studijų
programų rengimo, vykdymo, ir tobulinimo tvarkos aprašo ir VU studijų
rezultatų įskaitymo tvarkos pakeitimai. VU SA atstovas inicijavo ir
pristatė VU studijų programos komiteto nuostatų pakeitimus, kurie buvo
svarstyti posėdyje. Taip pat apžvelgtos studentų (-čių) pasitenkinimo
semestro studijomis ir absolventų (-čių) apklausos, o VU SA integracijos
proceso reikalų koordinatorė pristatė VU pirmojo kurso studentų (-čių)
integracijos tyrimo I dalies rezultatus. Taip pat peržvelgti VU studijų
kokybės vadovo rodikliai. Posėdžių metu aptarti ir kiti svarbūs
studentams (-ėms) klausimai.

## Atstovavimas VU KAP Tarybose ir SPK

Ataskaitiniu laikotarpiu studentų (-čių) interesai buvo atstovaujami ne
tik centriniu, bet ir VU kamieninių akademinių padalinių mastu – visų
padalinių Tarybose ir skirtingų studijų programų komitetuose veikė
studentų (-čių) atstovai (-ės).

VU KAP Tarybose svarstomi įvairūs klausimai: tvirtina VU KAP veiklos
planą, biudžetą, mokslinių tyrimų kryptis, SPK ir VU KAP komisijų
sudėtis (išskyrus studentų (-čių) atstovus), svarsto naujas studijų
programas bei esamų studijų programų keitimus, vertina mokslinių tyrimų
ir studijų rezultatus. VU KAP Tarybą sudaro VU KAP vadovas (-ė),
dėstytojai (-os), akademinės ir neakademinės bendruomenės nariai (-ės)
bei socialiniai (-ės) partneriai (-ės) ir studentai (-ės).

Studijų programų komitetai (SPK) yra akademiniai studijų programas
koordinuojantys ir jų vykdymą prižiūrintys dariniai. SPK užtikrina
studijų programos tikslų, ugdomų kompetencijų, turinio, metodų ir
studentų (-čių) pasiekimų vertinimų vientisumą ir tobulina studijų
programą analizuodami studentų (-čių), dėstytojų, absolventų (-čių),
socialinių partnerių nuomonę bei kitus studijų programų vykdymo kokybės
rodiklius. SPK sudaro ne mažiau kaip 3 dėstytojai (-os), bent 1
socialinis (-ė) partneris (-ė) ir bent 1 studentų (-čių) atstovas (-ė).

Siekiant užtikrinti ekspertinį studentų (-čių) atstovavimą metų eigoje
atstovams (-ėms) keltos kompetencijos: organizuoti centriniai ir
padalinių mokymai advokacijos temomis, skatintas atstovavimo veiklų
viešinimas padaliniuose, suorganizuotas renginys „Apie atstovavimą iš
pirmų lūpų" siekiant supažindinti studentus (-es) su atstovavimo veikla
ir galimybe tapti studentų (-čių) atstovu (-e), taip pat studentų (-čių)
atstovai (-ės) laikė jiems (-oms) skirtą testą, leidžiantį užtvirtinti
svarbiausias akademines, struktūros žinias. Studentų (-čių) atstovai
(-ės) rinko studentų (-čių) nuomonę (vykdė apklausas, focus grupes
įvairias klausimais), o surinktą informaciją susisteminę pristatė SPK
posėdžių metu. Padalinių atstovų koordinatoriai peržiūrėjo
individualiųjų studijų dalykų (modulių) aprašus (iš viso virš 1100
aprašų) ir identifikavo probleminius aspektus, kuriuos siekta išspręsti.

Šiais metais VU KAP vyko virš 250 studijų programų komitetų posėdžių ir
virš 100 KAP Tarybų posėdžių. Žemiau pateikiama detalesnė VU KAP per
šiuos metus įvykusių Tarybų ir SPK posėdžių statistika bei pagrindiniai
svarstyti klausimai:

### Tarybos posėdžiai

| VU KAP                                               | Tarybos posėdžių skaičius | Svarbiausi svarstyti klausimai                                                                                                                                                                                                                                                                                                                                                   |
|-----------------------------------------------------|---------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Chemijos ir geomokslų fakultetas                     | 11                        |   Naujos Chemijos instituto direktorės tvirtinimas;   Pritarimas darbų teikimui į įvairius konkursus;   Chemijos instituto ir Geomokslų instituto skatinimo tvarkų už aukštus mokslinius pasiekimus tvirtinimas;   Skatinimo už įnašą į studijų kokybę vertinimo formų tvirtinimas.                                                                                              |
| Ekonomikos ir verslo administravimo fakultetas       | 30                        |   Tvirtintos SPK tobulinimo ataskaitos;   Studijų programų pokyčiai;   Sprendžiami studentų (-čių) paramos klausimai.                                                                                                                                                                                                                                                            |
| Fizikos fakultetas                                   | 9                         |   Tvirtintas biudžetas;   Patvirtintas naujas studijų prodekanas;   Atnaujintos SPK sudėtys.                                                                                                                                                                                                                                                                                     |
| Filologijos fakultetas                               | 10                        |   Patvirtintas 2024–2025 VU FLF Tarybos darbo planas;   Sudaryta Tarybos darbo grupė Studijų programų tobulinimui (joje paskirti du studentų (-čių) atstovai (-ės));   Patvirtinti bendri Metodiniai rašto darbų rengimo nurodymai;   Aptartos ir patvirtintos bakalauro bei magistro studijų programų pertvarkos;   Aptarta ir patvirtinta 2024 metų VU FLF veiklos ataskaita.  |
| Filosofijos fakultetas                               | 8                         |   Bakalauro ir magistro studijų programų pakeitimai ir atnaujinimai;   SPK sudėčių pokyčiai;   Tvirtintos Filosofijos fakultete vykdomų BA, MA, PPS studijų metinės kainos;   Įsteigta Edukologijos doktorantūros mokykla;   Įkurtas naujas SPK tarptautinei studijų programai „Tvarumas ir ateities visuomenės“.                                                                |
| Gyvybės mokslų centras                               | 6                         |   VU GMC direktoriaus rinkimai;   VU GMC biudžeto tvirtinimas;   Studijų programų metinės kainos tvirtinimas.                                                                                                                                                                                                                                                                    |
| Istorijos fakultetas                                 | 8                         |   VU IF Dekanės rinkimai;   Istorijos fakulteto rašto darbų metodinių nurodymų aprašo papildymas dėl DI (ne)naudojimo;   Integracijos tyrimo pristatymas.                                                                                                                                                                                                                        |
| Komunikacijos fakultetas                             | 7                         |   Sudarytos ir tvirtintos naujos SPK sudėtys;   Patvirtinti bakalauro ir magistro studijų programų planų pakeitimai;   Tvirtintos naujos metinės studijų kainos.                                                                                                                                                                                                                 |
| Kauno fakultetas                                     | 13                        |   Skatinimo už aukšto lygio mokslo pasiekimus tvarkos aprašo koregavimas;   Mokslų žurnalų redakcinės kolegijos tvirtinimas;   BUS modulių aprašų tvirtinimas;   Tvirtintos naujos metinės studijų kainos.                                                                                                                                                                       |
| Matematikos ir informatikos fakultetas               | 12                        |   Lėšų skirstymas;   Mokslinių darbų teikimai įvairiems projektams;   SPK sudėčių atnaujinimas;   Kandidatūrų akademiniams laipsniams įgytį tvirtinimas;   Naujojo TMI direktoriaus tvirtinimas.                                                                                                                                                                                 |
| Medicinos fakultetas                                 | 11                        |   Rezidentūrų studijų programų vykdymas, kompetencijų įskaitymo tvarka;   Metodinių priemonių patvirtinimas;   Įvesta nauja studentų išvykų į konferencijas finansavimo tvarka;   Atnaujintas stojimo į rezidentūrą konkursinis balas;   Atnaujinta studentų mokslinės veiklos balo skaičiavimo sistema.                                                                         |
| Šiaulių akademija                                    | 7                         |   VU ŠA rašto darbų rengimo ir gynimo tvarkos pakeitimas;   VU ŠA SPK sudėčių pakeitimai;   VU ŠA 2024 m. veiklos ataskaitos tvirtinimas.                                                                                                                                                                                                                                        |
| Tarptautinių santykių ir politikos mokslų institutas | 6                         |   Privalomųjų adaptyvių praktikų nuostatų tvirtinimas;   Dirbtinio intelekto naudojimo deklaracijos formos tvirtinimas;   Patvirtintas strateginis veiklos planas 2025–2030 metams.                                                                                                                                                                                              |
| Teisės fakultetas                                    | 7                         |   Vadovėlių ir mokymo priemonių tvirtinimas;   VU TF skatinimo už įnašą į studijų kokybę, skatinimo už ekspertinę veiklą ir universiteto vardu vykdomą mokslo ir studijų komunikaciją fondų patvirtinimas;   Patvirtintas VU TF BUS dalyko „Europos Sąjungos Žaliasis kursas ir tvarumas“ aprašas.                                                                               |
| Verslo mokykla                                       | 7   | VU VM vardinių stipendijų tvirtinimas;  I ir II pakopos studijų programų komitetų 2024 m. veiklos ataskaitos pristatymas; VU VM studijų tvarkų aprašų tvirtinimas.                                                                                                                                                                                                                                                                                                                                                           |

### SPK posėdžiai

| VU KAP                                               | SPK posėdžių skaičius                             | Svarbiausi svarstyti klausimai                                                                                                                                                                                                                                                                                                                                                                                                                                  |
|------------------------------------------------------|---------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Chemijos ir geomokslų fakultetas                     | 26                                                |  <br>Magistro studentui leista apsiginti darbą nuotoliu dėl stažuotės;<br> <br>Studijų tinklelio pokyčiai (dalykai perkelti į kitą semestrą);<br> <br>Pagerintas dalyko turinys atsižvelgus į studentų apklausą ir iškeltą problemą SPK posėdyje;<br> <br>Dalykų aprašų tvirtinimas.                                                                                                                                                                            |
| Ekonomikos ir verslo administravimo fakultetas       | 30                                                | Dalykų aprašų tvirtinimas; Dėstytojų pokyčiai; Bakalauro ir magistro darbų temų tvirtinimas.                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| Fizikos fakultetas                                   | 15                                                |  <br>Studijų programų tinklelių atnaujinimas;<br> <br>Dėstytojų pokyčiai.                                                                                                                                                                                                                                                                                                                                                                                       |
| Filologijos fakultetas                               | 32                                                |  Studijų programos tinklelio aptarimas;<br> <br>Pokyčiai pasirenkamųjų dalykų sąraše, tvarkaraščio pasikeitimai;<br> <br>MA darbų temų pasirinkimas, senosios MA darbų vertinimo praktikos pokyčiai;<br> <br>Studijų programos reforma (skandinavistika).                                                                                                                                                                                                   |
| Filosofijos fakultetas                               | 35                                                |  <br>Dalykų aprašų tvirtinimas, keičiant esamus arba pridedant pasirenkamuosius/ individualiuosius studijų dalykus;<br> <br>Bakalauro ir magistro darbų temų tvirtinimas;<br> <br>Studijų krūvio ir atitinkamų dalykų peržiūra (magistro studijų kreditų perėjimas prie 5 kartotinio (dalinai išspręstos krūvio netolygumo problemos), bakalauro 4 kurso studentų (-čių) krūvio sumažinimas);<br> <br>Pristatytos VU SA FsF parengtos grįžtamojo ryšio gairės.  |
| Gyvybės mokslų centras                               | 14                                                |  <br>Peržiūrėti ir patvirtinti studijų dalykų aprašai;<br> <br>Surinkta ir posėdžių metu pristatyta studentų (-čių) nuomonė;<br> <br>Peržiūrėtas ir atnaujintas kelių dalykų krūvis (savarankiško darbo ir kontaktinio darbo valandos).                                                                                                                                                                                                                         |
| Istorijos fakultetas                                 | 0 | Ataskaitiniu laikotarpiu posėdžiai nevyko.                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
| Komunikacijos fakultetas                             | 29                                                |  <br>Tvirtinti dalykų aprašai;<br> <br>Svarstytos ir tvirtintos kursinių, bakalauro darbų temos, praktikos vietos;<br> <br>Peržiūrėti ir atnaujinti studijų tinkleliai;<br> <br>Pristatyta studentų (-čių) nuomonė.                                                                                                                                                                                                                                             |
| Kauno fakultetas                                     | 30                                                |  <br>Metodinių nurodymų peržiūra;<br> <br>Bakalauro ir magistro darbų temų tvirtinimas;<br> <br>Studijų programų tinklelių bei minimalių stojimo reikalavimų II pakopai koregavimas;<br> <br>Diskutuota dėl katedrinių gynimų atsisakymo – nuspręsta juos palikti.                                                                                                                                                                                              |
| Matematikos ir informatikos fakultetas               | 16                                                |  <br>Studentų (-čių) grįžtamojo ryšio apklausų apžvalga;<br> <br>Naujų dalykų tvirtinimas;<br> <br>Aptartas dirbtinio intelekto naudojimas;<br> <br>Dalykų vykdymo pakeitimai (vykdomi anglų kalba, dėstytojų pasikeitimai ir kt.)                                                                                                                                                                                                                              |
| Medicinos fakultetas                                 | 48                                                |  <br>Optimizuoti studijų tinkleliai ir atnaujinti studijų dalykų aprašai;<br> <br>Pagerinta praktikų organizavimo tvarka ir pasiekimų sekimas;<br> <br>Įvesta konferencijų dalyvavimo finansavimo tvarka;<br> <br>Patobulinta mokslinės veiklos balo skaičiavimo metodika.                                                                                                                                                                                      |
| Šiaulių akademija                                    | 0                           | Ataskaitiniu laikotarpiu posėdžiai nevyko.                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| Tarptautinių santykių ir politikos mokslų institutas | 12                                                |  <br>Studentų (-čių) grįžtamojo ryšio aptarimas;<br> <br>Programų struktūrinis pakeitimas;<br> <br>Privalomoji praktika;<br> <br>Individualiųjų studijų kursų tvirtinimas.                                                                                                                                                                                                                                                                                      |
| Teisės fakultetas                                    | 4                                                 |  <br>Atnaujinta VU TF kursinių ir baigiamųjų darbų rengimo, gynimo, vertinimo ir saugojimo tvarka;<br> <br>Patvirtinta nauja specializacija „Rinkų reguliavimas ir atitiktis“, nuspręsta nuo 2025 m. pavasario įtraukti specializaciją į bendrą pasirenkamų specializacijų sąrašą.<br> <br>Tvirtinti nauji individualiųjų studijų dalykai.                                                                                                                      |
| Verslo mokykla                                       | 4                           |  Metodinių nurodymų peržiūra ir tvirtinimas; Dėstytojų pokyčiai; Bakalauro ir magistro darbų temų tvirtinimas.                                                                                                                                                                                                                                                                                                                                                                                                                                          |
## Senato komisijos

### VU Centrinė ginčų nagrinėjimo komisija

*Studentų (-čių) atstovai (-ės) – Vygintas Bartusevičius, Vismantas Daujotas, Samanta Valiušaitytė.*

**Komisija nagrinėja** skundus dėl padalinių ginčų nagrinėjimo komisijų
sprendimų teisėtumo ir pagrįstumo, neveikimo ar sprendimų nevykdymo. Ši
nuostata netaikoma skundams dėl apeliacijų dėl galutinio studijų
pasiekimų įvertinimo. Taip pat nagrinėjami pareiškimai dėl ginčų,
kylančių tarp studentų (-čių) ir Centrinės administracijos darbuotojų,
jei šie ginčai susiję su mokslo ar studijų veikla. Nei akademinės
etikos, nei darbo santykių ginčai į šią kategoriją neįtraukiami. Be to,
Komisija nagrinėja kitus su mokslo ir studijų veikla susijusius skundus,
kurių pagal kompetenciją nenagrinėja padalinių ginčų nagrinėjimo
komisijos ar kiti Universitete veikiantys dariniai.

Ataskaitiniu laikotarpiu įvyko 4 posėdžiai, kurių metu išnagrinėti 9
pareiškimai.

**Ataskaitiniu laikotarpiu įvyko 4 posėdžiai, kurių metu išnagrinėti 9
pareiškimai.** Skunduose daugiausia buvo keliami klausimai dėl vertinimo
skaidrumo, grįžtamojo ryšio apie atsiskaitymus prieinamumo, baigiamųjų
darbų gynimo procedūrų, praktikos organizavimo bei individualių studijų
rezultatų pripažinimo. Dalis pareiškimų buvo atmesta kaip nepatenkanti
Komisijos kompetencijos ribų arba pateikta nesilaikant nustatytos
tvarkos, o kai kuriais atvejais skundai buvo perduoti nagrinėti kitiems
Universiteto dariniams.

### VU Centrinė akademinės etikos komisija

*Studentų atstovai – Eglė Gaučaitė, Ugnė Šcesnovičiūtė, Eivinas Zableckas.*

Komisija nagrinėja akademinės bendruomenės narių skundus dėl akademinės
etikos pažeidimų.

Ataskaitiniu laikotarpiu vyko 6 komisijos posėdžiai, kuriuose nagrinėti
8 atvejai. Ataskaitiniu laikotarpiu taip pat vyko VU centrinės
akademinės etikos komisijos susitikimas su akademinės etikos ir
procedūrų kontroliere bei LR akademinės etikos ir procedūrų
kontrolieriaus tarnybos inicijuotas susitikimas su Lietuvos aukštųjų
mokyklų akademinės etikos komitetais ir komisijomis.

### VU Akademinio protokolo komisija

*Studentų (-čių) atstovai – Anelė Dromantaitė, Povilas Virbašius.*

VU Akademinio protokolo komisija yra atsakinga už VU vykstančių
ceremonijų tvarką, Universiteto atributikos ir tradicijų puoselėjimą.

Ataskaitiniu laikotarpiu komisijos posėdžių nevyko, tačiau elektroninių
ryšių priemonėmis svarstyti klausimai dėl VU akademiniuose renginiuose
vartojamos lotynų kalbos ir jos pritaikymo siekiant tiksliai atspindėti
lytį Doctor honoris causa diplomuose ir ceremonijoje. Taip pat aptartas
klausimas dėl užsiėmimų ir paskaitų vykdymą VU Rektoriaus inauguracijos
metu pagal VU akademinių apeigų protokolo 3 straipsnį.

### VU Centrinė rinkimų komisija

*Studentų (-čių) atstovai (-ės) – Vismantas Daujotas ir Agnė Dirmantaitė.*

**Vilniaus universiteto Centrinė rinkimų komisija** užtikrina skaidrų ir
tinkamai organizuotą Universiteto valdymo organų rinkimų procesą.
Komisija organizuoja ir vykdo Senato (išskyrus studentų (-čių) atstovus
(-es)) bei Tarybos narių rinkimus, taip pat viešą konkursą Rektoriaus
pareigoms eiti. Ji registruoja visus išrinktus ar paskirtus Senato ir
Tarybos narius, nustato Rektoriaus rinkimų rezultatus bei tvirtina
rinkimų dokumentų formas. Komisijos funkcijoms taip pat priskiriamas
kandidatų (-čių) tinkamumo vertinimas, rinkimų teisę turinčių darbuotojų
sąrašų sudarymas, kamieninių akademinių padalinių rinkimų komisijų
tvirtinimas, rinkimų datų ir procedūrų skelbimas bei jų organizacinė
priežiūra. Komisija turi teisę kreiptis į kandidatus (-es) ar
Universiteto padalinius dėl papildomos informacijos ir dokumentų,
reikalingų sprendimų priėmimui. Esant poreikiui, teikia Senatui siūlymus
dėl rinkimų procedūras reglamentuojančių dokumentų tobulinimo ir
rūpinasi rinkimų organizavimo kokybe.

**Ataskaitiniu laikotarpiu vyko 11 Centrinės rinkimų komisijos posėdžių,
iš kurių 8 buvo surengti nuotoliniu būdu.** Posėdžių metu svarstyti ir
tvirtinti įvairūs klausimai, susiję su Universiteto valdymo organų
rinkimų organizavimu ir eiga.

Komisija registravo kandidatus (-es) į Universiteto Tarybos narius, taip
pat kandidatus (-es) į laisvas Senato nario vietas Ekonomikos ir verslo
administravimo bei Fizikos fakultetuose. Taip pat buvo svarstytas
kandidato į Rektoriaus pareigas registravimas, įvertintas jo atitikimas
nustatytiems reikalavimams.

Tvirtinti rinkimų grafikai, preliminarūs ir galutiniai rinkėjų sąrašai,
balsavimo datos, laikai bei vietos. Taip pat buvo patvirtintos balsavimo
dokumentų formos – biuleteniai, išdavimo lapai ir rinkimų komisijų
protokolai.

Komisija patvirtino Universiteto Tarybos rinkimų (įskaitant antrąjį
turą) bei rinkimų į laisvas Senato narių vietas rezultatus.

### VU Emeritūros, afiliacijos ir garbės vardų komisija

*Studentų (-čių) atstovė – Julija Jarutytė*

Komisija svarsto ir VU Senatui teikia tvirtinti kandidatūras VU
profesoriaus emerito, afilijuotojo profesoriaus, docento, mokslo
darbuotojo ir garbės daktaro, alumno ar mecenato vardams gauti.

Ataskaitiniu laikotarpiu vyko 2 posėdžiai, kuriuose buvo apsvarstytos 6
kandidatūros profesoriaus emerito (patvirtintos 4), 2 kandidatūros
afilijuotojo profesoriaus (patvirtintos 2), 4 kandidatūros afilijuotojo
mokslininko (patvirtintos 3) vardams suteikti, o Vilniaus universiteto
mecenato vardai suteikti Angelei Matildei ir Sigitui Pranui Kazlauskams
bei Gediminui Vaitiekūnui.

## Kitos komisijos

### VU Edukacinių iniciatyvų komisija

Edukacinių iniciatyvų komisija svarsto, tvirtina ir skiria lėšas dėstytojų iniciatyvoms, skirtoms gerinti studijų procesą, dalykus, jų dėstymą, didinti studentų (-čių) įtraukimą bei įgyvendinti inovatyvias edukacines idėjas, kurioms ne visada pakanka standartinių resursų. 

Šiais metais komisijoje patvirtinta 11 naujų paraiškų edukacinėms iniciatyvoms įgyvendinti.  

### VU Studijų kokybės komisija

*Studentų (-čių) atstovė – Julija Jarutytė*

Komisija svarsto po studijų krypties išorinio vertinimo išvadų ir
akreditavimo parengtus krypčių tobulinimo planus.

Ataskaitiniu laikotarpiu rekomendacijos pateiktos ir apsvarstyti 11
skirtingų krypčių studijų tobulinimo planai (pritarta 11). Svarstyti šių
krypčių studijų tobulinimo planai:

- Visuomeninė geografija (CHGF)
- Vadyba (EVAF, KNF, ŠA, VM)
- Teisė (TF)
- Paveldo studijos (IF)
- Visuomenės sveikata (MF)
- Filologija pagal kalbą (užsienio kalbos) (FLF, ŠA)
- Filologija pagal kalbą (lietuvių kalba) (FLF, KNF)
- Odontologija (MF)
- Molekulinė biologija (GMC)
- Biofizika (GMC)
- Komunikacija (KF)

### VU Centrinė priėmimo komisija

*Studentų (-čių) atstovė – Klėja Merčaitytė*

Komisija svarsto ir teikia Universiteto rektoriui tvirtinti aukščiausio
lygmens darbuotojų – profesorių ir vyriausiųjų mokslo darbuotojų --
kandidatūras akademinėms pareigoms užimti.

Atsižvelgusi į pateiktas studentų (-čių) apklausas, pedagogines
kompetencijas dėstymo patirtis ir planuojamą akademinę veiklą, VU SA
Prezidentė, remdamasi aukščiau išvardytais duomenimis, balsavo prieš
arba už kandidatų (-čių) kandidatūras. Pagrindiniai rodikliai
netvirtinti kandidatūrų – pedagoginių kompetencijų stoka, studentų
(-čių) atsiliepimai dėl pedagoginių kompetencijų ar akademinės etikos
stokos.

Centrinė priėmimo komisija iš viso apsvarstė 66 kandidatūras. Teikiamų
kandidatūrų skaičius einamuoju laiku nėra galutinis, kadangi komisijos
veikla vis dar yra vykdoma.

### VU Profesoriaus ir docento pedagoginių vardų teikimo komisija

*Studentų (-čių) atstovas – Povilas Virbašius*

Komisija svarsto ir teikia Senatui tvirtinti dėstytojų kandidatūras dėl
pedagoginių vardų suteikimo.

Ataskaitiniu laikotarpiu vyko vienas komisijos posėdis, kurio metu buvo
svarstomi kandidatai VU profesorių ir docentų pedagoginiams vardams
teikti. VU Senatui komisijos vardu buvo siūloma suteikti pedagoginį
vardą 30 VU akademinių darbuotojų (18 docentų ir 12 profesorių).

### VU partnerystės profesorių ir partnerystės docentų skyrimo patariamasis komitetas

*Studentų (-čių) atstovė – Klėja Merčaitytė*

Komitetas teikia nuomonę VU rektoriui dėl Universiteto partnerystės profesorių ir partnerystės docentų pareigybių suteikimo. Šios pareigybės leidžia paskaitas Vilniaus universitete dėstyti žymiems Lietuvos verslo atstovams, diplomatams ir kitiems savo sričių specialistams, užimantiems vadovaujamas pareigas ar turintiems didžiulę praktinio darbo patirtį. 

Ataskaitiniu laikotarpiu 34 pretendentai buvo įvertinti kaip atitinkantys partnerystės profesoriams ir partnerystės docentams keliamus reikalavimus ir buvo pasiūlyta juos skirti į šias pareigas. 

### VU Geriausių dėstytojų pripažinimo komisija

*Studentų (-čių) atstovas – Povilas Virbašius*

Komisija svarsto kandidatų (-čių) veiklą ir teikia Rektoriui
rekomendacijas dėl kandidatų (-čių) pripažinimo geriausiais (-omis) metų
dėstytojais (-omis). Vilniaus universiteto studentų (-čių) siūlomų
dėstytojų kandidatūras Komisijai svarstyti teikia kamieninio akademinio
padalinio administracija kartu su VU SA padaliniu. Ataskaitiniu
laikotarpiu vyko 1 komisijos posėdis. Posėdžio metu iš padalinių siūlytų
kandidatų (-čių) išrinkta 15 geriausių Universiteto dėstytojų, kurie
(-os) vėliau buvo apdovanoti (-os) Rektoriaus premija.

Geriausi (-ios) 2024 m. dėstytojai ir dėstytojos:

- Chemijos ir geomokslų fakulteto docentas dr. Andrius BALČIŪNAS,
- Ekonomikos ir verslo administravimo fakulteto docentė dr. Rasa PAULIENĖ,
- Filologijos fakulteto asistentas dr. Tomas RIKLIUS,
- Filosofijos fakulteto lektorius Aiden WOJCIECHOWICZ,
- Fizikos fakulteto asistentas dr. Dovydas BANEVIČIUS,
- Gyvybės mokslų centro asistentė dr. Irena NEDVECKYTĖ,
- Istorijos fakulteto asistentas dr. Ryšard GAIDIS,
- Kauno fakulteto docentė dr. Skirmantė BIRŽIETIENĖ,
- Komunikacijos fakulteto asistentė dr. Rūta KUPETYTĖ,
- Matematikos ir informatikos fakulteto docentas dr. Gintautas BAREIKIS,
- Medicinos fakulteto docentė dr. Asta MAŽEIKIENĖ,
- Šiaulių akademijos docentė dr. Laima TOMĖNIENĖ,
- Tarptautinių santykių ir politikos mokslų instituto asistentė dr. Ieva GIEDRAITYTĖ,
- Teisės fakulteto asistentė dr. Elena MASNEVAITĖ,
- Verslo mokyklos docentė dr. Danguolė OŽELIENĖ.

### VU Socialinių stipendijų skirstymo komisija

*Studentų (-čių) atstovai (-ės) – Viktorija Amankavičiūtė ir Lukas Jakonis*

Socialinė stipendija skiriama pirmosios pakopos ir vientisųjų studijų
studentams (-ėms), studijuojantiems (-čioms) ne pirmame studijų kurse,
taip pat antrosios pakopos ir profesinių pedagogikos studijų studentams
(-ėms), studijuojantiems (-čioms) ne pirmame studijų semestre,
susiduriantiems(-čioms) su socialiniais sunkumais. Studentams(-ėms)
ataskaitiniu periodu buvo paskirtos 105 stipendijos.

### VU Visuomeninės veiklos stipendijų skirstymo komisija

*Studentų (-čių) atstovai (-ės) – Justas Lebedevas, Jūra Subačiūtė.*

Visuomeninės veiklos stipendija skiriama studentams (-ėms) už
individualius pasiekimus, prisidedančius prie ateities visuomenės
kūrimo, visuomenės problemų sprendimo, Universiteto strateginiame
veiklos plane numatytų tikslų įgyvendinimo bei kitus Universiteto vardą
garsinančius pasiekimus.

Ataskaitiniu laikotarpiu vyko 4 posėdžiai. Jų metu buvo aptariama, kaip
bus vertinamos gautos paraiškos, o po įvertintų paraiškų savarankiškai
buvo vykdomi bendri aptarimai bei, jeigu reikėdavo, pervertinimai.
Ataskaitiniu laikotarpiu vyko du stipendijų skirstymai. Rudens semestre
buvo paskirstyta 950 BSI po 55 eurus (t.y. 52 250 eurų) vertės
stipendijų. Šį pavasarį paskirstyta 742 BSI po 70 eurų (t.y. 51 940
eurų) vertės stipendijų. Svarbu atkreipti dėmesį, kad atsiradus naujai
stipendijai už sportinius pasiekimus šį pavasarį dalis paraiškų nebuvo
vertinama.

### VU stipendijų už mokslinius pasiekimus skirstymo komisija

*Studentų (-čių) atstovai (-ės) – Liepa Burneikaitė, Domantas Klumbys*

Stipendija už mokslinius pasiekimus skiriama brandžia moksline veikla
pasižymintiems pirmosios, antrosios pakopų, vientisųjų, profesinių
pedagogikos ir rezidentūros studijų studentams (-ėms) už dalyvavimą
konferencijose, moksliniuose tyrimuose bei kitoje mokslo veikloje.

Stipendijų skirstymo komisija ataskaitiniu laikotarpiu įvykdė 2
nuotolinius posėdžius, kurių metu buvo paskirstyta 28 000 eurų (480 BSI)
vertės stipendijų. Tiksliųjų mokslų srityje paskirstyta 377 BSI, o
socialinių ir humanitarinių mokslų srityje – 23 BSI. Iš viso
stipendijos paskirtos 47-iems studentams (-ėms).

### Tarpkryptinių studijų ekspertų komisija

*Studentų (-čių) atstovė – Samanta Valiušaitytė*

VU Tarpkryptinių studijų komisija, remiantis VU Tarpkryptinių studijų
koncepcija, svarsto tarpkryptinių studijų dalykus (modulius), jų aprašus
bei vykdo jų kokybės stebėseną (jei dalykas (modulis) vykdomas kaip
individualiųjų studijų dalis). Tarpkryptinių studijų dalykus (modulius)
gali rengti ir įgyvendinti viena(-s) dėstytoja(-s) ar dėstytojų grupė
pagal paskelbtus kvietimus teikti paraiškas ir gauti numatytą
finansavimą.

Ataskaitiniu laikotarpiu įvyko du posėdžiai ir vienas nuotolinis
balsavimas. Posėdžių metu komisija svarstė 6 paraiškas, iš kurių 3 buvo
grąžintos tikslinti (iš kurių viena vėliau buvo patvirtinta), taip pat
tvirtinti 5 dalykų (modulių) aprašai, iš kurių 4 patvirtinti ir 1
grąžintas tikslinimui. Nuotolinio balsavimo metu svarstyta ir
patvirtinta 1 patikslinta paraiška bei 3 dalykų aprašai.

### VU studijų tarptautiškumo iniciatyvų komisija

*Studentų (-čių) atstovė – Uršulė Barkauskaitė*

Komisija vertina pateiktų tarptautinių iniciatyvų paraiškų atitikimą
tarptautiškumo fondo tikslams ir svarsto lėšų skyrimą toms iniciatyvoms
įgyvendinti.

Šiais metais Ataskaitiniu laikotarpiu vyko 2 nuotoliniai posėdžiai:
lapkričio mėnesio posėdžio metu nagrinėta 13 paraiškų, o kovo mėnesį
nagrinėtos 34 paraiškos. Posėdžių metu taip pat diskuotuota apie
organizuojamų tarptautinių iniciatyvų pobūdį ir globalių kompetencijų
plėtrą studentams (-ėms) bei dėstytojams (-oms), kas iškėlė bendrą
diskusiją apie tarpkultūrinių veiklų supratimą Vilniaus universitete ir
jų skatinimo mechanizmus.

### VU Diskriminacijos, priekabiavimo, seksualinio priekabiavimo, smurto ir persekiojimo atvejų nagrinėjimo komisija

*Studentų (-čių) atstovė – Klėja Merčaitytė*

Komisija, vadovaudamasi VU Diskriminacijos, priekabiavimo, seksualinio
priekabiavimo, smurto ir persekiojimo atvejų nagrinėjimo tvarkos aprašu,
nagrinėja gautus pranešimus.

Per ataskaitinį laikotarpį komisija turėjo 8 posėdžius, buvo nagrinėti 4
pranešimai.

## Stipendijų komisijos

### VU 450-mečio stipendija

*Studentų (-čių) atstovai – Lukas Jakonis ir Deivydas Mickus*

VU 450-mečio stipendija – Vilniaus universiteto įsteigta speciali
stipendija, skirta būsimiems (-oms) pirmosios pakopos ir vientisųjų
studijų programų studentams (-ėms) iš socialiai pažeidžiamų šeimų.
Siekiant mažinti opią socialinės atskirties problemą Lietuvoje bei
didinti universitetinių studijų prieinamumą, pirmuosius studijų metus –
nuo rugsėjo iki birželio mėnesio – mokama 300 eurų per mėnesį
stipendija, finansų stokojantiems (-čioms) studentams (-ėms).

Ataskaitiniu laikotarpiu įvyko 1 posėdis, kurio metu buvo paskirtos 4
Universiteto socialinių partnerių įsteigtos stipendijos bei 125
Universiteto suteikiamos stipendijos.

### VU bendruomenės paramos stipendijų skirstymo komisija

*Studentų (-čių) atstovės – Roberta Kirkliauskaitė, Lukrecija Kociūtė, Elzė Masiulytė.*

Bendruomenės paramos stipendija skiriama studentams (-ėms) dėl staigaus
finansinės padėties pablogėjimo, artimojo ligos ar mirties, stichinės ar
kitos nelaimės, taip pat kitais išskirtiniais atvejais, kurie
reikšmingai paveikia studento (-ės) finansinę padėtį.

Ataskaitiniu laikotarpiu įvyko 3 posėdžiai, kurių metu buvo nagrinėjami
pateikti prašymai ir sprendžiama dėl stipendijų skyrimo. Sprendimai buvo
priimami vadovaujantis Vilniaus universiteto stipendijų nuostatais bei
patvirtintais Bendruomenės paramos stipendijų skyrimo kriterijais.

Skirtų stipendijų dydžiai svyravo, atsižvelgiant į pateiktus dokumentus
ir situacijos sudėtingumą. Stipendijos skirtos ne tik dėl finansinių
sunkumų, bet ir dėl ligos, netekčių, nelaimių ir kitų individualių
aplinkybių.

Iš viso per metus stipendijos buvo paskirtos 57 asmenims, o bendra
paskirta suma sudarė 588 BSI.

### Kanados lietuvių fondo Eileen ir Vincent Kadis stipendijų skirstymo komisija

*Studentų (-čių) atstovė – Eglė Lukauskaitė*

Stipendijos tikslas – skatinti pažangius socialiai remtinus
Universiteto Gyvybės mokslų centro, Chemijos ir geomokslų fakulteto ir
Medicinos fakulteto studentus(-es), studijuojančius(-ias) chemijos,
biochemijos, mikrobiologijos ir medicinos studijų programose siekti
geresnių studijų rezultatų, domėtis mokslo naujovėmis ir dalyvauti
moksliniuose tyrimuose.

Ataskaitiniu laikotarpiu vyko vienas posėdis, kurio metus paskirtos trys
vardinės stipendijos.

### VU Lietuvos Didžiosios Kunigaikštystės stipendijų skirstymo komisija

*Studentų (-čių) atstovas – Vismantas Daujotas*

**Lietuvos Didžiosios Kunigaikštystės (LDK) stipendija** skiriamos
ukrainiečiams (-ėms), stojantiems (-čioms) į Vilniaus universitetą,
siekiant padėti padengti jų pragyvenimo išlaidas pirmųjų studijų metų
metu.

Nuo 2024 m. liepos 1 d. įvyko vienas Centrinės komisijos posėdis, kurio
metu buvo paskirstytos LDK stipendijos. Stipendijas gavo 25 studentai ir
studentės: 21 bakalauro ir vientisųjų studijų programų studentas (-ė)
bei 4 magistrantūros studijų studentai (-ės).

## Darbo grupės

### VU emocinės gerovės darbo grupė

*Studentų (-čių) atstovės – Klėja Merčaitytė ir Livija Trakelytė*

VU Emocinės gerovės darbo grupė, skirta Emocinės gerovės programos
planavimui VU. Grupėje pateikti pasiūlymai dėl studentų (-čių)
įsidarbinimo Vilniaus universitete galimybių, vaiko bei maldos ir
ramybės kambarių įrengimo, komunikacijos su studentais (-ėmis) bei jų
pasiekiamumo gerinimo, psichologinių konsultacijų registracijos sistemos
naujinimo bei asmenų vardų, atitinkančių jų lytinę tapatybę, naudojimo.
Iš viso ataskaitiniu laikotarpiu įvyko 2 susitikimai.

### VU jaunimo psichikos sveikatos ekspertų grupė

*Studentų (-čių) atstovės – Klėja Merčaitytė ir Livija Trakelytė*

VU Psichotraumatologijos centro jaunimo psichikos sveikatos ekspertų
grupėje aptarti susitikimų su nešališkomis patarėjų grupėmis bei
preliminarius pilotinio streso mažinimo programos „Sija", skirtos
jaunimui, tinkamumo tyrimo rezultatai. Taip pat teikti siūlymai dėl
programos „Sija" galimos komunikacijos strategijos pagrindiniam tyrimui
vykdymo. Iš viso ataskaitiniu laikotarpiu įvyko 2 susitikimai.

### Darnaus vystymosi Universitetui rengimo DG

*Studentų (-čių) atstovė - Dominyka Goldbergaitė* 

Per ataskaitinį laikotarpį darbo grupė parengė galutines VU darnaus vystymosi tikslų įgyvendinimo gaires ir veiklų plano projektą. Dokumentas buvo svarstytas VU Tarybos posėdyje.  

Planas numato sistemingą Universiteto darbą siekiant užtikrinti tvarius bendruomenės vystymo, infrastruktūros pritaikymo, sprendimų priėmėjų, studijų proceso optimizavimo sprendimus. Šiais metais pagaliau buvo padėtas stiprus pamatas, laukiama dokumento patvirtinimo.

### VU dėstytojų pedagoginių kompetencijų sistemos tobulinimo DG

*Studentų (-čių) atstovas – Povilas Virbašius*

Europos Universitetų asociacijos inicijuota mokymosi ir mokymo teminė
tarpusavio grupė kasmet suburia atrinktų EUA narių universitetų grupę,
kad aptartų ir išnagrinėtų mokymosi ir mokymo organizavimo ir
įgyvendinimo instituciniu lygmeniu praktiką bei įgytą patirtį. Jos taip
pat nustato gerosios patirties pavyzdžius tam tikra tema. Šiais metais
Vilniaus universitetas ir jo administracijos ir studentų (-čių) atstovai
(-ės) dalyvauja darbo grupėje skirtoje nagrinėti pavyzdžius ir parengti
rekomendacijas personalo kvalifikacijos tobulinimo kokybės ir poveikio
užtikrinimo mokymo srityje. Ši grupė nagrinėja, kaip galima panaudoti
duomenis, įskaitant institucinius tyrimus, kolegų (-ių) ir studentų
(-čių) atsiliepimus, siekiant įvertinti įvairių formų personalo
tobulinimo poveikį ir kaip personalo tobulinimas veikia institucinę
mokymo kultūrą. Grupė nustatys pagrindinius rodiklius, pagal kuriuos bus
vertinama, kaip personalo tobulinimo veikla gerina studentų (-čių)
mokymosi rezultatus. Ji taip pat pasiūlys būdų, kaip juos sustiprinti ir
tinkamai panaudoti.

## III pakopos studentų (-čių) atstovavimas

Ataskaitinių laikotarpiu ir toliau aktyviai dirbta ties trečiosios
pakopos studentų (-čių) atstovavimu. Šiuo laikotarpiu įvyko trys
susitikimai su VU SA doktorantų (-čių) darbo grupe su kuria aptarėme
svarbius klausimus: doktorantų (-čių) įdarbinamumo VU situaciją,
doktorantų (-čių) integracijos tobulinimo poreikį, stipendijų
indeksavimo klausimą, derinome kasmetinės DPS vykdomos III pakopos
studentų (-čių) apklausos klausimus ir pan. Taip pat kadencijos
pradžioje (bei jos eigoje) išryškėjo tris pagrindines kryptis, ties
kuriomis dirbome šiemet: santykių su vadovu (-e) gerinimas, integracijos
proceso tobulinimas bei doktorantų (-čių) finansų panaudojimo ir
įdarbinamumo klausimas. Žemiau surašyti pagrindiniai aspektai ir
įvykdyti darbai pagal nurodytas kryptis.

**Santykių su vadovu (-e) gerinimas**. Jau praeitais metais indikavome,
kad VU stokojama mokymų, tikslingai orientuotų į doktorantų (-čių)
vadovus ir vadoves. Šiemet suorganizavome dvejus tokio tipo mokymus, iš
kurių pirmi buvo orientuoti į tų vadovų (-ių), kurie turi pirmą
doktorantą (-ę), kompetencijų kėlimą, o antri buvo skirti
tarpkryptiškumo doktorantūroje temai. Pirmuose mokymuose sulaukėme
beveik 40-ies dalyvių, o antruose dalyvavo 11 vadovų ir vadovių. Abu
mokymai susilaukė teigiamų atsiliepimų, juos planuojame organizuoti ir
ateinančiais mokslo metais kitomis aktualiomis temomis.

**Integracijos proceso tobulinimas**. Akivaizdu, kad palyginti su I ir
II studijų pakopomis III pakopos studentų (-čių) integracija vis dar
šlubuoja ir turi būti tobulinama. Todėl dar mokslo metų pradžioje,
mokslo prodekanų susitikimo metu, išsakėme poreikį bei rekomendacijas,
kaip kamieniniai akademiniai padaliniai galėtų tikslingiau įvesti naujai
įstojusius doktorantus (-es) į studijų procesą. Prisidėjome ir prie
centrinės doktorantų (-čių) integracijos dienos organizavimo (apie tai
galite plačiau paskaityti skiltyje „III pakopos integracija"). Kitais
mokslo metais pradės veikti doktorantų (-čių) mentorystės iniciatyva,
kurios tikslas: sukurti tęstinį mentorystės ryšį tarp vyresnių
doktorantų (-čių) ar jaunų mokslų daktarų (-ių) ir jaunesnių (tarp jų ir
pirmo kurso) doktorantų (-čių), suteikiant jiems (-oms) akademinę,
administracinę ir socialinę pagalbą. Taip pat liepą planuojame ir
tarpkryptinį doktorantų (-čių) simpoziumą, kurio metu doktorantai (-ės)
ne tik galės užmegzti naujus ryšius, bet ir susipažins su naujausiomis
tarpkryptinių tyrimų tendencijomis.

**Doktorantų (-čių) finansų panaudojimo ir įdarbinamumo klausimas**.
Tiek iš pokalbių su VU SA doktorantų (-čių) darbo grupelės nariais
(-ėmis), tiek iš šių metų doktorantų (-čių) apklausos rezultatų
akivaizdu, jog finansų (doktorantūros fondo) panaudojimas bei
įdarbinamumas universitete tebėra gana svarbios, dėmesio reikalaujančios
temos. Didžioji dauguma doktorantų (-čių) doktorantūros fondo lėšų
neišnaudoja pilnai arba išvis jų nepanaudoja, o dalis doktorantų (-čių)
išvis nežino, kas yra doktorantūros studijų fondas. Šios aplinkybės
įtakoja ir tai, kad doktorantų (-čių) judumo rodikliai yra gana prasti.
Taip pat matomos problemos ir III-iosios pakopos studentų (-čių)
įdarbinamumo srityje: yra neapmokestinamos papildomos bei su
doktorantūros studijomis nesusijusios veiklos, dalis studentų (-čių)
nori dirbti universitete, bet VU tam nesudaromos sąlygos. Todėl tiek
vasario mėnesio Senato posėdyje, tiek kovo mėnesio mokslo prodekanų
posėdžio metu šios problematikos buvo pristatytos ir pateikti atitinkami
pasiūlymai: išsamiai informuoti doktorantus (-es) apie studijų fondą, jo
dydį ir panaudojimo galimybes, skatinti doktorantus (-es) išnaudoti
lėšas bei išnaudoti galimybes doktorantus (-es) įdarbinti projektinėse
veiklose.

Verta pabrėžti, kad šiemet pirmą kartą Senato posėdžio metu studentų
(-čių) atstovas pristatė anksčiau paminėtas problemas bei galimus jų
sprendimo būdus: be jau minėtų pasiūlymų finansų panaudojimo ir
įdarbinamumo klausimais pabrėžtas poreikis vykdyti nuoseklesnę,
pilnavertiškesnę doktorantų (-čių) integraciją padaliniuose bei vadovams
(-ėms) aktyviau dalyvauti tikslingai į juos orientuotuose mokymuose.
Didėjantis dėmesys III-ios pakopoms studijoms tikrai džiugina ir manome,
kad tai yra be galo svarbu siekiant kurti vieningesnę, darnesnę bei visų
poreikius atliepiančią akademinę bendruomenę.

<!-- <div class="mb-8"> -->
<!--   <h3 class="text-lg font-semibold mb-2">Studentų (-čių) atstovai (-ės) VU Senate (2024 m. birželio 7 d. – 2024 m. rugsėjo 20 d.)</h3> -->
<!---->
<!--   <div class="flex items-center gap-4 mb-4"> -->
<!--     <MultiPersonAvatar  -->
<!--       :people="firstTermPeople"  -->
<!--       size="small"  -->
<!--       :showTooltip="true" -->
<!--     /> -->
<!--     <span class="text-sm text-muted-foreground ml-2">({{ firstTermNames.length }} atstovai)</span> -->
<!--   </div> -->
<!---->
<!--   <p class="text-sm mt-2 text-muted-foreground">{{ senateFirstTermText }}</p> -->
<!-- </div> -->
<!---->
<!-- <div class="mb-8"> -->
<!--   <h3 class="text-lg font-semibold mb-2">Studentų (-čių) atstovai (-ės) VU Senate (nuo 2024 m. rugsėjo 20 d. iki dabar)</h3> -->
<!---->
<!--   <div class="flex items-center gap-4 mb-4"> -->
<!--     <MultiPersonAvatar  -->
<!--       :people="secondTermPeople"  -->
<!--       size="small"  -->
<!--       :showTooltip="true" -->
<!--     /> -->
<!--     <span class="text-sm text-muted-foreground ml-2">({{ secondTermNames.length }} atstovai)</span> -->
<!--   </div> -->
<!---->
<!--   <p class="text-sm mt-2 text-muted-foreground">{{ senateSecondTermText }}</p> -->
<!-- </div> -->
<!---->
<!-- <div class="bg-gradient-to-br from-amber-500/10 via-white to-amber-500/5 dark:from-amber-900/20 dark:via-gray-800 dark:to-amber-900/10 p-6 rounded-xl shadow-md"> -->
<!--   <h3 class="text-xl font-bold mb-4">Apie VU Senatą</h3> -->
<!--   <p>VU Senatas – Universiteto valdymo organas, sudarytas iš VU akademinės bendruomenės narių. Senatas yra atsakingas už studijų kokybės priežiūrą ir gerinimą, kultūros, mokslo, tyrimų ir dėstymo laisvės puoselėjimą Universitete.</p> -->
<!---->
<!--   <div class="mt-4 grid grid-cols-1 md:grid-cols-3 gap-4"> -->
<!--     <div class="p-4 bg-white/50 dark:bg-gray-800/50 rounded-lg"> -->
<!--       <h4 class="font-semibold mb-2">Studijų komitetas</h4> -->
<!--       <p class="text-sm">Nagrinėja studijų kokybės, procesų ir programų klausimus, teikia rekomendacijas studijų gerinimui.</p> -->
<!--     </div> -->
<!---->
<!--     <div class="p-4 bg-white/50 dark:bg-gray-800/50 rounded-lg"> -->
<!--       <h4 class="font-semibold mb-2">Mokslo komitetas</h4> -->
<!--       <p class="text-sm">Svarsto mokslo ir tyrimų plėtros, finansavimo ir kokybės klausimus, skatina mokslinę veiklą.</p> -->
<!--     </div> -->
<!---->
<!--     <div class="p-4 bg-white/50 dark:bg-gray-800/50 rounded-lg"> -->
<!--       <h4 class="font-semibold mb-2">Kokybės ir plėtros komitetas</h4> -->
<!--       <p class="text-sm">Analizuoja universiteto strateginės plėtros kryptis, universiteto kultūros puoselėjimo ir tarptautiškumo klausimus.</p> -->
<!--     </div> -->
<!--   </div> -->
<!-- </div> -->
<!---->
<!-- <h3 class="text-xl font-bold mt-8 mb-4">2024-2025 m. Senate priimti svarbiausi sprendimai</h3> -->
<!-- <ul class="space-y-2 mb-6"> -->
<!--   <li>Patvirtinti pokyčiai, susiję su studijų reguliaminu, gerinantys studentų galimybes derinti darbą ir studijas</li> -->
<!--   <li>Priimti pakeitimai dėl akademinių atostogų suteikimo tvarkos, pritaikyti atsižvelgiant į studentų poreikius</li> -->
<!--   <li>Patvirtinti nauji mokslinių tyrimų etikos principai ir jų įgyvendinimo priemonės</li> -->
<!--   <li>Priimti sprendimai dėl VU infrastruktūros pritaikymo specialiųjų poreikių turintiems studentams</li> -->
<!-- </ul>   -->

