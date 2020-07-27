library(tidyverse)
library(lubridate)



# Load --------------------------------------------------------------------
freq_icd9fi_finngen <- read_csv("./freq_icd9fi_finngen.csv", )



# merge -------------------------------------------------------------------
# freq_icd9fi <- full_join(
#   freq_icd9fi_finngen %>% rename(code=CODE1, freq_finngen=freq) %>% select(code, freq_finngen),
#   freq_procedures_tays %>% rename(code=TOIMENPIDE, freq_tays=yhteensa) %>% select(code, freq_tays), 
#   by="code"
# )
freq_icd9fi <- freq_icd9fi_finngen %>% rename(code=CODE1, freq_finngen=n_codes) %>% select(code, freq_finngen)

freq_icd9fi <- freq_icd9fi %>% 
  mutate(freq_total = freq_finngen) %>% 
  arrange(-freq_total)



# save --------------------------------------------------------------------
write_csv(freq_icd9fi, "./freq_total.csv")
