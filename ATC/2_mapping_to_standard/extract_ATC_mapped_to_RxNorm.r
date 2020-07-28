# extract and save ICD10who from the OMOP vocabulary 

path_to_OMOP_concept_table <- "C:\\Users\\javier\\WorkSpace\\OMOP_vocabulary_v5\\CONCEPT_RELATIONSHIP.csv"


# load --------------------------------------------------------------------

col_type <- cols(
  concept_id_1 = col_double(),
  concept_id_2 = col_double(),
  relationship_id = col_character(),
  valid_start_date = col_double(),
  valid_end_date = col_double(),
  invalid_reason = col_logical()
)

maps_to <- read_tsv(path_to_OMOP_concept_table, quote = "", col_types = col_type) %>% 
  filter(relationship_id == "Maps to")

atc <- read_csv("../1_source_vocabulary/OMOP_ATC.csv")



# map  --------------------------------------------------------------------
atc_mapped <- left_join(
  atc,
  maps_to %>% select(concept_id_1, concept_id_2) %>% rename(concept_id = concept_id_1),
  by="concept_id"        
) %>% distinct(concept_id, .keep_all = T) %>% 
  mutate(mappingStatus = if_else(!is.na(concept_id_2), "MAPPED", "NOT_MAPPED")) %>% 
  select(-concept_id_2)


write_csv(atc_mapped, "atc_mapped_by_omop.csv")
