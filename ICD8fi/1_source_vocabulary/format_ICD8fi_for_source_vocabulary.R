library(tidyverse)
library(lubridate)
library(readxl)


# Load --------------------------------------------------------------------
icd8fi_source <- read_tsv("./ICD8Merged_Version5_UTF8.txt") %>% filter(!is.na(Code))



# format -------------------------------------------------------------------------
icd8fi_source <- icd8fi_source %>% 
  rename(code = Code, 
         name_la = Latin,
         name_fi = Finnish,
         name_se = Swedish, 
         name_en = English,
         name_en_source = needs_ENG_trans ) %>% 
  select(code,name_la, name_fi, name_en, name_se, name_en_source)
  



# traslate ----------------------------------------------------------------
icd8fi_source <- icd8fi_source %>% 
  mutate(name_en_source = if_else(name_en_source==0, "THL", "TODO:Google"))


# save --------------------------------------------------------------------
write_csv(icd8fi_source, "./icd8fi_for_source_vocabulary.csv")

