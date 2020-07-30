# extract and save ICD10who from the OMOP vocabulary 

path_to_OMOP_concept_table <- "C:\\Users\\javier\\WorkSpace\\OMOP_vocabulary_v5\\CONCEPT.csv"



col_type <- cols(
  concept_id = col_integer(),
  concept_name = col_character(),
  domain_id = col_character(),
  vocabulary_id = col_character(),
  concept_class_id = col_character(),
  standard_concept = col_character(),
  concept_code = col_character(),
  valid_start_date = col_date("%Y%m%d"),
  valid_end_date = col_date("%Y%m%d"),
  invalid_reason = col_character()
)

concepts <- read_tsv(path_to_OMOP_concept_table, quote = "", col_types = col_type)

concepts_icd10 <- concepts  %>% filter(vocabulary_id == "ICD10")

write_csv(concepts_icd10, "OMOP_ICD10who.csv")
