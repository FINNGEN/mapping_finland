library(tidyverse)
library(lubridate)
library(readxl)



# WE DISCOVERED THAT CODES DO NOT BELONG TO THE STANDARD IN KODISTO PALVELY 
# 
# # download ----------------------------------------------------------------
# url <- 'https://91.202.112.142/codeserver/pages/download?name=120_1387444168447.txt&pKey=pubfiles0'
# download.file(url = url, destfile = "labcodes_from_kodistopalvely.txt", method =  "libcurl")
# 


# Load --------------------------------------------------------------------
labcodes_source <- read_csv("./laboratoriodimensio.csv", 
                              locale = locale(encoding = 'ISO-8859-1'),
                              col_types = cols( .default = col_character() )
)

labcodes_source <- labcodes_source %>%
  rename(code = TUTKIMUS, 
         name_fi=TUTKIMUS_NIMI,
         valid_start_date = ALKU_PVM,  valid_end_date = LOPPU_PVM, 
         units = VASTAUSYKSIKKO, abbreviation = TUTKIMUS_LYHENNE ) %>%
  mutate( name_en = as.character(NA), name_en_source = "Google") %>%  
  mutate_at(vars(valid_start_date, valid_end_date), dmy) %>% 
  select(code, name_fi, name_en, name_en_source, valid_start_date, valid_start_date, units,abbreviation)


# save --------------------------------------------------------------------
write_csv(labcodes_source, "./lab_tampere_for_source_vocabulary.csv")



