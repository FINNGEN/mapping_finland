library(tidyverse)
library(lubridate)



# Load --------------------------------------------------------------------
nomesco_source <- read_csv("../1_source_vocabulary/nomesco_for_source_vocabulary.csv")
nomesco_freqs <- read_csv("../3_freq_of_source_codes/freq_total.csv")


# join  -------------------------------------------------------------------------
nomesco_source_for_usagi <- left_join(
  nomesco_source,
  nomesco_freqs,
  by="code"
) 

nomesco_source_for_usagi <- nomesco_source_for_usagi %>%
  mutate_if(is.numeric, ~if_else(is.na(.), rep(0, length(.)), .)) %>% 
  arrange(-freq_total)



# save --------------------------------------------------------------------
write_csv(nomesco_source_for_usagi, "./USAGI/nomesco_source_for_usagi.csv")

