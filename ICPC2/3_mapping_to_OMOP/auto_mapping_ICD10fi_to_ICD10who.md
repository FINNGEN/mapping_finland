Auto mapping ICD10fi to ICD10who
================

  - [Load ICD10fi and ICD10who from
    `1_source_files`](#load-icd10fi-and-icd10who-from-1_source_files)
  - [Study codes](#study-codes)
      - [How many are clasification
        codes??](#how-many-are-clasification-codes)
      - [How many are a direct match ??](#how-many-are-a-direct-match)
      - [How many are off just by a \*/+/&/\#
        ??](#how-many-are-off-just-by-a)
      - [How many concepts are in ICD10who but have a different
        code?](#how-many-concepts-are-in-icd10who-but-have-a-different-code)
      - [How many more match if only the diagnose code is
        taken?](#how-many-more-match-if-only-the-diagnose-code-is-taken)
      - [How many ICD10fi codes with no match, match the
        parent?](#how-many-icd10fi-codes-with-no-match-match-the-parent)
      - [How many ICD10fi codes with no match, match the
        grandparent?](#how-many-icd10fi-codes-with-no-match-match-the-grandparent)
      - [How many ICD10fi codes with no
        match?](#how-many-icd10fi-codes-with-no-match)
  - [Proposed automatic matching](#proposed-automatic-matching)

# Load ICD10fi and ICD10who from `1_source_files`

``` r
ICD10fi <- read_delim("../1_source_files/58_1471433699473.txt", ";", 
                               locale = locale(encoding = 'ISO-8859-1'),
                               col_types = cols( .default = col_character() )
                               )


ICD10fi <- ICD10fi %>% select(CodeId, ShortName,    LongName, ParentId, HierarchyLevel,
                        BeginningDate,  ExpiringDate, 'A:Koodi1', 'A:Koodi2', 
                        'A:Long_name'
                        ) %>% 
                rename(Code1 = 'A:Koodi1', Code2 = 'A:Koodi2', English_name = 'A:Long_name' ) %>% 
                mutate(BeginningDate = dmy(BeginningDate), ExpiringDate = dmy(ExpiringDate))



ICD10who_OMOP <- read_csv("../1_source_files/OMOP_ICD10who.csv") %>% select(concept_code, concept_name)
```

# Study codes

Total number of codes

``` r
ICD10fi  %>% nrow
```

    ## [1] 14681

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
same_concept <- ICD10fi %>% count(ShortName, LongName, sort = T) %>% filter(n>1) %>%  .$LongName

ICD10fi %>% filter(LongName %in% same_concept) %>% arrange(LongName) %>% 
  select(CodeId, English_name, Code1, Code2)# %>%  print(n=100)
```

    ## # A tibble: 1,133 x 4
    ##    CodeId      English_name                                       Code1 Code2
    ##    <chr>       <chr>                                              <chr> <chr>
    ##  1 E50.8+L86   Follicular keratosis due to a vitamin A deficiency E50.8 L86  
    ##  2 L86*E50.8   Follicular keratosis due to a vitamin A deficiency L86   E50.8
    ##  3 B60.1+H13.1 Conjunctivitis due to Acanthamoeba+                B60.1 H13.1
    ##  4 H13.1*B60.1 Conjunctivitis due to Acanthamoeba+                H13.1 B60.1
    ##  5 B60.1+H19.2 Keratoconjunctivitis due to Acanthamoeba+          B60.1 H19.2
    ##  6 H19.2*B60.1 Keratoconjunctivitis due to Acanthamoeba+          H19.2 B60.1
    ##  7 A87.1+G02.0 Adenoviral meningitis                              A87.1 G02.0
    ##  8 G02.0*A87.1 Adenoviral meningitis                              G02.0 A87.1
    ##  9 B30.1+H13.1 Conjunctivitis due to adenovirus                   B30.1 H13.1
    ## 10 H13.1*B30.1 Conjunctivitis due to adenovirus                   H13.1 B30.1
    ## # ... with 1,123 more rows

This is can be due to two reasons: - A concept exists on the table as to
be append to others “C55”, and to be used as diagnosis “c55&”. - Same
concept described as ”Oirekoodi” and ”Syykoodi”, e.g. J17.3\*B77.8
(Pneumonia in ascariasis) and B77.8+J17.3 (ascariasis caused by
Pneumonia)

### How many are clasification codes??

``` r
ICD10fi_classif <- ICD10fi  %>% filter( grepl("-", CodeId))
```

``` r
ICD10fi_classif  %>% nrow
```

    ## [1] 298

``` r
 #match
 ICD10fi_classif <- ICD10fi_classif  %>% 
    mutate(ICD10who_code = as.character(NA), 
           exists_in_ICD10who = F,
           ICD10who_name = as.character(NA),
           English_name_match_level = as.integer(NA), 
           ICD10who_match_level = "classification_code"
           )
```

### How many are a direct match ??

``` r
# match ICD10fi codes to the ICD10who codes 
matched_ids <- c(ICD10fi_classif$CodeId)

ICD10fi_full_code_match <- ICD10fi  %>% filter(!(CodeId %in% matched_ids))

ICD10fi_full_code_match <- 
  inner_join(ICD10fi_full_code_match,
             ICD10who_OMOP %>% rename(CodeId = concept_code),
             by = "CodeId")
```

``` r
ICD10fi_full_code_match %>% nrow
```

    ## [1] 9587

#### How well these agree in the definition ??

Count the differences in characters (string distance) between the
English names of icd10fi and icd10who full matches

``` r
ICD10fi_full_code_match <- ICD10fi_full_code_match  %>% 
        mutate(English_name_match_level = stringdist(English_name,concept_name) ) 

ICD10fi_full_code_match %>% 
        count(English_name_match_level, sort = T) %>% head(20)
```

    ## # A tibble: 20 x 2
    ##    English_name_match_level     n
    ##                       <dbl> <int>
    ##  1                        0  8463
    ##  2                       NA   226
    ##  3                        2   150
    ##  4                        3   149
    ##  5                       20   114
    ##  6                        4    91
    ##  7                        1    84
    ##  8                        7    32
    ##  9                       17    26
    ## 10                       10    20
    ## 11                        5    18
    ## 12                       14    14
    ## 13                       37    13
    ## 14                       42    13
    ## 15                       15    12
    ## 16                       19    12
    ## 17                       39    12
    ## 18                       22    11
    ## 19                       45    11
    ## 20                       59    10

Most (8463) match the name exactly\!\!, 226 NA for these with no English
name

#### Why the large differences ??

``` r
ICD10fi_full_code_match %>% 
        rename(ICD10fi_name = English_name, ICD10who_name = concept_name) %>% 
        filter(English_name_match_level>21)  %>% head(20)
```

    ## # A tibble: 20 x 12
    ##    CodeId ShortName LongName ParentId HierarchyLevel BeginningDate ExpiringDate
    ##    <chr>  <chr>     <chr>    <chr>    <chr>          <date>        <date>      
    ##  1 A09    Tartt. o~ Tarttuv~ A00-A09  2              1900-01-01    2020-12-31  
    ##  2 A49.1  Streptok~ Määritt~ A49      3              1900-01-01    2020-12-31  
    ##  3 A74.0  Paratrak~ Paratra~ A74      3              1900-01-01    2020-12-31  
    ##  4 B96.5  Pseudomo~ Pseudom~ B96      3              1900-01-01    2020-12-31  
    ##  5 C81.1  Sidekudo~ Sidekud~ C81      4              1900-01-01    2020-12-31  
    ##  6 C81.2  Sekasolu~ Sekasol~ C81      4              1900-01-01    2020-12-31  
    ##  7 C81.3  Vähälymf~ Vähälym~ C81      4              1900-01-01    2020-12-31  
    ##  8 C82    Nodul. n~ Nodulaa~ C81-C96  3              1900-01-01    2020-12-31  
    ##  9 C83.6  Diff.non~ Diffuus~ C83      4              1900-01-01    2020-12-31  
    ## 10 C83.9  Diff.non~ Määritt~ C83      4              1900-01-01    2020-12-31  
    ## 11 C84    Perif./i~ Perifee~ C81-C96  3              1900-01-01    2020-12-31  
    ## 12 C84.4  Perifeer~ Perifee~ C84      4              1900-01-01    2020-12-31  
    ## 13 C90.2  Ekstrame~ Ekstram~ C90      4              1900-01-01    2020-12-31  
    ## 14 C91.5  Aikuisen~ Aikuise~ C91      4              1900-01-01    2020-12-31  
    ## 15 C92.1  Kroon. m~ Pitkäai~ C92      4              1900-01-01    2020-12-31  
    ## 16 C92.2  Subakuut~ Puoliak~ C92      4              1900-01-01    2020-12-31  
    ## 17 C96.0  Dissemin~ Multifo~ C96      4              1900-01-01    2020-12-31  
    ## 18 D39.1  Munasarj~ Munasar~ D39      3              1900-01-01    2020-12-31  
    ## 19 D47.2  Monoklon~ Monoklo~ D47      3              1900-01-01    2020-12-31  
    ## 20 D76    Eräät ly~ Eräät l~ D70-D77  2              1900-01-01    2020-12-31  
    ## # ... with 5 more variables: Code1 <chr>, Code2 <chr>, ICD10fi_name <chr>,
    ## #   ICD10who_name <chr>, English_name_match_level <dbl>

``` r
 #match
 ICD10fi_full_code_match <- ICD10fi_full_code_match  %>% 
    mutate(ICD10who_code = CodeId, 
           exists_in_ICD10who = T,
           ICD10who_name = concept_name,
           English_name_match_level = English_name_match_level, 
           ICD10who_match_level = "match_exactly"
           ) %>% 
  select(-concept_name)
```

### How many are off just by a \*/+/&/\# ??

``` r
# match ICD10fi's diagnose codes to the ICD10who codes 
matched_ids <- c(ICD10fi_classif$CodeId,
                 ICD10fi_full_code_match$CodeId)

ICD10fi_almostfull_match_icd10who <-
  inner_join( ICD10fi  %>% filter(!(CodeId %in% matched_ids)) %>% 
                mutate(concept_code = str_replace(CodeId, "\\*|\\+|\\&|\\#", "")), 
              ICD10who_OMOP,
              by = "concept_code")
```

``` r
ICD10fi_almostfull_match_icd10who %>% nrow
```

    ## [1] 1129

**How many of these are repeated ?**

``` r
ICD10fi_full_code_match %>% filter(CodeId %in% ICD10fi_almostfull_match_icd10who$concept_code)
```

    ## # A tibble: 10 x 15
    ##    CodeId ShortName LongName ParentId HierarchyLevel BeginningDate ExpiringDate
    ##    <chr>  <chr>     <chr>    <chr>    <chr>          <date>        <date>      
    ##  1 B59    Pneumoky~ Pneumok~ B50-B64  2              1900-01-01    2009-12-31  
    ##  2 C55    Sijainn.~ Sijainn~ C51-C58  3              1900-01-01    2011-10-09  
    ##  3 C58    Istukkas~ Istukka~ C51-C58  3              1900-01-01    2020-12-31  
    ##  4 C61    Eturauha~ Eturauh~ C60-C63  3              1900-01-01    2020-12-31  
    ##  5 C65    Munuaisa~ Munuais~ C64-C68  3              1900-01-01    2020-12-31  
    ##  6 C66    Virtsanj~ Virtsan~ C64-C68  3              1900-01-01    2020-12-31  
    ##  7 E15    Ei-diab.~ Ei-diab~ E15-E16  2              1900-01-01    2020-12-31  
    ##  8 E35    Muih.sai~ Muualla~ E20-E35  2              1900-01-01    2020-12-31  
    ##  9 F55    Ei-riipp~ Riippuv~ F50-F59  2              1997-06-18    2020-12-31  
    ## 10 K20    Ruokator~ Ruokato~ K00-K14  2              1900-01-01    2020-12-31  
    ## # ... with 8 more variables: Code1 <chr>, Code2 <chr>, English_name <chr>,
    ## #   English_name_match_level <dbl>, ICD10who_code <chr>,
    ## #   exists_in_ICD10who <lgl>, ICD10who_name <chr>, ICD10who_match_level <chr>

#### How well these agree in the definition ??

Count the differences in characters (string distance) between the
English names of icd10fi and icd10who full matches

``` r
ICD10fi_almostfull_match_icd10who <- ICD10fi_almostfull_match_icd10who  %>% 
        mutate(English_name_match_level = stringdist(English_name,concept_name) ) 

ICD10fi_almostfull_match_icd10who %>% 
        count(English_name_match_level, sort = T) %>% head(20)
```

    ## # A tibble: 20 x 2
    ##    English_name_match_level     n
    ##                       <dbl> <int>
    ##  1                        0   528
    ##  2                       20   145
    ##  3                       17   115
    ##  4                        3    76
    ##  5                       44    52
    ##  6                       19    41
    ##  7                        4    39
    ##  8                        2    28
    ##  9                       NA    21
    ## 10                       11    17
    ## 11                       10     9
    ## 12                        1     8
    ## 13                       46     8
    ## 14                       51     8
    ## 15                       23     6
    ## 16                       22     5
    ## 17                       43     4
    ## 18                       12     3
    ## 19                       21     3
    ## 20                       16     2

``` r
 #match
 ICD10fi_almostfull_match_icd10who <- ICD10fi_almostfull_match_icd10who  %>% 
    mutate(ICD10who_code = CodeId, 
           exists_in_ICD10who = T,
           ICD10who_name = concept_name,
           English_name_match_level = English_name_match_level, 
           ICD10who_match_level = "match_one_code_removing_mark"
           ) %>% 
  select(-concept_name, -concept_code)
```

### How many concepts are in ICD10who but have a different code?

Some concepts are repeated with a different ICD10fi code. Find these
still not matched by having the same LongName

``` r
# match ICD10fi's diagnose codes to the ICD10who codes 
matched_ids <- c(ICD10fi_classif$CodeId,
                 ICD10fi_full_code_match$CodeId, 
                 ICD10fi_almostfull_match_icd10who$CodeId)

ICD10fi_not_matched <- ICD10fi  %>% filter(!(CodeId %in% matched_ids))

ICD10fi_matched <- bind_rows(ICD10fi_full_code_match, ICD10fi_almostfull_match_icd10who)

ICD10fi_LongName_match <- 
  inner_join(
    ICD10fi_not_matched,
    ICD10fi_matched  %>% select(CodeId, ShortName, LongName, ICD10who_code, ICD10who_name, English_name_match_level ) %>% rename(CodeId_matched = CodeId, ShortName_matched = ShortName) , 
    by = c("LongName")
  )

ICD10fi_LongName_match
```

    ## # A tibble: 110 x 15
    ##    CodeId ShortName LongName ParentId HierarchyLevel BeginningDate ExpiringDate
    ##    <chr>  <chr>     <chr>    <chr>    <chr>          <date>        <date>      
    ##  1 A17.9~ Määrittä~ Määritt~ A17      3              1900-01-01    2020-12-31  
    ##  2 A18.0~ Selkäran~ Selkära~ A18      3              1900-01-01    2020-12-31  
    ##  3 A18.1~ Kohdunka~ Kohdunk~ A18      3              1900-01-01    2020-12-31  
    ##  4 A18.1~ Sisäsynn~ Sisäsyn~ A18      3              1900-01-01    2020-12-31  
    ##  5 A18.3~ Tb, vats~ Tuberku~ A18      3              1900-01-01    2020-12-31  
    ##  6 A18.3~ Suolisto~ Suolist~ A18      3              1900-01-01    2020-12-31  
    ##  7 A18.7~ Lisämunu~ Lisämun~ A18      3              1900-01-01    2020-12-31  
    ##  8 A18.8~ Ruokator~ Ruokato~ A18      3              1900-01-01    2020-12-31  
    ##  9 A52.7~ Myöhäisk~ Myöhäis~ A52      3              1900-01-01    2020-12-31  
    ## 10 A54.8~ Gonokokk~ Gonokok~ A54      3              1900-01-01    2020-12-31  
    ## # ... with 100 more rows, and 8 more variables: Code1 <chr>, Code2 <chr>,
    ## #   English_name <chr>, CodeId_matched <chr>, ShortName_matched <chr>,
    ## #   ICD10who_code <chr>, ICD10who_name <chr>, English_name_match_level <dbl>

``` r
ICD10fi_LongName_match %>%  nrow()
```

    ## [1] 110

``` r
 #match
 ICD10fi_LongName_match <- ICD10fi_LongName_match  %>% 
    mutate(ICD10who_code = ICD10who_code, 
           exists_in_ICD10who = T,
           ICD10who_name = ICD10who_name,
           English_name_match_level = English_name_match_level, 
           ICD10who_match_level = "match_longName"
           ) %>% 
  select(-CodeId_matched, -ShortName_matched)
```

### How many more match if only the diagnose code is taken?

``` r
# match ICD10fi's diagnose codes to the ICD10who codes 
matched_ids <- c(ICD10fi_classif$CodeId, 
                 ICD10fi_full_code_match$CodeId, 
                 ICD10fi_almostfull_match_icd10who$CodeId, 
                 ICD10fi_LongName_match$CodeId)

ICD10fi_code1_match_icd10who <- inner_join( ICD10fi  %>% filter(!(CodeId %in% matched_ids)) , 
                ICD10who_OMOP %>% rename(Code1 = concept_code),
                by = "Code1")
```

``` r
ICD10fi_code1_match_icd10who  %>% nrow
```

    ## [1] 883

``` r
 #match
 ICD10fi_code1_match_icd10who <- ICD10fi_code1_match_icd10who  %>% 
    mutate(ICD10who_code = Code1, 
           exists_in_ICD10who = F,
           ICD10who_name = concept_name,
           English_name_match_level = as.integer(NA), 
           ICD10who_match_level = "match_first_code"
           ) %>% 
  select(-concept_name)
```

### How many ICD10fi codes with no match, match the parent?

``` r
matched_ids <- c(ICD10fi_classif$CodeId, 
                 ICD10fi_full_code_match$CodeId,
                 ICD10fi_almostfull_match_icd10who$CodeId, 
                 ICD10fi_LongName_match$CodeId,
                 ICD10fi_code1_match_icd10who$CodeId)

ICD10fi_match_parent <-
  inner_join( ICD10fi %>% filter(!(CodeId %in% matched_ids)) %>% 
                # remove the last digit of the first code 
                mutate(Code1_modified = str_sub(Code1, 0, -2))%>% 
                # remove the last digit of the code if it is a point
                mutate(Code1_modified = sub("\\.$", "", Code1_modified)) , 
              ICD10who_OMOP %>% rename(Code1_modified = concept_code),
              by = "Code1_modified")
```

``` r
ICD10fi_match_parent %>%  nrow()
```

    ## [1] 2571

Are unmached codes more frequent in a category ??

``` r
# what groups have more new ones 
ICD10fi_match_parent  %>% 
select(CodeId, English_name, ShortName) %>% 
mutate(group = str_sub(CodeId, 0, 1)) %>% count(group, sort = T)
```

    ## # A tibble: 24 x 2
    ##    group     n
    ##    <chr> <int>
    ##  1 C       731
    ##  2 F       497
    ##  3 Q       346
    ##  4 K       311
    ##  5 D       121
    ##  6 I       105
    ##  7 E        88
    ##  8 G        59
    ##  9 H        49
    ## 10 A        38
    ## # ... with 14 more rows

``` r
 #match
 ICD10fi_match_parent <- ICD10fi_match_parent  %>% 
    mutate(ICD10who_code = Code1_modified, 
           exists_in_ICD10who = F,
           ICD10who_name = concept_name,
           English_name_match_level = as.integer(NA), 
           ICD10who_match_level = "match_first_code_parent"
           ) %>% 
  select(-Code1_modified, -concept_name)
```

### How many ICD10fi codes with no match, match the grandparent?

``` r
matched_ids <- c(ICD10fi_classif$CodeId, 
                 ICD10fi_full_code_match$CodeId,
                 ICD10fi_almostfull_match_icd10who$CodeId, 
                 ICD10fi_LongName_match$CodeId,
                 ICD10fi_code1_match_icd10who$CodeId, 
                 ICD10fi_match_parent$CodeId)

ICD10fi_match_grandparent <-
  inner_join( ICD10fi %>% filter(!(CodeId %in% matched_ids)) %>% 
                # remove the last digit of the first code 
                mutate(Code1_modified = str_sub(Code1, 0, -3))%>% 
                # remove the last digit of the code if it is a point
                mutate(Code1_modified = sub("\\.$", "", Code1_modified)) , 
              ICD10who_OMOP %>% rename(Code1_modified = concept_code),
              by = "Code1_modified")
```

``` r
ICD10fi_match_grandparent %>%  nrow()
```

    ## [1] 76

``` r
 #match
 ICD10fi_match_grandparent <- ICD10fi_match_grandparent  %>% 
    mutate(ICD10who_code = Code1_modified, 
           exists_in_ICD10who = F,
           ICD10who_name = concept_name,
           English_name_match_level = as.integer(NA), 
           ICD10who_match_level = "match_first_code_grandparent"
           ) %>% 
  select(-Code1_modified, -concept_name)
```

### How many ICD10fi codes with no match?

``` r
matched_ids <- c(ICD10fi_classif$CodeId, 
                 ICD10fi_full_code_match$CodeId,
                 ICD10fi_almostfull_match_icd10who$CodeId, 
                 ICD10fi_LongName_match$CodeId,
                 ICD10fi_code1_match_icd10who$CodeId, 
                 ICD10fi_match_parent$CodeId, 
                 ICD10fi_match_grandparent$CodeId)

ICD10fi_match_NO <-ICD10fi %>% filter(!(CodeId %in% matched_ids)) 
```

``` r
ICD10fi_match_NO %>%  nrow()
```

    ## [1] 27

``` r
 #match
 ICD10fi_match_NO <- ICD10fi_match_NO  %>% 
    mutate(ICD10who_code = as.character(NA), 
           exists_in_ICD10who = F,
           ICD10who_name = as.character(NA),
           English_name_match_level = as.integer(NA), 
           ICD10who_match_level = "no_match"
           ) 
```

# Proposed automatic matching

1.  Ignore the new ICD10fi classification codes, these are not suppose
    to be used as diagnose
2.  Match ICD10fi to ICD10who only based on the diagnose code `CodeA`
3.  These new ICD10fi that don’t exist in ICD10who, match to the parent
    code

<!-- end list -->

``` r
# Join all 
ICD10fi_matched <- bind_rows(
    ICD10fi_classif, 
    ICD10fi_full_code_match,
    ICD10fi_almostfull_match_icd10who,
    ICD10fi_LongName_match,
    ICD10fi_code1_match_icd10who,
    ICD10fi_match_parent,
    ICD10fi_match_grandparent, 
    ICD10fi_match_NO
)%>% arrange(CodeId)  %>% 
mutate(ICD10who_match_level = factor(ICD10who_match_level, 
                                     levels = c("classification_code", 
                                                "match_exactly", 
                                                "match_one_code_removing_mark",
                                                "match_longName",
                                                "match_first_code",
                                                "match_first_code_parent", 
                                                "match_first_code_grandparent", 
                                                "no_match")
                                    )
      )
```

``` 
             ICD10fi_LongName_match$CodeId
```

``` r
ICD10fi_matched  %>% group_by(ICD10who_match_level, exists_in_ICD10who) %>% 
  summarise(n=n(), n_also_match_english_name = sum(English_name_match_level==0, na.rm = T))
```

    ## `summarise()` regrouping output by 'ICD10who_match_level' (override with `.groups` argument)

    ## # A tibble: 8 x 4
    ##   ICD10who_match_level         exists_in_ICD10who     n n_also_match_english_na~
    ##   <fct>                        <lgl>              <int>                    <int>
    ## 1 classification_code          FALSE                298                        0
    ## 2 match_exactly                TRUE                9587                     8463
    ## 3 match_one_code_removing_mark TRUE                1129                      528
    ## 4 match_longName               TRUE                 110                       77
    ## 5 match_first_code             FALSE                883                        0
    ## 6 match_first_code_parent      FALSE               2571                        0
    ## 7 match_first_code_grandparent FALSE                 76                        0
    ## 8 no_match                     FALSE                 27                        0

``` r
ICD10fi_matched  %>% count(ICD10who_match_level) %>% .$n %>% sum()
```

    ## [1] 14681

``` r
# load ICD10fi
write_csv(ICD10fi_matched, "ICD10fi_matched_to_ICD10who.csv") 
```
