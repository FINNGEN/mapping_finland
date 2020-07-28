library(tidyverse)
library(lubridate)
library(readxl)



# Load --------------------------------------------------------------------
freq_atc_finngen <- read_csv("./freq_purch_finngen.csv", )
freq_atc_tays <- read_excel("./atc_codes.xlsx")



# remove vnr --------------------------------------------------------------
freq_atc_finngen <- freq_atc_finngen %>% group_by(CODE1) %>% summarise(n_codes = sum(n_codes))


# merge -------------------------------------------------------------------
freq_atc <- full_join(
  freq_atc_finngen %>% rename(code=CODE1, freq_finngen=n_codes) %>% select(code, freq_finngen),
  freq_atc_tays %>% rename(code=ATC_KOODI, freq_tays=lukumaara) %>% select(code, freq_tays), 
  by="code"
)


freq_atc <- freq_atc %>% 
  mutate(freq_total = freq_finngen + freq_tays) %>% 
  arrange(-freq_total)



# save --------------------------------------------------------------------
write_csv(freq_atc, "./freq_total.csv")
