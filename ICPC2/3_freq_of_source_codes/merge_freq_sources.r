library(tidyverse)
library(lubridate)



# Load --------------------------------------------------------------------
freq_icpc2_finngen <- read_csv("./freq_icpc2_finngen.csv") %>% select(-X1)



# merge -------------------------------------------------------------------
# freq_icpc2 <- full_join(
#   freq_icpc2_finngen %>% rename(code=CODE1, freq_finngen=freq) %>% select(code, freq_finngen),
#   freq_procedures_tays %>% rename(code=TOIMENPIDE, freq_tays=yhteensa) %>% select(code, freq_tays), 
#   by="code"
# )
freq_icpc2 <- freq_icpc2_finngen %>% rename(code=CODE1, freq_finngen=n_codes) %>% select(code, freq_finngen)

freq_icpc2 <- freq_icpc2 %>% 
  mutate(freq_total = freq_finngen) %>% 
  arrange(-freq_total)



# save --------------------------------------------------------------------
write_csv(freq_icpc2, "./freq_total.csv")
