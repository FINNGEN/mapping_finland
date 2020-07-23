library(tidyverse)
library(lubridate)



# Load --------------------------------------------------------------------
nomesco_source <- read_delim("./NOMESCO_codes_UTF8.txt", delim = ";", 
                               col_types = cols( .default = col_character() ))



# format -------------------------------------------------------------------------
nomesco_source <- nomesco_source %>% 
  select(CodeId, LongName, `A:Long_name`, `A:Långt_namn`, `A:Long_name_source`, BeginningDate, ExpiringDate) %>% 
  rename(code = CodeId, 
         name_fi = LongName, name_en = `A:Long_name`, name_se = `A:Långt_namn`,  
         name_en_source = `A:Long_name_source`, 
         valid_start_date = BeginningDate, valid_end_date = ExpiringDate) %>% 
  mutate_at(vars(valid_start_date, valid_end_date), dmy)
  



# save --------------------------------------------------------------------
write_csv(nomesco_source, "./nomesco_for_source_vocabulary.csv")

