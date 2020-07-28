library(tidyverse)
library(lubridate)
library(readxl)


# Load --------------------------------------------------------------------
icpc2_source <- read_tsv("./ICPC2_merged_and__ICPC1_from_DF6_UTF8.txt")
icpc2_source <- icpc2_source %>%  
  rename(code = Id_FIN, name_fi=`Long name_FIN`, name_en = shortTitle_ENG, main_icd10fi = `Ensisijainen ICD-10_FIN` ) %>% 
  mutate(ICPC_version = if_else(str_detect(code, "^-"), "ICPC2_proc", str_c("ICPC", ICPC_version))) %>% 
  select(code, name_fi, name_en, ICPC_version, main_icd10fi) 


# save --------------------------------------------------------------------
write_csv(icpc2_source, "./icpc2_for_source_vocabulary.csv")

