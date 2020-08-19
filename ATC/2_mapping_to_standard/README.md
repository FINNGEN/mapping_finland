ATC mappings
================

## Mapping type : OMOP

ATC mapping is partially provided by OMOP. Can be extract from the
vocabularies.

``` r
atc_concept <- read_csv("../1_source_vocabulary/CONCEPT_ATC.csv")

mapsto <- read_table_concept_relationship_mapsto(path_vocabulary_tables)

atc_mapsto <- mapsto %>% 
  filter(concept_id_1 %in% atc_concept$concept_id) %>% 
  mutate(tmp_mapping_type = "OMOP")
```

``` r
write_csv(atc_mapsto, "CONCEPT_RELATIONSHIP_ATC.csv")
```
