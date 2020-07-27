library(tidyverse)
library(lubridate)
library(readxl)


# Load --------------------------------------------------------------------
icd9fi_source <- read_excel("./THL_ICD9fi_matched_ICD9CM_and_Wolfbane_ICD9.xlsx")



# format -------------------------------------------------------------------------
icd9fi_source <- icd9fi_source %>% 
  rename(code = ICD9, 
         name_fi = ICD9TXT, 
         name_en = Wolfbane_name) %>% 
  mutate(name_en_source = str_c("ICD9_code_match(",match_type,")")) %>% 
  select(code, name_fi, name_en, name_en_source)
  


# save --------------------------------------------------------------------
write_csv(icd9fi_source, "./icd9fi_for_source_vocabulary.csv")

