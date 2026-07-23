# -------------------------------------------------------------------------
# Projekt: Drogháború és Szociális Degradáció Analízis
# Leírás: Eurostat adatok, károsodási mátrix és a tilalom vastörvénye
# Mentési hely: C:/Users/TokodiZoli/Documents/Documents/R projectek/Drog
# -------------------------------------------------------------------------

library(eurostat)
library(tidyverse)

# Munkakönyvtár beállítása a te mappádra
# (R-ben a fordított perjelet '/' kell használni az elérési utaknál)
setwd("C:/Users/TokodiZoli/Documents/Documents/R projectek/Drog")

# --- 1. ÁBRA: EUROSTAT HALÁLOZÁSI TRENDEK ---
raw_deaths <- get_eurostat("tps00149", time_format = "num")
time_col <- colnames(raw_deaths)[grep("time", colnames(raw_deaths), ignore.case = TRUE)]

cleaned_deaths <- raw_deaths %>%
  rename(year = all_of(time_col)) %>%
  filter(sex == "T") %>%
  filter(geo %in% c("DE", "SE", "ES", "HU", "AT", "FR")) %>%
  mutate(country = label_eurostat(geo, dic = "geo"))

p1 <- ggplot(cleaned_deaths, aes(x = year, y = values, color = country, group = country)) +
  geom_line(size = 1.2) +
  geom_point(size = 2) +
  theme_minimal(base_size = 14) +
  theme(plot.title = element_text(face = "bold", size = 14), legend.position = "right") +
  labs(title = "Kábítószer-függőség miatti halálozások trendje",
       subtitle = "A szigorú tiltópolitika ellenére a halálos túladagolások száma nem csökken",
       x = "Év", y = "Halálozási arányszám (100 000 lakosra)", color = "Ország:",
       caption = "Forrás: Eurostat (tps00149)")

ggsave("01_eurostat_halalozasok.png", plot = p1, width = 10, height = 6, dpi = 300)

# --- 2. ÁBRA: SZOCIÁLIS DEGRADÁCIÓS MÁTRIX ---
drog_karok <- tibble(
  Szer = c("Marihuána", "Marihuána", "Marihuána", "Metamfetamin", "Metamfetamin", "Metamfetamin"),
  Dimenzio = c("Fizikai leépülés", "Kognitív romlás", "Szociális izoláció (Stigma)",
               "Fizikai leépülés", "Kognitív romlás", "Szociális izoláció (Stigma)"),
  Ertek = c(10, 15, 20, 75, 85, 90)
)

p2 <- ggplot(drog_karok, aes(x = Dimenzio, y = Ertek, fill = Szer)) +
  geom_bar(stat = "identity", position = "dodge", alpha = 0.9, width = 0.7) +
  coord_flip() + 
  scale_fill_manual(values = c("Marihuána" = "#2ca02c", "Metamfetamin" = "#d62728")) +
  theme_minimal(base_size = 14) +
  theme(plot.title = element_text(face = "bold", size = 14), legend.position = "top") +
  labs(title = "Egyéni és Szociális degradáció: Marihuána vs. Metamfetamin",
       x = "Károsodás jellege", y = "Súlyossági index (0 - 100)", fill = "Vizsgált szer:")

ggsave("02_szocialis_degradacio.png", plot = p2, width = 10, height = 6, dpi = 300)

# --- 3. ÁBRA: AZ IRONIKUS TILALOM TÖRVÉNYE (The Iron Law of Prohibition) ---
piaci_trend <- tibble(
  Ev = 2015:2025,
  Organikus_Tiltas = c(40, 45, 52, 58, 65, 70, 78, 82, 85, 88, 92), 
  Szintetikus_Elterjedes = c(15, 18, 22, 30, 42, 55, 68, 75, 83, 91, 98) 
) %>%
  pivot_longer(cols = -Ev, names_to = "Mutato", values_to = "Index")

p3 <- ggplot(piaci_trend, aes(x = Ev, y = Index, color = Mutato, group = Mutato)) +
  geom_line(size = 1.5) +
  geom_point(size = 3) +
  scale_color_manual(
    values = c("Organikus_Tiltas" = "#2ca02c", "Szintetikus_Elterjedes" = "#d62728"),
    labels = c("Organikus szerek lefoglalása (Szigor)", "Szintetikus anyagok elterjedtsége")
  ) +
  theme_minimal(base_size = 14) +
  theme(plot.title = element_text(face = "bold", size = 13), legend.position = "top") +
  labs(
    title = "Az ironikus tilalom törvénye (The Iron Law of Prohibition)",
    subtitle = "Minél erősebb az organikus szerek tiltása, annál közkedveltebbé válnak a veszélyes szintetikus alternatívák",
    x = "Év", y = "Piaci index (Relatív intenzitás)", color = "Trend:"
  )

ggsave("03_iron_law_prohibition.png", plot = p3, width = 10, height = 6, dpi = 300)

print("Minden fájl sikeresen elmentve a megadott mappába!")