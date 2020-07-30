Auto mapping ICD10fi to ICD10who
================

  - [Load ICD10fi and ICD10who](#load-icd10fi-and-icd10who)
  - [Study codes](#study-codes)
      - [Matchind codes to ICD10who](#matchind-codes-to-icd10who)
          - [How many “1 code” are a direct match
            ??](#how-many-1-code-are-a-direct-match)
          - [How well these agree in the definition
            ??](#how-well-these-agree-in-the-definition)
          - [How many concepts are in ICD10who but have a different
            code?](#how-many-concepts-are-in-icd10who-but-have-a-different-code)
      - [Prepare un matched “1 code” and “2 code” for
        USAGI](#prepare-un-matched-1-code-and-2-code-for-usagi)
  - [Check mapping status in “2 code
    generated”](#check-mapping-status-in-2-code-generated)
  - [join all a save](#join-all-a-save)

# Load ICD10fi and ICD10who

``` r
col_types = cols(
  CodeId1=col_character(), 
  CodeId2=col_character()
)

ICD10fi <- read_csv("../1_source_vocabulary/ICD10_for_source_vocabulary_extended.csv", col_types = col_types)


ICD10who_OMOP <- read_csv("./OMOP_ICD10who.csv") %>% select(concept_code, concept_name)
```

# Study codes

Total number of codes

``` r
ICD10fi  %>% nrow
```

    ## [1] 68780

In the Finnish version of the ICD10 there are two types of additional
codes.

  - Classification codes: describe ranges of codes other than the
    conventional ICD10 hierarchy
      - `CodeA-CodeB` : from CodeA to CodeB
  - Reason codes: combine codes to add more info on what caused the
    diagnose, there are 4 marks
      - `CodeA*CodeB` : ”Oirekoodi”, - -CodeA etiology/due to CodeB –
      - `CodeA+CodeB` : ”Syykoodi”, – CodeB happening in CodeA–
      - `CodeA#CodeB` : ATC-koodi, CodeB is and ATC code indicating the
        medicine that caused CodeA
      - `CodeA&CodeB` : ”Kasvainkoodi”, CodeB is and endocrinological
        disorder code that caused CodeA

Several codes cover the same concept. They have the same LongName and
ShortName.

``` r
# same_concept <- ICD10fi %>% count(name_fi, sort = T) %>% filter(n>1) %>%  .$name_fi
# 
# ICD10fi %>% filter(name_fi %in% same_concept) %>% arrange(name_fi) %>% 
#   select(code, name_en, code1, code2)# %>%  print(n=100)
```

This is can be due to two reasons: - A concept exists on the table as to
be append to others “C55”, and to be used as diagnosis “c55&”. - Same
concept described as ”Oirekoodi” and ”Syykoodi”, e.g. J17.3\*B77.8
(Pneumonia in ascariasis) and B77.8+J17.3 (ascariasis caused by
Pneumonia)

**Distribution**

``` r
ICD10fi  %>% count(code_class)
```

    ## # A tibble: 4 x 2
    ##   code_class           n
    ##   <chr>            <int>
    ## 1 1 code           13346
    ## 2 2 code            1037
    ## 3 2 code generated 54099
    ## 4 classification     298

## Matchind codes to ICD10who

Try to match icd10fi’s “1 code” codes to icd10who by code and name.

Also try to match icd10fi’s “2 code” to icd10who by name.

### How many “1 code” are a direct match ??

If matching directly to ICD10fi code

``` r
ICD10fi_1code <- ICD10fi  %>% filter(code_class=="1 code")

ICD10fi_1code_full_match <- 
  inner_join(ICD10fi_1code,
             ICD10who_OMOP %>% rename(code = concept_code),
             by = "code")


ICD10fi_1code_full_match %>% nrow
```

    ## [1] 9587

If matching to ICD10fi code without any union-marks

``` r
ICD10fi_1code <- ICD10fi  %>% filter(code_class=="1 code")

ICD10fi_1code_full_match <- 
  inner_join(ICD10fi_1code,
             ICD10who_OMOP %>% rename(code1 = concept_code),
             by = "code1")


ICD10fi_1code_full_match %>% nrow
```

    ## [1] 10716

``` r
ICD10fi_1code_no_match <- ICD10fi  %>% filter(code_class=="1 code") %>% filter(!(code %in% ICD10fi_1code_full_match$code))
```

### How well these agree in the definition ??

Count the differences in characters (string distance) between the
English names of icd10fi and icd10who full matches

``` r
ICD10fi_1code_full_match <- ICD10fi_1code_full_match  %>% 
        mutate(English_name_match_level = stringdist(name_en,concept_name) ) 

ICD10fi_1code_full_match %>% 
        count(English_name_match_level) %>% head(20)
```

    ## # A tibble: 20 x 2
    ##    English_name_match_level     n
    ##                       <dbl> <int>
    ##  1                        0  8993
    ##  2                        1    95
    ##  3                        2   178
    ##  4                        3   225
    ##  5                        4   131
    ##  6                        5    18
    ##  7                        6     8
    ##  8                        7    34
    ##  9                        8     8
    ## 10                        9     4
    ## 11                       10    34
    ## 12                       11    22
    ## 13                       12     8
    ## 14                       13     7
    ## 15                       14    15
    ## 16                       15    16
    ## 17                       16    13
    ## 18                       17   144
    ## 19                       18    12
    ## 20                       19    58

Most (8993) match the name exactly\!\!, 226 NA for these with no English
name

``` r
ICD10fi_1code_almost_match   <- ICD10fi_1code_full_match %>% filter(English_name_match_level > 0)
```

#### Expert checked almost matches

``` r
ICD10fi_1code_almost_match %>% 
  select(code, name_en, concept_name, English_name_match_level) %>% 
  arrange(English_name_match_level) %>% 
  write_csv("icd10fi_almost_match_icd10who.csv")
```

These almost matching are saved in
[icd10fi\_almost\_match\_icd10who.csv](icd10fi_almost_match_icd10who.csv).

Name matching was confirmed or rejected by had by Helmi and save as
[icd10fi\_almost\_match\_icd10who\_CHECKED.csv](icd10fi_almost_match_icd10who_CHECKED.csv).

``` r
ICD10fi_1code_almost_match_CHECKED <- read_csv("icd10fi_almost_match_icd10who_CHECKED.csv")

not_matching_name_ids <- ICD10fi_1code_almost_match_CHECKED %>%  filter(accept==0) %>% .$CodeId
```

``` r
ICD10fi_1code_no_match <- bind_rows(
  ICD10fi_1code_no_match, 
  ICD10fi_1code_full_match %>% filter(code %in% not_matching_name_ids)
)

ICD10fi_1code_full_match <- ICD10fi_1code_full_match %>% filter(!(code %in% not_matching_name_ids)) %>% 
  mutate(Mapping_type="ICD10who code and name_en", code_ICD10who = code1)
  

nrow(ICD10fi_1code_full_match)+nrow(ICD10fi_1code_no_match) == nrow(ICD10fi_1code)
```

    ## [1] TRUE

### How many concepts are in ICD10who but have a different code?

Some concepts are repeated with a different ICD10fi code. Find these in
“2 code” and `ICD10fi_1code_no_match` by having the same name\_fi

``` r
ICD10fi_2code_1code_not_matched <- bind_rows(
  ICD10fi  %>% filter(code_class == "2 code"), 
  ICD10fi_1code_no_match
) 

ICD10fi_2code_1code_name_match <- 
  inner_join(
    ICD10fi_2code_1code_not_matched,
    ICD10fi_1code_full_match  %>% select(code_ICD10who, name_fi), 
    by = c("name_fi")
  ) %>% 
  mutate(Mapping_type="ICD10who name_fi", code_ICD10who = code1)

ICD10fi_2code_1code_name_match %>%  select(code, code_ICD10who, name_fi, name_en, name_en_source) %>% arrange(name_fi)
```

    ## # A tibble: 110 x 5
    ##    code     code_ICD10who name_fi             name_en             name_en_source
    ##    <chr>    <chr>         <chr>               <chr>               <chr>         
    ##  1 G46.3*I~ G46.3         Aivorungon halvaus~ Brain stem stroke ~ THL           
    ##  2 I67.9+G~ I67.9         Aivorungon halvaus~ Brain stem stroke ~ THL           
    ##  3 I00+L54~ I00           Akuutti kuumereuma~ Erythema marginatu~ THL           
    ##  4 L54.0*I~ L54.0         Akuutti kuumereuma~ Erythema marginatu~ THL           
    ##  5 L40.5+M~ L40.5         Arthritis mutilans  Arthritis mutilans  THL           
    ##  6 M07.1*L~ M07.1         Arthritis mutilans  Arthritis mutilans  THL           
    ##  7 B57.3+K~ B57.3         Chagasin tauti ja ~ Megacolon in Chaga~ THL           
    ##  8 K93.1*B~ K93.1         Chagasin tauti ja ~ Megacolon in Chaga~ THL           
    ##  9 B57.3+K~ B57.3         Chagasin tautiin l~ Megaoesophagus in ~ THL           
    ## 10 K23.1*B~ K23.1         Chagasin tautiin l~ Megaoesophagus in ~ THL           
    ## # ... with 100 more rows

``` r
ICD10fi_2code_1code_not_matched <- ICD10fi_2code_1code_not_matched %>% filter(!(code %in% ICD10fi_2code_1code_name_match$code))
```

## Prepare un matched “1 code” and “2 code” for USAGI

``` r
icd10fi_freqs <- read_csv("../3_freq_of_source_codes/freq_total.csv")
```

    ## Parsed with column specification:
    ## cols(
    ##   code1 = col_character(),
    ##   code2 = col_character(),
    ##   freq_finngen = col_double(),
    ##   freq_tays = col_double(),
    ##   freq_total = col_double()
    ## )

``` r
# join  -------------------------------------------------------------------------
icd10fi_source_for_usagi <- left_join(
  ICD10fi_2code_1code_not_matched %>% mutate(code1 = str_replace(code1,"\\.", ""), code2 = str_replace(code2,"\\.", "")),
  icd10fi_freqs,
  by=c("code1", "code2")
) 

icd10fi_source_for_usagi <- icd10fi_source_for_usagi %>%
  mutate_if(is.numeric, ~if_else(is.na(.), rep(0, length(.)), .)) %>% 
  arrange(-freq_total)


#check not duplicates introduced
nrow(icd10fi_source_for_usagi)==nrow(ICD10fi_2code_1code_not_matched)
```

    ## [1] TRUE

``` r
# save --------------------------------------------------------------------
write_csv(icd10fi_source_for_usagi, "./USAGI/icd10fi_source_for_usagi.csv")
```

Append after usagi

``` r
col_types = cols( .default = col_character(), 
                  sourceFrequency = col_integer(),
                  matchScore  = col_double(),
                  conceptId  = col_integer()
                  )

icd10fi_notmatched_after_usagi <- read_csv("./USAGI/icd10fi_after_usagi.csv", col_types = col_types)
```

``` r
ICD10fi_2code_1code_not_matched_after_usagi <- left_join(
  ICD10fi_2code_1code_not_matched, 
  icd10fi_notmatched_after_usagi %>% rename(code=sourceCode, Mapping_type=mappingStatus) %>%  select(code, Mapping_type, sourceFrequency  ) %>% distinct(),
  by="code"
) %>% 
  mutate(Mapping_type = if_else(is.na(Mapping_type), "UNCHECKED", Mapping_type))
```

join 1 code 2 code

``` r
ICD10fi_2code_1code_processed <- bind_rows(
  ICD10fi_1code_full_match,
  ICD10fi_2code_1code_name_match,
  ICD10fi_2code_1code_not_matched_after_usagi
) %>%  
  select(-concept_name, -English_name_match_level)

#check consitecy
nrow(ICD10fi_2code_1code_processed) - nrow(ICD10fi %>% filter(code_class %in% c("1 code", "2 code")))
```

    ## [1] 0

# Check mapping status in “2 code generated”

``` r
ICD10fi_2codegenerated <- ICD10fi %>% filter(code_class=="2 code generated")
```

``` r
# join code1 info
ICD10fi_2codegenerated_tmp1 <- left_join(
  ICD10fi_2codegenerated, 
  ICD10fi_2code_1code_processed %>% select(code, Mapping_type) %>% rename(CodeId1=code, Mapping_type_code1=Mapping_type), 
  by="CodeId1"
)

ICD10fi_2codegenerated_tmp2 <- left_join(
  ICD10fi_2codegenerated_tmp1, 
  ICD10fi_2code_1code_processed %>% select(code, Mapping_type) %>% rename(CodeId2=code, Mapping_type_code2=Mapping_type), 
  by="CodeId2"
)
```

``` r
ICD10fi_2codegenerated<- ICD10fi_2codegenerated_tmp2 %>% 
  mutate(Mapping_type = 
           if_else( Mapping_type_code1=="UNCHECKED" | Mapping_type_code2=="UNCHECKED",
                    "missing one",
                    "mappeable"
                    )
    ) %>% 
  select(-Mapping_type_code1, -Mapping_type_code2)
```

``` r
ICD10fi_2codegenerated %>% count(Mapping_type)
```

    ## # A tibble: 2 x 2
    ##   Mapping_type     n
    ##   <chr>        <int>
    ## 1 mappeable    44827
    ## 2 missing one   9272

# join all a save

``` r
icd10_mapped <- bind_rows(
  ICD10fi %>% filter(code_class=="classification"),
  ICD10fi_2code_1code_processed,
  ICD10fi_2codegenerated
)
```

``` r
icd10_mapped %>% count(code_class)
```

    ## # A tibble: 4 x 2
    ##   code_class           n
    ##   <chr>            <int>
    ## 1 1 code           13346
    ## 2 2 code            1037
    ## 3 2 code generated 54099
    ## 4 classification     298

``` r
write_csv(icd10_mapped, "./icd10_extension_mapped.csv")
```
