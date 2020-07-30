library(tidyverse)
library(lubridate)
library(googleLanguageR)

gl_auth(r"(C:\Users\javier\AppData\Local\R\keys\traslater-e7e9c4dc6948.json)")


# Load --------------------------------------------------------------------
icd10fi_source <- read_delim("./58_1471433699473.txt", ";", 
                             locale = locale(encoding = 'ISO-8859-1'),
                             col_types = cols( .default = col_character() )
)


# format -------------------------------------------------------------------------
icd10fi_source <- icd10fi_source %>% 
  rename(code = CodeId, 
         name_fi = LongName, name_en = `A:Long_name`, name_se = `A:Långt_namn`,  
         valid_start_date = BeginningDate, valid_end_date = ExpiringDate) %>% 
  mutate_at(vars(valid_start_date, valid_end_date), dmy) %>% 
  select(code, name_fi, name_en, name_se, valid_start_date, valid_end_date )
  

# translate to English  ----------------------------------------------------
icd10fi_source <- icd10fi_source %>%# head(10) %>% 
  mutate(name_en_source = if_else(!is.na(name_en), "THL",  "Google")) %>% 
  mutate(name_en = if_else(is.na(name_en), gl_translate(name_fi, source = "fi", target = "en")$translatedText, name_en ))


# save --------------------------------------------------------------------
write_csv(icd10fi_source, "./icd10fi_for_source_vocabulary0.csv")


