Prepare SPAT codes for USAGI
================

## Load

``` r
spat_standard <- read_excel("./SPAT_FIN_THLplusENG.xlsx")
freq_spat_finngen <- read_csv("./freq_spat_finngen.csv") %>% select(-X1)
```

Number of codes in each source:

``` r
spat_standard %>%  nrow()
```

    ## [1] 415

``` r
freq_spat_finngen %>%  nrow()
```

    ## [1] 332

Number of SPAT events in finngen :

``` r
n_events_finngen <- freq_spat_finngen$n_codes %>% sum()

number(n_events_finngen)
```

    ## [1] "6 113 573"

## Study codes in FinnGen

``` r
finngen_join <- left_join(freq_spat_finngen %>% rename(CodeId=CODE1), spat_standard, by = "CodeId") %>%
  mutate( freq_finngen_per=percent(n_codes/n_events_finngen))
```

**How many codes labeled as SPAT in FinnGen are not in the SPAT standard
?**

``` r
no_finngen_standard <- finngen_join %>% filter(is.na(ShortName)) %>% select(CodeId, ShortName, CodeId, n_codes) 
```

There are 9 codes not found in the standard:

``` r
no_finngen_standard 
```

    ## # A tibble: 9 x 3
    ##   CodeId ShortName n_codes
    ##   <chr>  <chr>       <dbl>
    ## 1 -1     <NA>          847
    ## 2 -2     <NA>           52
    ## 3 XLD00  <NA>           26
    ## 4 WW200  <NA>           14
    ## 5 OAA11  <NA>            8
    ## 6 OAB30  <NA>            8
    ## 7 JFA15  <NA>            7
    ## 8 OAB47  <NA>            7
    ## 9 OAA70  <NA>            6

Great, only typos and the -1, -2 error codes

``` r
finngen_standard <- finngen_join %>% filter(!is.na(ShortName)) %>% select(CodeId, n_codes, freq_finngen_per, LongName, ENGLongName, Description, HierarchyLevel, BeginningDate, ExpiringDate, LastModifiedDate)
finngen_standard
```

    ## # A tibble: 323 x 10
    ##    CodeId n_codes freq_finngen_per LongName ENGLongName Description
    ##    <chr>    <dbl> <chr>            <chr>    <chr>       <chr>      
    ##  1 SPAT1~ 1155579 18.901860%       Lääkkee~ Administra~ suun tai m~
    ##  2 SPAT1~  535003 8.751069%        Ei toim~ No procedu~ palvelutap~
    ##  3 SPAT1~  503814 8.240909%        Itsenäi~ Counsellin~ vajaakykyi~
    ##  4 SPAT1~  404915 6.623214%        Ravitse~ Counsellin~ ravitsemuk~
    ##  5 SPAT1~  306836 5.018931%        Potilaa~ Taking car~ potilaan/a~
    ##  6 SPAT1~  258797 4.233155%        Muu SHT~ Other func~ SPAT-luoki~
    ##  7 SPAT1~  249949 4.088428%        Lihas- ~ Intramuscu~ hoitavan a~
    ##  8 SPAT1~  219239 3.586103%        Näyttee~ Sampling    näytteenot~
    ##  9 SPAT1~  187380 3.064983%        Kroonis~ Comprehens~ kroonisen ~
    ## 10 SPAT1~  176470 2.886528%        Lääkity~ Initiation~ lääkitykse~
    ## # ... with 313 more rows, and 4 more variables: HierarchyLevel <dbl>,
    ## #   BeginningDate <dttm>, ExpiringDate <dttm>, LastModifiedDate <dttm>

``` r
finngen_standard <- finngen_standard %>% mutate_if(is.numeric, ~if_else(is.na(.), rep(0, length(.)), .)) 

write_csv(finngen_standard, "./standard_spat_with_freq.csv")
```
