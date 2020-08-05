library(tidyverse)
library(lubridate)
library(readxl)



# Load --------------------------------------------------------------------
col_types = cols( .default = col_character(), 
                  n_code = col_number(), 
                  n_patient = col_number())

freq_icdo3_finngen <- read_csv("./freq_icdo3_finngen.csv", col_types = col_types)
#freq_icdo3_tays <- read_excel("./icdo3_codes.xlsx")



# format --------------------------------------------------------------
freq_icdo3_finngen <- freq_icdo3_finngen %>% 
  rename(freq_finngen = n_code) %>% 
  mutate(CODE1 = if_else(nchar(CODE1)>3,
                         str_replace(CODE1, "([:upper:][:digit:][:digit:])([:digit:]*)", "\\1.\\2" ),
                         CODE1)
  ) %>% 
  mutate(code = str_c(CODE2, "/", CODE3, "-", CODE1)) 


# # merge -------------------------------------------------------------------
# freq_icdo3 <- full_join(
#   freq_icdo3_finngen %>% rename(code=CODE1, freq_finngen=n_codes) %>% select(code, freq_finngen),
#   freq_icdo3_tays %>% rename(code=icdo3_KOODI, freq_tays=lukumaara) %>% select(code, freq_tays), 
#   by="code"
# )


freq_icdo3 <- freq_icdo3_finngen %>%
  mutate(freq_total = freq_finngen) %>%
  select(code, freq_finngen, freq_total) %>% 
  arrange(-freq_total)



# save --------------------------------------------------------------------
write_csv(freq_icdo3, "./freq_total.csv")
