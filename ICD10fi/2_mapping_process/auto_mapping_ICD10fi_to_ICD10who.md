Auto mapping ICD10fi to ICD10who
================

  - [Load ICD10fi and ICD10who from
    `1_source_files`](#load-icd10fi-and-icd10who-from-1_source_files)
  - [Study codes](#study-codes)
      - [How many are clasification
        codes??](#how-many-are-clasification-codes)
      - [How many are a direct match ??](#how-many-are-a-direct-match)
      - [How many more match if only the diagnose code is
        taken?](#how-many-more-match-if-only-the-diagnose-code-is-taken)
      - [How many ICD10fi codes have no match with
        ICD10who?](#how-many-icd10fi-codes-have-no-match-with-icd10who)
  - [Proposed automatic matching](#proposed-automatic-matching)

# Load ICD10fi and ICD10who from `1_source_files`

``` r
ICD10fi_standard <- read_delim("../1_source_files/58_1471433699473.txt", ";", 
                               locale = locale(encoding = 'ISO-8859-1'),
                               col_types = cols( .default = col_character() )
                               )


ICD10fi_standard <- ICD10fi_standard %>% select(CodeId, ShortName,  LongName, ParentId, HierarchyLevel,
                        BeginningDate,  ExpiringDate, 'A:Koodi1', 'A:Koodi2', 
                        'A:Long_name'
                        ) %>% 
                rename(Code1 = 'A:Koodi1', Code2 = 'A:Koodi2', English_name = 'A:Long_name' ) %>% 
                mutate(BeginningDate = dmy(BeginningDate), ExpiringDate = dmy(ExpiringDate))



ICD10who_OMOP <- read_csv("../1_source_files/OMOP_ICD10who.csv")
```

# Study codes

Total number of codes

``` r
ICD10fi_standard  %>% nrow
```

    ## [1] 14681

In the Finnish version of the ICD10 there are two types of additional
codes.

  - Classification codes: describe ranges of codes other than the
    conventional ICD10 hierarchy
      - `CodeA-CodeB` : from CodeA to CodeB
  - Reason codes: combine codes to add more info on what caused the
    diagnose, there are 4 marks
      - `CodeA*CodeB` : ”Oirekoodi”, –CodeA indicates the symptom and
        CodeB the etiology/cause–
      - `CodeA+CodeB` : ”Syykoodi”, –CodeA indicates the reason for
        Code1–
      - `CodeA#CodeB` : ATC-koodi, CodeB is and ATC code indicating the
        medicine that caused CodeA
      - `CodeA&CodeB` : ”Kasvainkoodi”, CodeB is and endocrinological
        disorder code that caused CodeA

### How many are clasification codes??

``` r
ICD10fi_standard_classif <- ICD10fi_standard  %>% filter( grepl("-", CodeId))
```

``` r
ICD10fi_standard_classif  %>% nrow
```

    ## [1] 298

### How many are a direct match ??

``` r
# match ICD10fi codes to the ICD10who codes 
ICD10fi_standard_match_icd10who <- inner_join(ICD10fi_standard,
                ICD10who_OMOP %>% rename(CodeId = concept_code),
                by = "CodeId")
```

``` r
ICD10fi_standard_match_icd10who %>% nrow
```

    ## [1] 9587

#### How well these agree in the definition ??

Count the differences in characters (string distance) between the
English names of icd10fi and icd10who full matches

``` r
ICD10fi_standard_match_icd10who  %>%  select(CodeId, English_name, concept_name, ShortName) %>% 
        mutate(same_name = stringdist(English_name,concept_name) )  %>% 
        count(same_name, sort = T) %>% head(20)
```

    ## # A tibble: 20 x 2
    ##    same_name     n
    ##        <dbl> <int>
    ##  1         0  8463
    ##  2        NA   226
    ##  3         2   150
    ##  4         3   149
    ##  5        20   114
    ##  6         4    91
    ##  7         1    84
    ##  8         7    32
    ##  9        17    26
    ## 10        10    20
    ## 11         5    18
    ## 12        14    14
    ## 13        37    13
    ## 14        42    13
    ## 15        15    12
    ## 16        19    12
    ## 17        39    12
    ## 18        22    11
    ## 19        45    11
    ## 20        59    10

Most (8463) match the name exactly\!\!, 226 NA for these with no English
name

#### Why the large differences ??

``` r
ICD10fi_standard_match_icd10who  %>%  select(CodeId, English_name, concept_name, ShortName) %>% 
        mutate(same_name = stringdist(English_name,concept_name) )  %>% 
        rename(ICD10fi_name = English_name, ICD10who_name = concept_name) %>% 
        filter(same_name>21)  %>% head(20)
```

    ## # A tibble: 20 x 5
    ##    CodeId ICD10fi_name           ICD10who_name          ShortName      same_name
    ##    <chr>  <chr>                  <chr>                  <chr>              <dbl>
    ##  1 A09    Diarrhoea and gastroe~ Other gastroenteritis~ Tartt. olet. ~        40
    ##  2 A49.1  Streptococcal infecti~ Streptococcal and ent~ Streptokokki,~        22
    ##  3 A74.0  Paratrachoma           Chlamydial conjunctiv~ Paratrakooma          22
    ##  4 B96.5  Pseudomonas (aerugino~ Pseudomonas (aerugino~ Pseudomonakse~        22
    ##  5 C81.1  Nodular sclerosis      Nodular sclerosis cla~ Sidekudoskyhm~        27
    ##  6 C81.2  Mixed cellularity      Mixed cellularity cla~ Sekasoluinen ~        27
    ##  7 C81.3  Lymphocytic depletion  Lymphocyte depleted c~ Vähälymfosyyt~        28
    ##  8 C82    Follicular [nodular] ~ Follicular lymphoma    Nodul. non-Ho~        24
    ##  9 C83.6  Undifferentiated (dif~ Undifferentiated (dif~ Diff.non-Hodg~        23
    ## 10 C83.9  Diffuse non-Hodgkin's~ Non-follicular (diffu~ Diff.non-Hodg~        22
    ## 11 C84    Peripheral and cutane~ Mature T/NK-cell lymp~ Perif./ihon T~        23
    ## 12 C84.4  Peripheral T-cell lym~ Peripheral T-cell lym~ Perifeerinen ~        26
    ## 13 C90.2  Plasmacytoma, extrame~ Extramedullary plasma~ Ekstramedull.~        24
    ## 14 C91.5  Adult T-cell leukaemia Adult T-cell lymphoma~ Aikuisen T-so~        29
    ## 15 C92.1  Chronic myeloid leuka~ Chronic myeloid leuka~ Kroon. myeloo~        24
    ## 16 C92.2  Subacute myeloid leuk~ Atypical chronic myel~ Subakuutt. my~        33
    ## 17 C96.0  Letterer-Siwe disease  Multifocal and multis~ Disseminoitun~        76
    ## 18 D39.1  Ovary                  Neoplasm of uncertain~ Munasarjan ep~        44
    ## 19 D47.2  Monoclonal gammopathy  Monoclonal gammopathy~ Monoklonaalin~        36
    ## 20 D76    Certain diseases invo~ Other specified disea~ Eräät lymfore~        42

Seems the concept are the same, described in different way.

### How many more match if only the diagnose code is taken?

``` r
# match ICD10fi's diagnose codes to the ICD10who codes 
matched_ids <- c(ICD10fi_standard_classif$CodeId, ICD10fi_standard_match_icd10who$CodeId)

ICD10fi_standard_code1_match_icd10who <- inner_join( ICD10fi_standard  %>% filter(!(CodeId %in% matched_ids)) , 
                ICD10who_OMOP %>% rename(Code1 = concept_code),
                by = "Code1")
```

``` r
ICD10fi_standard_code1_match_icd10who  %>% nrow
```

    ## [1] 2105

### How many ICD10fi codes have no match with ICD10who?

``` r
matched_ids <- c(ICD10fi_standard_classif$CodeId, ICD10fi_standard_match_icd10who$CodeId, ICD10fi_standard_code1_match_icd10who$CodeId)

ICD10fi_standard_new <- ICD10fi_standard  %>% filter(!(CodeId %in% matched_ids)) 

ICD10fi_standard_new %>%  nrow()
```

    ## [1] 2691

How many at a precision \> than 5 digits Xxx.x

``` r
#which are new in the level higher than 6
ICD10fi_standard_new  %>% 
select(CodeId, English_name, ShortName) %>% 
mutate(group = nchar(CodeId) #str_sub(concept_code, 0, 1)
      ) %>% filter(group<6)
```

    ## # A tibble: 83 x 4
    ##    CodeId English_name                               ShortName             group
    ##    <chr>  <chr>                                      <chr>                 <int>
    ##  1 B07.9  Verruca simplex                            Tavallinen syylä          5
    ##  2 F61.0  Mixed personality disorders                Sekamuotoiset persoo~     5
    ##  3 F61.1  <NA>                                       Häiritsevä persoonal~     5
    ##  4 W71    Drowning to ice                            Vajoaminen jäihin         3
    ##  5 X85.0  Assault by drugs, medicaments and biologi~ Pahoinpitely lääkeai~     5
    ##  6 X85.2  Assault by drugs, medicaments and biologi~ Pahoinpitely lääkeai~     5
    ##  7 X85.8  Assault by drugs, medicaments and biologi~ Pahoinpitely lääkeai~     5
    ##  8 X85.9  Assault by drugs, medicaments and biologi~ Pahoinpitely lääkeai~     5
    ##  9 X90.0  Assault by unspecified chemical or noxiou~ Pahoinpit.kem.aineil~     5
    ## 10 X90.2  Assault by unspecified chemical or noxiou~ Pahoinpit.kem.aineil~     5
    ## # ... with 73 more rows

Are unmached codes more frequent in a category ??

``` r
# what groups have more new ones 
ICD10fi_standard_new  %>% 
select(CodeId, English_name, ShortName) %>% 
mutate(group = str_sub(CodeId, 0, 1)) %>% count(group, sort = T)
```

    ## # A tibble: 25 x 2
    ##    group     n
    ##    <chr> <int>
    ##  1 C       770
    ##  2 F       497
    ##  3 Q       348
    ##  4 K       313
    ##  5 D       130
    ##  6 I       105
    ##  7 E        89
    ##  8 G        62
    ##  9 H        50
    ## 10 X        48
    ## # ... with 15 more rows

Most of the extension of icd10who is on group C “Neoplasm”.

# Proposed automatic matching

1.  Ignore the new ICD10fi classification codes, these are not suppose
    to be used as diagnose
2.  Match ICD10fi to ICD10who only based on the diagnose code `CodeA`
3.  These new ICD10fi that don’t exist in ICD10who, match to the parent
    code

<!-- end list -->

``` r
# ICD10fi code matches the ICD10who
ICD10fi_standard_clas <- ICD10fi_standard  %>% 
    filter( CodeId %in% ICD10who_OMOP$concept_code)  %>% 
    mutate( ICD10who = CodeId , ICD10who_match_level = 0 )
```

``` r
# match diagnose codes to the upper level code
ICD10fi_standard_new_1 <- inner_join( ICD10fi_standard_new  %>% 
                                # remove the last digit of the code 
                                mutate(ICD10who = str_sub(Code1, 0, -2))%>% 
                                # remove the last digit of the code if it is a point
                                mutate(ICD10who = sub("\\.$", "", ICD10who)) , 
                ICD10who_OMOP %>% rename(ICD10who = concept_code),
                by = "ICD10who")
```

``` r
ICD10fi_standard_new_1  %>%  nrow
```

    ## [1] 2587

``` r
# match diagnose codes to the upper level code
ICD10fi_standard_new_2 <- left_join( ICD10fi_standard_new  %>% filter( !(CodeId %in% ICD10fi_standard_new_1$CodeId)) %>%  
                                # remove the last digit of the code 
                                mutate(ICD10who = str_sub(Code1, 0, -3))%>% 
                                # remove the last digit of the code if it is a point
                                mutate(ICD10who = sub("\\.$", "", ICD10who)) , 
                ICD10who_OMOP %>% rename(ICD10who = concept_code),
                by = "ICD10who")
```

``` r
ICD10fi_standard_new_2 %>%  nrow
```

    ## [1] 104

``` r
# Join all 
ICD10fi_standard_matched <- bind_rows(
    # classifiction codes
    ICD10fi_standard  %>% filter( CodeId %in%ICD10fi_standard_classif$CodeId)  %>% 
    mutate(ICD10who = as.character(NA), ICD10who_match_level = "classification" ), 
    # perfect matches
    ICD10fi_standard  %>% filter( CodeId %in%ICD10fi_standard_match_icd10who$CodeId)  %>% 
    mutate(ICD10who = CodeId, ICD10who_match_level = "full_match" ), 
    # matched with the diagnose 
    ICD10fi_standard  %>% filter( CodeId %in%ICD10fi_standard_code1_match_icd10who$CodeId)  %>% 
    mutate(ICD10who = Code1, ICD10who_match_level = "diagnose_match" ),
    #
    ICD10fi_standard_new_1 %>% select(CodeId:ICD10who)%>% 
    mutate(ICD10who_match_level = "diagnose_match_parent" ),
    #
    ICD10fi_standard_new_2 %>% select(CodeId:ICD10who)%>% 
    mutate(ICD10who_match_level =  "diagnose_match_grandparent" )
)%>% arrange(CodeId)  %>% 
mutate(ICD10who_match_level = factor(ICD10who_match_level, 
                                     levels = c("classification", 
                                                "full_match", 
                                                "diagnose_match",
                                                "diagnose_match_parent", 
                                                "diagnose_match_grandparent")
                                    )
      )
```

``` r
ICD10fi_standard_matched  %>% count(ICD10who_match_level)
```

    ## # A tibble: 5 x 2
    ##   ICD10who_match_level           n
    ##   <fct>                      <int>
    ## 1 classification               298
    ## 2 full_match                  9587
    ## 3 diagnose_match              2105
    ## 4 diagnose_match_parent       2587
    ## 5 diagnose_match_grandparent   104

``` r
# load ICD10fi
write_csv(ICD10fi_standard_matched, "ICD10fi_matched_to_ICD10who.csv") 
```
