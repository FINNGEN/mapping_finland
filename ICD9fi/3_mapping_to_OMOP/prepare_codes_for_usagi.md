Prepare ICD9fi codes for USAGI
================

## Load

``` r
icd9fi <- read_csv("../2_source_codes/THL_ICD9fi_matched_ICD9CM_and_Wolfbane_ICD9.csv") 
freq_icd9fi_finngen <- read_csv("../1_source_codes_freq/freq_icd9fi_finngen.csv") %>% select(-X1)
```

## Join freqs

``` r
n_events_finngen <- freq_icd9fi_finngen$n_codes %>% sum()

finngen_join <- left_join(freq_icd9fi_finngen %>% rename(ICD9=CODE1), icd9fi, by = "ICD9") %>%
  mutate( freq_finngen_per=percent(n_codes/n_events_finngen))

finngen_standard <- finngen_join %>% filter(!is.na(concept_name)) %>% 
  select(ICD9, n_codes, freq_finngen_per, ICD9TXT , concept_name) %>% 
  rename(Finnish_name=ICD9TXT, possible_english_name=concept_name)
finngen_standard
```

    ## # A tibble: 2,886 x 5
    ##    ICD9  n_codes freq_finngen_per Finnish_name        possible_english_name     
    ##    <chr>   <dbl> <chr>            <chr>               <chr>                     
    ##  1 6500B   25827 6.46140%         PARTUS SINE COMPLI~ Normal delivery           
    ##  2 V252A    8223 2.05723%         STERILISAATIO       Sterilization             
    ##  3 7890A    6404 1.60215%         DOLORES ABDOMINIS   Abdominal pain            
    ##  4 2500B    5945 1.48732%         DIABETES MELLITUS ~ Diabetes mellitus without~
    ##  5 4549X    5619 1.40576%         VARICES VENARUM EX~ Asymptomatic varicose vei~
    ##  6 2180A    5237 1.31019%         LEIOMYOMA UTERI     Submucous leiomyoma of ut~
    ##  7 7227C    4493 1.12406%         SYNDROMA ISCHIADIC~ Intervertebral disc disor~
    ##  8 6350C    4361 1.09104%         ABORTUS PROV LEGAL~ Legally induced abortion ~
    ##  9 4019X    3404 0.85161%         HYPERTONIA ARTERIA~ Unspecified essential hyp~
    ## 10 3039X    3153 0.78882%         ALKOHOLIRIIPPUVUUS  Other and unspecified alc~
    ## # ... with 2,876 more rows

``` r
finngen_standard <- finngen_standard %>% mutate_if(is.numeric, ~if_else(is.na(.), rep(0, length(.)), .)) 

write_csv(finngen_standard, "./standard_icd9fi_with_freq.csv")
```
