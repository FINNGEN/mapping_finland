
require(tidyverse)
require(scales)

# Dynamic markdown functions
md_print_line<- function(...){
  cat(str_c(" \n",...," \n"))
}

md_print_table<- function(...){
  cat(knitr::knit_print(rmarkdown::paged_table(...)))
}

#vocabulary_name <- "ATC" ; concept_table <- atc_concept ;  mapsto_table <- atc_mapsto ; freq_table <- atc_freqs
database_coverage_md <- function(vocabulary_name, concept_table, mapsto_table, freq_table, atc_missing_in_omop = tibble()){
  
  # build table of codes mapping status
  mapping_status <- left_join(
    concept_table %>% select(concept_id, concept_code, concept_name), 
    mapsto_table %>% distinct(concept_id_1, tmp_mapping_type) %>% rename(concept_id = concept_id_1), 
    by="concept_id"
  )
  
  # get database names from freq tables 
  db_names <- freq_table %>% select(starts_with("freq_")) %>% names() %>% setdiff("freq_total") %>% str_replace("freq_","")
  
  #for each data base
  for(db_name in db_names){
    
    # get only preset database info 
    db_freq <- freq_table %>% 
      select(starts_with("code"), str_c("freq_",db_name)) %>% 
      rename(freq = str_c("freq_",db_name)) %>% 
      filter(!is.na(freq))
    
    n_total_envents <- sum(db_freq$freq)
    
    # join mapping status with freq 
    if(vocabulary_name=="ICD10fi"){ # special case for ICD10fi
      db_mapping_status <- left_join(
        db_freq,
        mapping_status %>% 
          mutate(
            code1 = str_extract(concept_code, "^[:alnum:][:alnum:][:alnum:]\\.?[:alnum:]?[:alnum:]?"),
            code1 = str_replace(code1,"\\.",""),
            code2 = str_extract(concept_code, "(\\+|\\*|\\#|\\&)[:alnum:][:alnum:][:alnum:]\\.?[:alnum:]?[:alnum:]?"),
            code2 = str_replace(code2,"\\+|\\*|\\#|\\&",""),
            code2 = str_replace(code2,"\\.","")
          ),
        by = c("code1","code2") 
      ) %>%
        mutate( freq_per=percent(freq/n_total_envents, accuracy = 0.001)) %>% 
        arrange(-freq)
      
      db_mapping_status <- db_mapping_status %>% 
        mutate(concept_id = case_when(
          #is.na(concept_id) & is.na(code1) & !is.na(code2) ~ 1,
          #is.na(concept_id) & !is.na(code1) & is.na(code2) ~ 1,
          is.na(concept_id) & code1 == code2 ~ 1,
          TRUE ~ concept_id
          )
        )
      
      db_missing <- db_mapping_status %>%
        filter(is.na(concept_id)) %>% 
        select(code1, code2, freq, freq_per)
    }else{
      db_mapping_status <- left_join(
        db_freq %>% rename(concept_code=code),
        mapping_status,
        by = "concept_code") %>%
        mutate( freq_per=percent(freq/n_total_envents, accuracy = 0.001)) %>% 
        arrange(-freq)
      
      db_missing <- db_mapping_status %>%
        filter(is.na(concept_id)) %>% 
        select(concept_code, freq, freq_per)
    }
    
    #save not found codes
    save_db_missing_path <- str_c("./3_freq_of_source_codes/",db_name,"_not_in_", vocabulary_name,".csv")
    write_csv(db_missing, save_db_missing_path )
    
    # calculate status count
    db_status <- db_mapping_status %>% 
      mutate(status = case_when( 
        is.na(concept_id) ~ "not_found",  
        is.na(tmp_mapping_type) ~ "not_mapped", 
        TRUE ~ "mapped"
      )
      ) %>% 
      mutate(status = factor(status, levels = c("mapped", "not_mapped",  "not_found"))) %>% 
      group_by(status) %>% 
      summarise(n_codes=n(), 
                per_codes= percent(n_codes/nrow(.), accuracy = 0.001),
                n_events = sum(freq), 
                per_events= percent(n_events/sum(.$freq), accuracy = 0.001), 
                .groups = 'drop')
    
    db_statuses <- bind_rows(db_statuses, db_status %>% mutate(db_name = db_name))
    
    
    # plot markdown 
    md_print_line()
    md_print_line("## Database ", db_name)
    
    md_print_line("**How many codes labeled as ", vocabulary_name," in ", db_name," are not in the atc standard?**")
    
    md_print_line("There are ", scales::number(db_missing %>% nrow())," codes not found in the standard")
    
    md_print_line("Top", N_TOPS," sorted by freq:")
    
    md_print_table(db_missing %>% head(N_TOPS))
    
    md_print_line("The full list can be found in [",save_db_missing_path,"](",save_db_missing_path,")")
    
    
    md_print_line("**Status of the ", vocabulary_name," codes in", db_name, "**")
    
    md_print_table(db_status)
    
    
    
    ##-----------------------------------------------
    ##  Vocabulary specific calculations 
    ##-----------------------------------------------
    
    if(vocabulary_name == "ATC"){
      
      # reason not found
      db_missing_reason <- left_join(
        db_missing,
        atc_missing_in_omop %>% mutate(is_not_in_omop = TRUE) %>% select(concept_code, is_not_in_omop),
        by="concept_code"
      ) %>%
        # check if an E))) code
        mutate(reason_not_found = case_when(
          str_detect(concept_code, "^E")~ "ATC starst with E",
          !is.na(is_not_in_omop)~ "Excluded from ATC releases",
          TRUE ~ "unknown"
        ))
      
      db_missing_reasons <- db_missing_reason %>%
        group_by(reason_not_found) %>%
        summarise(n_codes=n(),
                  per_codes= percent(n_codes/nrow(db_mapping_status), accuracy = 0.001),
                  n_events = sum(freq),
                  per_events= percent(n_events/sum(db_mapping_status$freq), accuracy = 0.001),
                  .groups = 'drop')
      
      md_print_line("**Reasons why not found**")
      
      md_print_table(db_missing_reasons)
      
      md_print_line("Top", N_TOPS," of unknown sorted by freq:")
      
      md_print_table(db_missing_reason %>% 
                       filter(reason_not_found=="unknown") %>% 
                       select(concept_code, freq, freq_per ) %>%
                       head(N_TOPS)
      )
      
    }
    
    
  }
  
}

