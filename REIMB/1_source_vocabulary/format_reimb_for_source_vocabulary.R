library(tidyverse)
library(lubridate)
library(readxl)


# Load --------------------------------------------------------------------
reimb_source <- read_excel("./Kela_reimbursement_codes.xlsx")



# format -------------------------------------------------------------------------
reimb_source <- reimb_source %>% 
  rename(code = CODE, 
         name_fi = FIN_TXT, 
         name_en = ENG_TXT,
         name_en_source = ENG_SRC ) %>% 
  mutate(code = as.character(code), valid_start_date = dmy(valid_start_date), valid_end_date = dmy(valid_end_date)) %>% 
  mutate(name_en_source = str_replace(name_en_source, "GOOGE", "Google")) %>% 
  select(code, name_fi, name_en, name_en_source, valid_start_date, valid_end_date)
  


# save --------------------------------------------------------------------
write_csv(reimb_source, "./reimb_for_source_vocabulary.csv")

