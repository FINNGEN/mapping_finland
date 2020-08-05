library(tidyverse)
library(lubridate)
library(readxl)


# Load --------------------------------------------------------------------
spat_source <- read_excel("./SPAT_FIN_THLplusENG.xlsx")



# format -------------------------------------------------------------------------
spat_source <- spat_source %>% 
  rename(code = CodeId, 
         name_fi = LongName,
         name_se = `A:Långt_namn`, 
         name_en = ENGLongName, 
         valid_start_date = BeginningDate, 
         valid_end_date = ExpiringDate) %>% 
  mutate( name_en_source = "Traslator") %>% 
  mutate(valid_start_date = as_date(valid_start_date), valid_end_date = as_date(valid_end_date)) %>% 
  select(code, name_fi, name_en, name_se, name_en_source, valid_start_date, valid_end_date)
  


# save --------------------------------------------------------------------
write_csv(spat_source, "./spat_for_source_vocabulary.csv")

