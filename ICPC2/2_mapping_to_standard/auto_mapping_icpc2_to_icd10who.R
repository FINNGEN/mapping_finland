library(tidyverse)


# Load --------------------------------------------------------------------
icpc2_standard <- read_csv("../1_source_vocabulary/icpc2_for_source_vocabulary.csv")

#TODO in the future we should take from 3_mapping_table
ICD10fi_OMOP <- read_csv("../../ICD10fi/2_mapping_to_standard/OMOP_ICD10who.csv")

icpc2_auto_mapped <-  left_join(
  icpc2_standard, 
  ICD10fi_OMOP %>% rename(code=concept_code) %>% select(code, concept_id), 
  by="code"
)

icpc2_no_mapped <- icpc2_auto_mapped %>% filter(is.na(concept_id)) %>% count(ICPC_version) 

icpc2_auto_mapped <- icpc2_auto_mapped %>% 
  mutate(mappingStatus = if_else(!is.na(concept_id),"AUTO_MAPPED", "NOT_MAPPED"))


# save --------------------------------------------------------------------
write_csv(icpc2_auto_mapped, "./icpc2_auto_mapped.csv")
