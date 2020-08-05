library(tidyverse)
library(lubridate)



# Load --------------------------------------------------------------------
freq_spat_finngen <- read_csv("./freq_spat_finngen.csv" )



# merge -------------------------------------------------------------------
# freq_spat <- full_join(
#   freq_spat_finngen %>% rename(code=CODE1, freq_finngen=freq) %>% select(code, freq_finngen),
#   freq_procedures_tays %>% rename(code=TOIMENPIDE, freq_tays=yhteensa) %>% select(code, freq_tays), 
#   by="code"
# )
freq_spat <- freq_spat_finngen %>% rename(code=CODE1, freq_finngen=n_codes) %>% select(code, freq_finngen)

freq_spat <- freq_spat %>% 
  mutate(freq_total = freq_finngen) %>% 
  arrange(-freq_total)



# save --------------------------------------------------------------------
write_csv(freq_spat, "./freq_total.csv")
