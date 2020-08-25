library(tidyverse)
library(lubridate)
library(readxl)


# Load --------------------------------------------------------------------
freq_morpo_tampere_tays <- read_csv("./freq_morpo_tays.csv")



# merge -------------------------------------------------------------------

freq_morpo_tampere <-
  freq_morpo_tampere_tays %>% rename(code=ENTEREDTEXT, freq_tays=freq ) %>% select(code, freq_tays)


freq_morpo_tampere <- freq_morpo_tampere %>% 
  mutate(freq_total =  freq_tays) %>% 
  arrange(-freq_total)



# save --------------------------------------------------------------------
write_csv(freq_morpo_tampere, "./freq_total.csv")
