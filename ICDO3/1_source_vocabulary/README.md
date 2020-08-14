ICDO3 source vocabulary
================

## Import Vocabulary

ICDO3 is already in OMOP. Can be extract from the vocabularies.

``` r
atc_source <- read_table_concept(path_vocabulary_tables) %>% filter(vocabulary_id == "ICDO3")
```

## Create CONCEPT table

``` r
write_csv(atc_source, "CONCEPT_ICDO3.csv")
```
