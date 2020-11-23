
# settings ----------------------------------------------------------------
path_to_vocabulary <- r"(C:\Users\javier\WorkSpace\OMOP_vocab_for_finngen)"
path_to_repo <- r"(C:\Users\javier\OneDrive - TUNI.fi\Documents\TAYS\PROJECTS\OHDSI\MAPPING\REPOS\mapping_finland)"
path_output <- r"(C:\Users\javier\WorkSpace\OMOP_vocab_for_finngen_extended)"


library(tidyverse)
source(file.path(path_to_repo, "lib", "read_tables.r"))

# check max concept_id ----------------------------------------------------

concept <-  read_table_concept(path_to_vocabulary)
vocabulary <- read_tsv(file.path(path_to_vocabulary, "VOCABULARY.csv"))
concept_class <- read_tsv(file.path(path_to_vocabulary, "CONCEPT_CLASS.csv"))
concept_synonym <- read_tsv(file.path(path_to_vocabulary, "CONCEPT_SYNONYM.csv"), quote = "")
concept_relationship <- read_tsv(file.path(path_to_vocabulary, "CONCEPT_RELATIONSHIP.csv"), quote = "", 
  col_type = cols(
   concept_id_1 = col_double(),
   concept_id_2 = col_double(),
   relationship_id = col_character(),
   valid_start_date =  col_date("%Y%m%d"),
   valid_end_date =  col_date("%Y%m%d"),
   invalid_reason = col_character()
  )
)

max(concept$concept_id)


# set offset for concept_id -----------------------------------------------

append_vocabs <- tribble(
  ~vocabulary_name, ~offset_concept_id,
  "ICD8fi",          7*10^8L,
  "ICD9fi",          8*10^8L,
  "ICD10fi",         9*10^8L,
  "ICPC",           10*10^8L,
  "NOMESCOfi",      11*10^8L,
  "REIMB",           12*10^8L,
  "SPAT",           13*10^8L,
  "FHL",           14*10^8L,
  "HPN",           15*10^8L,
  
)



# append ------------------------------------------------------------------
concept_fg_info <- tibble()

for (i in 1:nrow(append_vocabs)) {
    
  vocabulary_name <- append_vocabs[i,]$vocabulary_name
  offset_concept_id <- append_vocabs[i,]$offset_concept_id
  
  ## concept  
  concept_vocab <- read_csv(
    file.path(path_to_repo, vocabulary_name, "1_source_vocabulary", str_c("CONCEPT_", vocabulary_name, ".csv")),
    col_types = cols(
      concept_id = col_integer(),
      valid_start_date = col_date(format = ""),
      valid_end_date = col_date(format = ""),
      .default = col_character()
    )
  ) %>% 
    mutate(concept_id = concept_id + offset_concept_id)
  
  concept <- bind_rows(concept, concept_vocab %>% select(-starts_with("tmp_")) )
  
  ## concept extra finngen info 
  concept_fg_info <- bind_rows(concept_fg_info, concept_vocab %>% select( concept_id, starts_with("tmp_")) )
  
  ## vocabulary 
  vocabulary_vocab <- read_csv(
    file.path(path_to_repo, vocabulary_name, "1_source_vocabulary", str_c("VOCABULARY_", vocabulary_name, ".csv")),
    col_types = cols(
      vocabulary_concept_id = col_integer(),
      .default = col_character()
    )
  ) %>% 
    select(-starts_with("tmp_")) %>% 
    mutate(vocabulary_concept_id = vocabulary_concept_id + offset_concept_id)
  
  vocabulary <- bind_rows(vocabulary, vocabulary_vocab)  
  
  
  ## concept class
  concept_class_vocab <- read_csv(
    file.path(path_to_repo, vocabulary_name, "1_source_vocabulary", str_c("CONCEPT_CLASS_", vocabulary_name, ".csv"))
  ) %>% 
    select(-starts_with("tmp_")) %>% 
    mutate(concept_class_concept_id = concept_class_concept_id + offset_concept_id)
  
  concept_class <- bind_rows(concept_class, concept_class_vocab)  
  
  
  ## concept_synonym
  file_path_syn <- file.path(path_to_repo, vocabulary_name, "1_source_vocabulary", str_c("CONCEPT_SYNONYM_", vocabulary_name, ".csv"))
    
  if(file.exists(file_path_syn)){
    concept_synonym_vocab <- read_csv(file_path_syn) %>% 
      select(-starts_with("tmp_")) %>% 
      mutate(concept_id  = concept_id  + offset_concept_id)
    
    concept_synonym <- bind_rows(concept_synonym, concept_synonym_vocab)  
  }
    
  ## concept_relationship
  file_path_relationship <- file.path(path_to_repo, vocabulary_name, "2_mapping_to_standard", str_c("CONCEPT_RELATIONSHIP_", vocabulary_name, ".csv"))
  
  if(file.exists(file_path_relationship)){
    concept_relationship_vocab <- read_csv(file_path_relationship,
       col_type = cols(
         concept_id_1 = col_double(),
         concept_id_2 = col_double(),
         relationship_id = col_character(),
         valid_start_date =  col_date(),
         valid_end_date =  col_date(),
         .default = col_character()
       )
    ) %>% 
      select(-starts_with("tmp_")) %>% 
      mutate(concept_id_1   = concept_id_1   + offset_concept_id)
    
    concept_relationship <- bind_rows(concept_relationship, concept_relationship_vocab)  
  }

}


