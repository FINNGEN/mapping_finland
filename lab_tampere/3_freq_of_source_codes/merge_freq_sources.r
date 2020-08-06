library(tidyverse)
library(lubridate)
library(readxl)


# Load --------------------------------------------------------------------
freq_lab_tampere_tays <- read_excel("./labrakoodit_2020.xlsx")


# merge -------------------------------------------------------------------

freq_lab_tampere <-
  freq_lab_tampere_tays %>% rename(code=stutno, code_abr = TUTKIMUS_LYHENNE, freq_tays=lukumaara ) %>% select(code, code_abr, freq_tays)


freq_lab_tampere <- freq_lab_tampere %>% 
  mutate(freq_total =  freq_tays) %>% 
  arrange(-freq_total)



# save --------------------------------------------------------------------
write_csv(freq_lab_tampere, "./freq_total.csv")
