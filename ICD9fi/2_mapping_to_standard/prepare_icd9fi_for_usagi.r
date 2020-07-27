library(tidyverse)
library(lubridate)



# Load --------------------------------------------------------------------
ICD9fi_source <- read_csv("../1_source_vocabulary/ICD9fi_for_source_vocabulary.csv")
ICD9fi_freqs <- read_csv("../3_freq_of_source_codes/freq_total.csv")


# join  -------------------------------------------------------------------------
ICD9fi_source_for_usagi <- left_join(
  ICD9fi_source,
  ICD9fi_freqs,
  by="code"
) 

ICD9fi_source_for_usagi <- ICD9fi_source_for_usagi %>%
  mutate_if(is.numeric, ~if_else(is.na(.), rep(0, length(.)), .)) %>% 
  arrange(-freq_total)



# save --------------------------------------------------------------------
write_csv(ICD9fi_source_for_usagi, "./USAGI/icd9fi_source_for_usagi.csv")


