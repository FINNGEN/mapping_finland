library(tidyverse)
library(lubridate)
library(readxl)


# Load --------------------------------------------------------------------
freq_nomesco_finngen <- read_csv("./freq_nomesco_finngen.csv", )
freq_nomesco_tays <- read_excel("./freq_nomesco_tays.xlsx")



# merge -------------------------------------------------------------------

freq_nomesco <- full_join(
  freq_nomesco_finngen %>% rename(code=CODE1, freq_finngen=freq) %>% select(code, freq_finngen),
  freq_nomesco_tays %>% rename(code=TOIMENPIDE, freq_tays=yhteensa) %>% select(code, freq_tays), 
  by="code"
)


freq_nomesco <- freq_nomesco %>% 
  mutate(freq_total = freq_finngen + freq_tays) %>% 
  arrange(-freq_total)



# save --------------------------------------------------------------------
write_csv(freq_nomesco, "./freq_total.csv")
