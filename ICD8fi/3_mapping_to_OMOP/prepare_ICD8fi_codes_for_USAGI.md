Study ICD8fi codes
================

## Load

``` r
icd8fi <- read_tsv("../2_source_codes/ICD8Merged_Version5_UTF8.txt") %>% filter(!is.na(Code))
freq_icd8fi_finngen <- read_csv("../1_source_codes_freq/freq_icd8fi_finngen.csv") %>% select(-X1)
```

## Append freq to the ICD8fi codes

``` r
n_events_finngen <- freq_icd8fi_finngen$n_codes %>% sum()

finngen_join <- left_join(freq_icd8fi_finngen %>% rename(Code=CODE1), icd8fi, by = "Code") %>%
  mutate( freq_finngen_per=percent(n_codes/n_events_finngen))

finngen_standard <- finngen_join %>% filter(!is.na(DF6_Freq)) %>% select(Code, n_codes, freq_finngen_per, Finnish, English)
finngen_standard
```

    ## # A tibble: 2,549 x 5
    ##    Code  n_codes freq_finngen_per Finnish                 English               
    ##    <chr>   <dbl> <chr>            <chr>                   <chr>                 
    ##  1 65000   45761 10.53668%        Synnytys, ei tietoa ko~ Delivery without ment~
    ##  2 50099   12916 2.97397%         Kitarisojen ja nielun ~ Hypertrophy of tonsil~
    ##  3 45499    6934 1.59658%         Suonikohjut alaraajois~ Varicose veins of low~
    ##  4 25000    6297 1.44991%         Sokeritauti, Sine comp~ Diabetes mellitus, Si~
    ##  5 64199    6134 1.41238%         Muun laillisen syyn pe~ Abortion induced for ~
    ##  6 46599    5704 1.31337%         Infektio ylemmissä hen~ Acute upper respirato~
    ##  7 49300    5473 1.26018%         Astma, Asthma bronchia~ Asthma, bronchiale    
    ##  8 Y6099    5080 1.16969%         Syntymää edeltävä hoit~ Prenatal care and obs~
    ##  9 64091    4373 1.00690%         Lääketieteellisestä sy~ <NA>                  
    ## 10 21899    4208 0.96891%         Kohdun sidekudoskasvain Uterine fibroma       
    ## # ... with 2,539 more rows

``` r
finngen_standard <- finngen_standard %>% mutate_if(is.numeric, ~if_else(is.na(.), rep(0, length(.)), .)) 

write_csv(finngen_standard, "./standard_icd8fi_with_freq.csv")
```
