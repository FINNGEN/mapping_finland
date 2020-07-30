library(tidyverse)
library(lubridate)



# Load --------------------------------------------------------------------
freq_icd10fi_finngen <- read_csv("./freq_ICD10fi_finngen.csv", ) %>% select(-X1)
freq_icd10_tays <- read_csv("./freq_ICD10fi_tays.csv", 
                            col_types = cols( .default = col_character() )) %>% 
  mutate( frequency = as.integer(frequency))



# format similarly  -------------------------------------------------------
freq_icd10fi_finngen <- freq_icd10fi_finngen %>% 
  rename(freq_finngen = n_codes) %>% 
  mutate(code1 = str_replace(CODE1,"\\+|\\*|\\#|\\&", ""), code2 = str_replace(CODE2,"\\+|\\*|\\#|\\&", "")) %>% 
  # if same code sum freqs
  group_by(code1, code2) %>% summarise(freq_finngen=sum(freq_finngen),  n_patients=sum(n_patients)) %>% ungroup()



freq_icd10_tays <- freq_icd10_tays %>%  mutate(code1 = str_replace(dg, "([:alnum:]*)\\s([:alnum:]*)", "\\1")) %>% 
  mutate(code2 = if_else(str_detect(dg, "\\s"), str_replace(dg, "([:alnum:]*)\\s([:alnum:]*)", "\\2"), as.character(NA))) %>% 
  mutate(frequency = as.double(frequency)) %>% 
  rename(freq_tays = frequency) %>% select(code1, code2, freq_tays) %>%  distinct() %>% 
  group_by(code1, code2) %>% summarise(freq_tays=sum(freq_tays))%>% ungroup()

# merge -------------------------------------------------------------------

freq_icd10fi <- full_join(
  freq_icd10fi_finngen %>% select(code1, code2, freq_finngen),
  freq_icd10_tays %>% select(code1, code2, freq_tays), 
  by= c("code1", "code2")
)


freq_icd10fi <- freq_icd10fi %>% 
  mutate(freq_total = freq_finngen + freq_tays) %>% 
  arrange(-freq_total)



# save --------------------------------------------------------------------
write_csv(freq_icd10fi, "./freq_total.csv")
