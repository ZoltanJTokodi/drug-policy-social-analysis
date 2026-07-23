Markdown

# A Drogháború Paradoxona: Makro-statisztikák, Szociális Degradáció és a Tilalom Vastörvénye

Ez a kutatási projekt az R nyelv segítségével mutatja be a tilalmi drogpolitika (a "drogháború") rendszerszintű kudarcát és annak nem várt piaci következményeit.

## 1. Pillér: A kemény adatok (Eurostat halálozások)
A tiltópolitika elsődleges célja az emberi életek megóvása lenne. Az Eurostat kábítószer-függőségi halálozási adatai (`tps00149`) alapján azonban a trendek Európa-szerte stagnálnak vagy növekednek. Különösen beszédes Svédország esete, ahol a zéró tolerancia ellenére a halálozási arányszám kiugróan magas. 
> 🇸🇪 **A svéd paradoxon:** > Svédország esete a legtisztább példa a tilalmi politika kudarcára. Az ország Európa egyik legszigorúbb, zéró toleranciára épülő drogpolitikáját alkalmazza (ahol magát a fogyasztást és a szervezetben kimutatható jelenlétet is kriminalizálják). A kriminalizáció elrettentő hatása helyett azonban a valóság az, hogy **Svédországban az egyik legmagasabb a százezer lakosra jutó kábítószer-halálozások aránya az EU-ban**. A szigor nem a fogyasztást szüntette meg, hanem a segítségkérést gátolta meg, elszigetelve a kockázati csoportokat az egészségügyi ellátórendszertől.

![Eurostat Halálozási Trendek](01_eurostat_halalozasok.png)

## 2. Pillér: Módszertani tévedés (Marihuána vs. Metamfetamin)
A drogháború alapvető hibája, hogy a jogi szabályozás gyakran azonos stigmát éget a teljesen eltérő kockázatú szerek használóira.
* **Marihuána:** Az egyén szociális csomópont (node) funkciója megmarad. A stigmát nem a társadalom, hanem maga a jogi környezet kényszeríti ki (priusz).
* **Metamfetamin:** A szer pusztítása és a brutális társadalmi kirekesztés miatt a szociális hálózatok teljesen megsemmisülnek (*Social Decay*). A kriminalizáció miatt a használó nem mer egészségügyi segítséget kérni.

![Szociális Degradáció](02_szocialis_degradacio.png)

## 3. Pillér: Az Ironikus Tilalom Törvénye (The Iron Law of Prohibition)
A projekt legfontosabb piacelméleti következtetése: **minél inkább visszaszorítják az organikus szerek jelenlétét, annál nagyobb teret nyernek a veszélyes szintetikus anyagok.**

Mivel a marihuána (organikus) szállítása a mérete miatt kockázatosabb, a rendőrségi szigor hatására a feketepiac átáll a koncentrált, laboratóriumokban előállítható szintetikus stimulánsokra (mint a metamfetamin vagy az új dizájnerdrogok/NPS). Ezek kisebb helyen elférnek, könnyebben csempészhetők, de sokkal kiszámíthatatlanabbak és toxikusabbak. A drogháború ezzel közvetve növeli a társadalom egészségügyi kockázatát.

![Iron Law of Prohibition](03_iron_law_prohibition.png)

## A projekt fájlstruktúrája
* `script.R`: A teljes adatletöltést, szimulációt és a `ggplot2` grafikonokat tartalmazó R kód.
* `01_eurostat_halalozasok.png`: A generált halálozási trend grafikon.
* `02_szocialis_degradacio.png`: A szerek összehasonlító ártalmassági grafikonja.
* `03_iron_law_prohibition.png`: A tilalom vastörvényét bemutató piaci trendábra.

## Felhasznált Források & Szakirodalom (References)

Az elemzés a hivatalos európai statisztikák és a nemzetközi kriminálökonómiai/addikciós szakirodalom adatain alapul:

1. **Makro-statisztikai adatok (1. ábra):**
   * **Forrás:** Eurostat (Az Európai Unió Statisztikai Hivatala) & EUDA (European Union Drugs Agency).
   * **Adatkészlet:** `tps00149` (*Deaths due to drugs dependence, by sex*). A standardizált halálozási arányszámokat mutatja 100 000 lakosra vetítve.

2. **Drog-ártalmassági és degradációs mátrix (2. ábra):**
   * **Alapul vett tanulmány:** Nutt, D. J., King, L. A., & Phillips, L. D. (2010). *Drug harms in the UK: a multicriteria decision analysis.* **The Lancet**, 376(9752), 1558-1565.
   * **Elmélet:** Ez a kutatás számszerűsítette először külön az egyéni károkat (fizikai/kognitív leépülés) és a szociális károkat (izoláció, stigma), rávilágítva a marihuána és a szintetikus stimulánsok (metamfetamin) közötti radikális különbségekre.

3. **Az Ironikus Tilalom Törvénye (3. ábra):**
   * **Elméleti háttér:** Richard Cowan (1986). *The Iron Law of Prohibition*. 
   * **Koncepció:** Közgazdasági és kriminológiai törvényszerűség, amely leírja a "Hydra-effektust": a bűnüldözési szigor fokozódása (lefoglalások növekedése) a piacot a kisebb térfogatú, de potensebb, kiszámíthatatlanabb és toxikusabb szintetikus anyagok felé kényszeríti.
  
   * ## Futtatás
A teljes elemzés és a grafikok reprodukálásához futtasd az R konzolban:
```R
source("script.R")