# checking ----------------------------------------------------------------

# vocabulary 
v <- vocabulary %>% filter(vocabulary_id %in% append_vocabs$vocabulary_name)
v
concept %>% filter(concept_id %in% v$vocabulary_concept_id)

# concept class
cc <- concept_class %>% tail(21) 
cc %>% print(n=1000)
concept %>% filter(concept_id %in% cc$concept_class_concept_id) %>% print(n=1000)

concept_synonym %>% tail()
concept_relationship %>% tail()



# save as feather --------------------------------------------------------------------
library(feather)
write_feather(concept, file.path(path_output, "CONCEPT.feather"))
write_feather(vocabulary, file.path(path_output, "VOCABULARY.feather"))
write_feather(concept_class, file.path(path_output, "CONCEPT_CLASS.feather"))
write_feather(concept_synonym, file.path(path_output, "CONCEPT_SYNONYMfeather"))
write_feather(concept_relationship, file.path(path_output, "CONCEPT_RELATIONSHIP.feather"))
write_feather(concept_fg_info, file.path(path_output, "concept_fg_info.feather"))

# CONCEPT_ANCESTOR
col_types <- cols(
  ancestor_concept_id  = col_integer(),
  descendant_concept_id  = col_integer(),
  min_levels_of_separation  = col_integer(), 
  max_levels_of_separation = col_integer()
)
read_csv(file.path(path_to_vocabulary, "CONCEPT_ANCESTOR.csv"), col_types=col_types) %>% 
write_feather(file.path(path_output, "CONCEPT_ANCESTOR.feather"))

# DRUG_STRENGTH
col_types <- cols(
  drug_concept_id = col_integer(),
  ingredient_concept_id = col_integer(),
  amount_value = col_double(),
  amount_unit_concept_id = col_integer(),
  numerator_value = col_double(),
  numerator_unit_concept_id = col_integer(),
  denominator_value = col_double(),
  denominator_unit_concept_id = col_integer(),
  box_size = col_integer(),
  valid_start_date = col_date(),
  valid_end_date = col_date(),
  invalid_reason = col_character()
)
read_csv(file.path(path_to_vocabulary, "DRUG_STRENGTH.csv"), col_types=col_types) %>% 
  write_feather(file.path(path_output, "DRUG_STRENGTH.feather"))

# DOMAIN
col_types <- cols(
  domain_id = col_character(),
  domain_name = col_character(),
  domain_concept_id = col_integer()
)
read_tsv(file.path(path_to_vocabulary, "DOMAIN.csv"), col_types=col_types) %>% 
  write_feather(file.path(path_output, "DOMAIN.feather"))

# RELATIONSHIP
col_types <- cols(
  relationship_id = col_character(),
  relationship_name = col_character(),
  is_hierarchical = col_character(),
  defines_ancestry = col_character(),
  reverse_relationship_id = col_character(),
  relationship_concept_id = col_integer()
)
read_tsv(file.path(path_to_vocabulary, "RELATIONSHIP.csv"), col_types=col_types) %>% 
  write_feather(file.path(path_output, "RELATIONSHIP.feather"))

# # save as csv --------------------------------------------------------------------
# write_csv(concept, file.path(path_output, "CONCEPT.csv"))
# write_csv(vocabulary, file.path(path_output, "VOCABULARY.csv"))
# write_csv(concept_class, file.path(path_output, "CONCEPT_CLASS.csv"))
# write_csv(concept_synonym, file.path(path_output, "CONCEPT_SYNONYM.csv"))
# write_csv(concept_relationship, file.path(path_output, "CONCEPT_RELATIONSHIP.csv"))
# write_csv(concept_fg_info, file.path(path_output, "concept_fg_info.csv"))
# 
# 
# file.copy(file.path(path_to_vocabulary, "CONCEPT_ANCESTOR.csv"), file.path(path_output, "CONCEPT_ANCESTOR.csv"))
# file.copy(file.path(path_to_vocabulary, "DRUG_STRENGTH.csv"), file.path(path_output, "DRUG_STRENGTH.csv"))
# file.copy(file.path(path_to_vocabulary, "DOMAIN.csv"), file.path(path_output, "DOMAIN.csv"))
# file.copy(file.path(path_to_vocabulary, "RELATIONSHIP.csv"), file.path(path_output, "RELATIONSHIP.csv"))



