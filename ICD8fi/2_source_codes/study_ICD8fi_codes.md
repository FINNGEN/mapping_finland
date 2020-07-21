Study ICD8fi codes
================

## Load

``` r
icd8fi_standard <- read_tsv("./ICD8Merged_Version5_UTF8.txt") %>% filter(!is.na(Code))
freq_icd8fi_finngen <- read_csv("../1_source_codes_freq/freq_icd8fi_finngen.csv") %>% select(-X1)
```

Number of codes in each source:

``` r
icd8fi_standard %>%  nrow()
```

    ## [1] 6907

``` r
freq_icd8fi_finngen %>%  nrow()
```

    ## [1] 2778

Number of icd8fi events in finngen :

``` r
n_events_finngen <- freq_icd8fi_finngen$n_codes %>% sum()

number(n_events_finngen)
```

    ## [1] "434 302"

## Study codes in FinnGen

``` r
finngen_join <- left_join(freq_icd8fi_finngen %>% rename(Code=CODE1), icd8fi_standard, by = "Code") %>%
  mutate( freq_finngen_per=percent(n_codes/n_events_finngen))
```

**How many codes labeled as icd8fi in FinnGen are not in the icd8fi
standard ?**

``` r
no_finngen_standard <- finngen_join %>% filter(is.na(DF6_Freq)) %>% select(Code, n_codes, freq_finngen_per, Finnish, English) 
```

There are 229 codes not found in the standard:

``` r
no_finngen_standard 
```

    ## # A tibble: 229 x 5
    ##    Code  n_codes freq_finngen_per Finnish English
    ##    <chr>   <dbl> <chr>            <chr>   <chr>  
    ##  1 00000    2402 0.55307%         <NA>    <NA>   
    ##  2 62550     501 0.11536%         <NA>    <NA>   
    ##  3 38699     395 0.09095%         <NA>    <NA>   
    ##  4 61200     238 0.05480%         <NA>    <NA>   
    ##  5 66170     221 0.05089%         <NA>    <NA>   
    ##  6 64094     162 0.03730%         <NA>    <NA>   
    ##  7 62551     155 0.03569%         <NA>    <NA>   
    ##  8 46300     141 0.03247%         <NA>    <NA>   
    ##  9 0         134 0.03085%         <NA>    <NA>   
    ## 10 22005     127 0.02924%         <NA>    <NA>   
    ## # ... with 219 more rows

Lot of codes missing, not so much in absolute terms 1.9355195

``` r
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
