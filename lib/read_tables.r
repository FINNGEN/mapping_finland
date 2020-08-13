require(tidyverse)


read_table_concept <- function(path_vocabulary_tables){
  
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
  
  read_tsv(file.path(path_vocabulary_tables, "CONCEPT.csv"), quote = "", col_types = col_type)
  
}


read_table_concept_relationship_mapsto <- function(path_vocabulary_tables){
  
  col_type <- cols(
    concept_id_1 = col_double(),
    concept_id_2 = col_double(),
    relationship_id = col_character(),
    valid_start_date = col_double(),
    valid_end_date = col_double(),
    invalid_reason = col_logical()
  )
  
  read_tsv(file.path(path_vocabulary_tables, "CONCEPT_RELATIONSHIP.csv"), quote = "", col_types = col_type) %>% 
    filter(relationship_id == "Maps to")
  
}
