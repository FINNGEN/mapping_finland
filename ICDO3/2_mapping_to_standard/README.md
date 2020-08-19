ICDO3 mappings
================

## Mapping type : OMOP

ICDO3 mapping is partially provided by OMOP. Can be extract from the
vocabularies.

``` r
icdo3_concept <- read_csv("../1_source_vocabulary/CONCEPT_ICDO3.csv")

mapsto <- read_table_concept_relationship_mapsto(path_vocabulary_tables)

icdo3_mapsto <- mapsto %>% 
  filter(concept_id_1 %in% icdo3_concept$concept_id) %>% 
  mutate(tmp_mapping_type = "OMOP")
```

``` r
write_csv(icdo3_mapsto, "CONCEPT_RELATIONSHIP_ICDO3.csv")
```
