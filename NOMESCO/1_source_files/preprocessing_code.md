Prepare NOMESCO codes for USAGI
================

## Load

``` r
nomesco_standard <- read_delim("./standard_nomesco_kodistopalvelu_119_1510562053330.txt", delim = ";",
                               locale = locale(encoding = "ISO-8859-1"), 
                               col_types = cols( .default = col_character() ))
freq_nomesco_finngen <- read_csv("./freq_nomesco_finngen.csv", )
freq_procedures_tays <- read_csv("./freq_procedures_tays.csv",locale = locale(encoding = "ISO-8859-1"))
```

Number of codes in each source:

``` r
nomesco_standard %>%  nrow()
```

    ## [1] 11286

``` r
freq_nomesco_finngen %>%  nrow()
```

    ## [1] 5363

``` r
freq_procedures_tays  %>%  nrow()
```

    ## [1] 6641

Number of events in each data base :

``` r
n_events_finngen <- freq_nomesco_finngen$freq %>% sum()
n_events_tays <- freq_procedures_tays$yhteensa %>% sum()

n_events_finngen
```

    ## [1] 5816831

``` r
n_events_tays
```

    ## [1] 4583326

## Study codes in FinnGen

``` r
finngen_join <- full_join(nomesco_standard , freq_nomesco_finngen %>% mutate(CodeId=CODE1) %>%  rename(freq_finngen=freq), by = "CodeId")
```

**How many codes labeled as NOMESCO in FinnGen are not in the NOMESCO
standard ?**

``` r
no_finngen_standard <- finngen_join %>% filter(is.na(ShortName)) %>% select(CodeId, ShortName, CODE1, freq_finngen) %>%
  mutate( freq_finngen_per=percent(freq_finngen/n_events_finngen))
```

There are 260 codes not found in the standard:

``` r
no_finngen_standard 
```

    ## # A tibble: 260 x 5
    ##    CodeId ShortName CODE1 freq_finngen freq_finngen_per
    ##    <chr>  <chr>     <chr>        <dbl> <chr>           
    ##  1 XLA10  <NA>      XLA10         7408 0.127355%       
    ##  2 RD211  <NA>      RD211         3200 0.055013%       
    ##  3 XF640  <NA>      XF640         2477 0.042583%       
    ##  4 1LA05  <NA>      1LA05         1632 0.028057%       
    ##  5 1XC03  <NA>      1XC03         1619 0.027833%       
    ##  6 WQ066  <NA>      WQ066         1300 0.022349%       
    ##  7 4AA12  <NA>      4AA12         1102 0.018945%       
    ##  8 6BA02  <NA>      6BA02          993 0.017071%       
    ##  9 1XC02  <NA>      1XC02          830 0.014269%       
    ## 10 1XC07  <NA>      1XC07          774 0.013306%       
    ## # ... with 250 more rows

Save these as: `finngen_codes_not_in_nomesco.csv`

``` r
write_csv(no_finngen_standard, "./finngen_codes_not_in_nomesco.csv")
```

``` r
finngen_standard <- finngen_join %>% filter(!is.na(ShortName)) %>% select(CodeId, freq_finngen)
```

## Study codes in TAYS

``` r
tays_join <- full_join(nomesco_standard , freq_procedures_tays %>% mutate(CodeId=TOIMENPIDE) %>%  rename(freq_tays=yhteensa), by = "CodeId")
```

**How many codes labeled as NOMESCO in FinnGen are not in the NOMESCO
standard ?**

``` r
no_tays_standard <- tays_join %>% filter(is.na(ShortName)) %>% select(CodeId, ShortName, TOIMENPIDE, freq_tays) %>%
  mutate( freq_tays_per=percent(freq_tays/n_events_tays))
```

There are 1115 codes not found in the standard.

``` r
no_tays_standard 
```

    ## # A tibble: 1,115 x 5
    ##    CodeId ShortName TOIMENPIDE freq_tays freq_tays_per
    ##    <chr>  <chr>     <chr>          <dbl> <chr>        
    ##  1 S2600  <NA>      S2600         181056 3.950319%    
    ##  2 H0434  <NA>      H0434          55791 1.217260%    
    ##  3 H0519  <NA>      H0519          52053 1.135704%    
    ##  4 RS221  <NA>      RS221          22833 0.498175%    
    ##  5 H0275  <NA>      H0275          21465 0.468328%    
    ##  6 H0142  <NA>      H0142          20850 0.454910%    
    ##  7 H0113  <NA>      H0113          20668 0.450939%    
    ##  8 H0188  <NA>      H0188          19077 0.416226%    
    ##  9 H0130  <NA>      H0130          16341 0.356531%    
    ## 10 H0476  <NA>      H0476          16253 0.354611%    
    ## # ... with 1,105 more rows

Save these as: `tays_codes_not_in_nomesco.csv`

``` r
write_csv(no_tays_standard, "./tays_codes_not_in_nomesco.csv")
```

``` r
tays_standard <- tays_join %>% filter(!is.na(ShortName)) %>% select(CodeId, freq_tays)
```

# Merge all

``` r
tmp <- left_join(nomesco_standard, finngen_standard, by = "CodeId")
nomesco_standard_with_freqs <- left_join(tmp ,  tays_standard, by = "CodeId")
```

``` r
nomesco_standard_with_freqs <- nomesco_standard_with_freqs %>%   mutate(freq_total = (freq_finngen+freq_tays))

nomesco_standard_with_freqs %>%  arrange(-freq_total) %>%  select(CodeId,  freq_finngen, freq_tays, freq_total) %>% 
  mutate(freq_total_per = scales::percent(freq_total/(n_events_finngen+n_events_tays))) 
```

    ## # A tibble: 11,300 x 5
    ##    CodeId freq_finngen freq_tays freq_total freq_total_per
    ##    <chr>         <dbl>     <dbl>      <dbl> <chr>         
    ##  1 TK800        217138    120193     337331 3.2435183%    
    ##  2 GD1AA        128466    190792     319258 3.0697421%    
    ##  3 Z3231        311458        91     311549 2.9956182%    
    ##  4 ZXE00         98819     83305     182124 1.7511659%    
    ##  5 ZX012        102925     76420     179345 1.7244451%    
    ##  6 ZX070         12955    161676     174631 1.6791189%    
    ##  7 WF003         47132    114193     161325 1.5511785%    
    ##  8 WX408         31777    113618     145395 1.3980077%    
    ##  9 ZXD10        136428        72     136500 1.3124802%    
    ## 10 WF002         44495     89472     133967 1.2881248%    
    ## # ... with 11,290 more rows

Save as: `standard_nomesco_with_freq.csv`

``` r
nomesco_standard_with_freqs <- nomesco_standard_with_freqs %>% mutate_if(is.numeric, ~if_else(is.na(.), rep(0, length(.)), .)) 

write_csv(nomesco_standard_with_freqs %>% select(CodeId, LongName, ParentId, HierarchyLevel, BeginningDate, ExpiringDate, LastModifiedDate,
                                 `A:Long_name`, freq_finngen, freq_tays, freq_total), "./standard_nomesco_with_freq.csv")
```
