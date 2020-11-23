
# settings ----------------------------------------------------------------
path_to_vocabulary <- r"(C:\Users\javier\WorkSpace\OMOP_vocab_for_finngen)"
path_to_repo <- r"(C:\Users\javier\OneDrive - TUNI.fi\Documents\TAYS\PROJECTS\OHDSI\MAPPING\REPOS\mapping_finland)"
path_output <- r"(C:\Users\javier\WorkSpace\FGCodes)"


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
  "ICPC",           10*10^8L,
  "NOMESCOfi",      11*10^8L,
  "REIMB",           12*10^8L,
  "SPAT",           13*10^8L,
  "ICD10fi",         9*10^8L,
)


# Init table --------------------------------------------------------------
FGCodes <- tibble()

# append ------------------------------------------------------------------

for (i in 1:(nrow(append_vocabs)-1)) {
    
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
    mutate(concept_id = concept_id + offset_concept_id) %>% 
    transmute(
      vocabulary_id =  vocabulary_id, 
      concept_class_id = concept_class_id, 
      code = concept_code, 
      name_en = concept_name, 
      name_fi = tmp_name_fi, 
      name_en_source = tmp_name_en_source, 
      OMOP_concept_id = concept_id, 
      FG_CODE1 = code, 
      valid_start_date = valid_start_date,
      valid_end_date = valid_end_date
    ) %>% 
    filter(!(vocabulary_id %in% c("Vocabulary", "Concept Class")))
  
  FGCodes <- bind_rows(
    FGCodes,
    concept_vocab
  )

}


# ICD10 ------------------------------------------------------------------
i<-7

vocabulary_name <- append_vocabs[i,]$vocabulary_name
offset_concept_id <- append_vocabs[i,]$offset_concept_id

concept_vocab <- read_csv(
  file.path(path_to_repo, vocabulary_name, "1_source_vocabulary", str_c("CONCEPT_", vocabulary_name, ".csv")),
  col_types = cols(
    concept_id = col_integer(),
    valid_start_date = col_date(format = ""),
    valid_end_date = col_date(format = ""),
    .default = col_character()
  )
)%>%
  mutate(concept_id = concept_id + offset_concept_id) %>% 
  transmute(
    vocabulary_id =  vocabulary_id, 
    concept_class_id = concept_class_id, 
    code = concept_code, 
    name_en = concept_name, 
    name_fi = tmp_name_fi, 
    name_en_source = tmp_name_en_source, 
    OMOP_concept_id = concept_id, 
    FG_CODE1 = str_replace( tmp_code1_code, "\\.", ""),
    FG_CODE2 = str_replace( tmp_code2_code, "\\.", ""), 
    valid_start_date = valid_start_date,
    valid_end_date = valid_end_date
  ) %>% 
  filter(!(vocabulary_id %in% c("Vocabulary", "Concept Class"))) %>% 
  arrange(code) %>% distinct(FG_CODE1, FG_CODE2, .keep_all = T)

  FGCodes <- bind_rows(
    FGCodes,
    concept_vocab
  )

# ICDO3 ------------------------------------------------------------------
vocabulary_name <- "ICDO3"

concept_vocab <- read_csv(
  file.path(path_to_repo, vocabulary_name, "1_source_vocabulary", str_c("CONCEPT_", vocabulary_name, ".csv")),
  col_types = cols(
    concept_id = col_integer(),
    valid_start_date = col_date(format = ""),
    valid_end_date = col_date(format = ""),
    .default = col_character()
  )
)%>%
  filter(str_detect(concept_name, "NULL")) %>% 
  mutate(concept_id = concept_id + offset_concept_id) %>% 
  transmute(
    vocabulary_id =  vocabulary_id, 
    concept_class_id = concept_class_id, 
    code = concept_code, 
    name_en = concept_name, 
    name_fi = as.character(NA), 
    name_en_source = as.character(NA), 
    OMOP_concept_id = concept_id, 
    FG_CODE1 = concept_code %>% str_replace("\\.", "") %>% str_extract("[:alpha:][:digit:]+"),
    FG_CODE2 = concept_code %>% str_extract("^[:digit:]+/") %>% str_replace( "/", ""),
    FG_CODE3 = concept_code %>% str_extract("/[:digit:]") %>% str_replace( "/", "") , 
    valid_start_date = valid_start_date,
    valid_end_date = valid_end_date
    
  ) %>% 
  filter(!(vocabulary_id %in% c("Vocabulary", "Concept Class")))

FGCodes <- bind_rows(
  FGCodes,
  concept_vocab
)  

# ATC ------------------------------------------------------------------
vocabulary_name <- "ATC"

concept_vocab <- read_csv(
  file.path(path_to_repo, vocabulary_name, "1_source_vocabulary", str_c("CONCEPT_", vocabulary_name, ".csv")),
  col_types = cols(
    concept_id = col_integer(),
    valid_start_date = col_date(format = ""),
    valid_end_date = col_date(format = ""),
    .default = col_character()
  )
)%>%
  mutate(concept_id = concept_id + offset_concept_id) %>% 
  transmute(
    vocabulary_id =  vocabulary_id, 
    concept_class_id = concept_class_id, 
    code = concept_code, 
    name_en = concept_name, 
    name_fi = as.character(NA), 
    name_en_source = as.character(NA), 
    OMOP_concept_id = concept_id, 
    FG_CODE1 = concept_code, 
    valid_start_date = valid_start_date,
    valid_end_date = valid_end_date
    
  ) %>% 
  filter(!(vocabulary_id %in% c("Vocabulary", "Concept Class")))

FGCodes <- bind_rows(
  FGCodes,
  concept_vocab
)  
  
# TEMP FIX
FGCodes <- FGCodes %>% 
  filter( !(vocabulary_id=="REIMB" & ( OMOP_concept_id %in% c(1200000005 , 1200000006, 1200000010))) )


# # save --------------------------------------------------------------------
FGCodes <- FGCodes %>% 
  select(vocabulary_id, concept_class_id, code,  
         name_en, name_fi, name_en_source, 
         OMOP_concept_id, 
         FG_CODE1, FG_CODE2, FG_CODE3, 
         valid_start_date, valid_end_date )

write_csv(FGCodes, file.path(path_output, "FGCodes.csv"))
# write_csv(vocabulary, file.path(path_output, "VOCABULARY.csv"))
# write_csv(concept_class, file.path(path_output, "CONCEPT_CLASS.csv"))
# write_csv(concept_synonym, file.path(path_output, "CONCEPT_SYNONYM.csv"))
# write_csv(concept_relationship, file.path(path_output, "CONCEPT_RELATIONSHIP.csv"))
# 
# file.copy(file.path(path_to_vocabulary, "CONCEPT_ANCESTOR.csv"), file.path(path_output, "CONCEPT_ANCESTOR.csv"))
# file.copy(file.path(path_to_vocabulary, "DRUG_STRENGTH.csv"), file.path(path_output, "DRUG_STRENGTH.csv"))
# file.copy(file.path(path_to_vocabulary, "DOMAIN.csv"), file.path(path_output, "DOMAIN.csv"))
# file.copy(file.path(path_to_vocabulary, "RELATIONSHIP.csv"), file.path(path_output, "RELATIONSHIP.csv"))
# 
# 

