Auto mapping ICPC to ICD10who
================

## Load

``` r
icpc2_standard <- read_tsv("../1_source_files/ICPC2_merged_and__ICPC1_from_DF6_UTF8.txt")
icpc2_standard <- icpc2_standard %>%  select(Id_FIN, `Ensisijainen ICD-10_FIN`, `Short name_FIN`, shortTitle_ENG, ICPC_version) %>% 
  rename(main_icd10fi = `Ensisijainen ICD-10_FIN`, name_fin=`Short name_FIN`, name_eng=shortTitle_ENG)

freq_icpc2_finngen <- read_csv("../1_source_files/freq_ICPC2_finngen.csv", ) %>% select(-X1)
```

    ## Warning: Missing column names filled in: 'X1' [1]

``` r
#TODO in the future we should take from 3_mapping_table
ICD10fi_OMOP <- read_csv("../../ICD10fi/2_mapping_process/ICD10fi_matched_to_ICD10who.csv")
```

## Study ICPC codes

``` r
icpc2_standard <- icpc2_standard %>% 
  mutate(
    ICPC_version = if_else(str_detect(Id_FIN, "^-"), "ICPC2_proc", str_c("ICPC", ICPC_version)),
    is_mapped_to_ICD10fi = !is.na(main_icd10fi)
    )
```

Number of codes in each source already mapped to ICD10fi:

``` r
icpc2_standard %>% count(ICPC_version, is_mapped_to_ICD10fi)
```

    ## # A tibble: 4 x 3
    ##   ICPC_version is_mapped_to_ICD10fi     n
    ##   <chr>        <lgl>                <int>
    ## 1 ICPC1        FALSE                   20
    ## 2 ICPC2        FALSE                  697
    ## 3 ICPC2        TRUE                   686
    ## 4 ICPC2_proc   FALSE                   40

## Study ICPC codes in FinnGen

Number of unique ICPC2 codes in FinnGen data base (patients \>5) :

``` r
freq_icpc2_finngen %>% nrow()
```

    ## [1] 1011

Number of events:

``` r
n_events_tays <- freq_icpc2_finngen$n_codes %>% sum()
freq_icpc2_finngen <- freq_icpc2_finngen %>% mutate(freq_per = (n_codes/n_events_tays)*100)
```

**Is it any code in FinnGen marked as ICPC2 that is not on the standard
?**

``` r
finngen_join <- left_join(freq_icpc2_finngen %>% mutate(Id_FIN=CODE1), icpc2_standard, by = "Id_FIN")

finngen_join %>% filter(is.na(ICPC_version))
```

    ## # A tibble: 3 x 10
    ##   CODE1 n_codes n_patients freq_per Id_FIN main_icd10fi name_fin name_eng
    ##   <chr>   <dbl>      <dbl>    <dbl> <chr>  <chr>        <chr>    <chr>   
    ## 1 -1      37669        814   0.498  -1     <NA>         <NA>     <NA>    
    ## 2 -2       4283        353   0.0566 -2     <NA>         <NA>     <NA>    
    ## 3 F21       891        331   0.0118 F21    <NA>         <NA>     <NA>    
    ## # ... with 2 more variables: ICPC_version <chr>, is_mapped_to_ICD10fi <lgl>

Only 3 wich make less than 0.5% of the total\!\! (atleas with npat\<5)

Number of codes in each source already mapped to ICD10fi, removing these
that dont appear in FinnGen DF5:

``` r
finngen_join %>% filter(!is.na(ICPC_version)) %>% count(ICPC_version, is_mapped_to_ICD10fi)
```

    ## # A tibble: 4 x 3
    ##   ICPC_version is_mapped_to_ICD10fi     n
    ##   <chr>        <lgl>                <int>
    ## 1 ICPC1        FALSE                   14
    ## 2 ICPC2        FALSE                  302
    ## 3 ICPC2        TRUE                   652
    ## 4 ICPC2_proc   FALSE                   40

Great, most of ICPC with no map to ICD10fi are not used.

**What percentage of data already mapped ?**

``` r
finngen_join %>% filter(is_mapped_to_ICD10fi) %>% .$freq_per %>%  sum()
```

    ## [1] 95.56541

**What codes are not mapped and what percentage they take ?**

``` r
finngen_join %>% filter(!is_mapped_to_ICD10fi) %>% arrange(-freq_per) %>% 
  mutate(freq_per_text = percent(freq_per/100)) %>% 
  select(CODE1, n_codes, n_patients, freq_per, freq_per_text, name_eng)
```

    ## # A tibble: 356 x 6
    ##    CODE1 n_codes n_patients freq_per freq_per_text name_eng                     
    ##    <chr>   <dbl>      <dbl>    <dbl> <chr>         <chr>                        
    ##  1 A69     48618       1851   0.643  0.642503%     General and Unspecified, Oth~
    ##  2 -60     21464       6067   0.284  0.283654%     Result test/procedure        
    ##  3 -50     15703       3896   0.208  0.207520%     Medication/prescr/renewal    
    ##  4 -31     12643       7018   0.167  0.167081%     Medical examin/health eval p~
    ##  5 -44     11587       8225   0.153  0.153126%     Preventive immunization/medic
    ##  6 A48      9300       3417   0.123  0.122903%     General and Unspecified, Cla~
    ##  7 A60      7806       4101   0.103  0.103159%     General and Unspecified, Res~
    ##  8 -69      6629       3851   0.0876 0.087604%     Other reason for encounter N~
    ##  9 A44      6191       4888   0.0818 0.081816%     General and Unspecified, Pre~
    ## 10 -34      5654       2584   0.0747 0.074720%     Blood test                   
    ## # ... with 346 more rows

# Summary

From 1443 ICPC codes, only 686 are mapped to ICD10fi.

However, the mapped ones account for the 95.5654095% of the codes in
FinnGen DF5.

These unmapped but used in FinnGen (\~4.4%) have quiet empty
definitions, such as “General and Unspecified, Other reason for
encounter NEC”, “Result test/procedure”, may not be worth mapping them.

At the moment we wont use USAGI.
