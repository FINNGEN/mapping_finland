library(tidyverse)
library(lubridate)



# Load --------------------------------------------------------------------
freq_reimb_finngen <- read_csv("./freq_fhl_finngen.csv", )



# merge -------------------------------------------------------------------
# freq_reimb <- full_join(
#   freq_reimb_finngen %>% rename(code=CODE1, freq_finngen=freq) %>% select(code, freq_finngen),
#   freq_procedures_tays %>% rename(code=TOIMENPIDE, freq_tays=yhteensa) %>% select(code, freq_tays), 
#   by="code"
# )
freq_reimb <- freq_reimb_finngen %>% rename(code=CODE1, freq_finngen=n_codes) %>% select(code, freq_finngen)

freq_reimb <- freq_reimb %>% 
  mutate(freq_total = freq_finngen) %>% 
  arrange(-freq_total)



# save --------------------------------------------------------------------
write_csv(freq_reimb, "./freq_total.csv")
