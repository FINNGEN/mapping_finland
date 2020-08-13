ATC source vocabulary
================

## Import Vocabulary

ATC is already in OMOP. Can be extract from the vocabularies.

``` r
atc_source <- read_table_concept(path_vocabulary_tables) %>% filter(vocabulary_id == "ATC")
```

## Create CONCEPT table

``` r
write_csv(atc_source, "CONCEPT_ATC.csv")
```

## Notes

I notice that few old codes are missing and reported in the forum ([see
post](https://forums.ohdsi.org/t/atc-alterations-missing-in-omop/11496/3)).
In sort, ATC releases do not incude these any more and are out of the
OMOP pipeline, but they could be included.

ATC modifications were downloaded from
<https://www.whocc.no/atc_ddd_alterations__cumulative/atc_alterations/>
and shaved in [./atc\_modifications.csv](./atc_modifications.csv)

``` r
atc_changes <- read_csv("./atc_modifications.csv") %>% 
  mutate_at(vars(previous_atc_code, new_atc_code), str_replace, "\\s[:digit:]+\\)", "")
```

    ## Parsed with column specification:
    ## cols(
    ##   previous_atc_code = col_character(),
    ##   substance_name = col_character(),
    ##   new_atc_code = col_character(),
    ##   year_of_change = col_double()
    ## )

``` r
missing_atc_in_omop <- full_join(
  atc_source %>% select(concept_code, concept_id), 
  atc_changes %>%  rename(concept_code = previous_atc_code),
  by="concept_code"
) %>% 
  filter(is.na(concept_id))
```

``` r
write_csv(missing_atc_in_omop, "./missing_atc_in_omop.csv")
```

These not in OMOP are saved in
[./missing\_atc\_in\_omop.csv](./missing_atc_in_omop.csv)

**In finggen there are also some E codes**

**From Ari Ahola-Olli:** E can be found from there. But the reason why
they are not in WHO database is that they are not actual drugs.
