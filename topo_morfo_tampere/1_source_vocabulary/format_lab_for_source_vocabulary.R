library(tidyverse)
library(lubridate)
library(readxl)


# Load --------------------------------------------------------------------
morpho_source <- read_excel("./Tampere_2019_10_17_with_synonyms_preferred_terms_fi.xlsx")


morpho_source <- morpho_source %>%
  rename(code = sn2_code, 
         name_fi = as.character(NA),
         name_en = sn2_term,
         name_en_source = "Google") %>%  
  mutate_at(vars(valid_start_date, valid_end_date), dmy) %>% 
  select(code, name_fi, name_en, name_en_source, valid_start_date, valid_start_date, units,abbreviation)


# save --------------------------------------------------------------------
write_csv(morpho_source, "./lab_tampere_for_source_vocabulary.csv")



