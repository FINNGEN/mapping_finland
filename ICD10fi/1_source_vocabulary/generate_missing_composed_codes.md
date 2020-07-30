add derived codes
================

  - [Load ICD10fi](#load-icd10fi)
  - [Parse descritions into regex
    rules](#parse-descritions-into-regex-rules)
      - [Expand one code addition](#expand-one-code-addition)
      - [Expand by class/chapter/group](#expand-by-classchaptergroup)
  - [apply regex rules](#apply-regex-rules)
      - [Append the new codes to the
        standard](#append-the-new-codes-to-the-standard)

# Load ICD10fi

``` r
ICD10fi <- read_delim("./58_1471433699473.txt", ";", 
                               locale = locale(encoding = 'ISO-8859-1'),
                               col_types = cols( .default = col_character() )
                               )
```

# Parse descritions into regex rules

Get codes with a described expansion in `ALONG:Huom.`

``` r
icd10fi_expansion_description <- ICD10fi %>% 
  filter(!is.na(`A:Yhdistelymerkki`)) %>% 
  filter(!str_detect(CodeId,"[:digit:]$")) %>% #dont end with mark
  filter(str_detect(`ALONG:Huom.`, "[:upper:][:digit:][:digit:]")) %>% 
  filter(str_detect(`ALONG:Huom.`, "tiologi")) %>% 
  arrange(`ALONG:Huom.`) %>% 
  select(CodeId,`ALONG:Huom.`) 

icd10fi_expansion_description
```

    ## # A tibble: 173 x 2
    ##    CodeId `ALONG:Huom.`                                          
    ##    <chr>  <chr>                                                  
    ##  1 D63.0* Etiologinen koodi valitaan luokasta C00-D48 - Kasvaimet
    ##  2 G73.2* Etiologinen koodi valitaan luokasta C00-D48 - Kasvaimet
    ##  3 G63.0* Etiologinen koodi valitaan luvusta A00-B99             
    ##  4 G94.0* Etiologinen koodi valitaan luvusta A00-B99             
    ##  5 H06.1* Etiologinen koodi valitaan luvusta A00-B99             
    ##  6 H13.1* Etiologinen koodi valitaan luvusta A00-B99             
    ##  7 H19.2* Etiologinen koodi valitaan luvusta A00-B99             
    ##  8 H22.0* Etiologinen koodi valitaan luvusta A00-B99             
    ##  9 H32.0* Etiologinen koodi valitaan luvusta A00-B99             
    ## 10 K67.8* Etiologinen koodi valitaan luvusta A00-B99             
    ## # ... with 163 more rows

There are 2 types of expansion: - Added single code “Etiologiseksi
koodiksi valitaan Xxx.x” - To chose from a chapter/group “Etiologinen
koodi valitaan ryhmistä”

## Expand one code addition

Parse description in Huom to CodeId2

``` r
#code
icd10fi_extended_by_one_code <- 
icd10fi_expansion_description %>% filter(str_detect(`ALONG:Huom.`, "koodik") & !str_detect(`ALONG:Huom.`, "Lisäksi")) %>% 
 mutate(group_text = str_extract(`ALONG:Huom.`, "[:upper:][:digit:][:digit:].*")) %>% 
  mutate(group_text = str_replace(group_text, "(.*)\\s-\\s.*", "\\1")) %>% 
  # tai to , 
  mutate_at(vars(group_text), str_replace_all,"\\stai\\s", "|") %>% 
  #convert to regex
  mutate(group_reg = str_c("^", str_replace_all(group_text,"\\|", "|^")))
```

## Expand by class/chapter/group

``` r
range_to_regex <- function(match){
  range <- str_extract_all(match, "[:digit:][:digit:]") %>% unlist() %>% as.integer()
  match <- range[1]:range[2] %>% as.character() %>% if_else(nchar(.)==1, str_c("0",.),.) %>% str_c(collapse = "|")
  return(str_c("(",match,")"))
}

#group
icd10fi_extended_by_group <- 
icd10fi_expansion_description %>% filter(str_detect(`ALONG:Huom.`, "luokasta|luvusta|ryhmistä|ryhmästä|rymistä")) %>% 
  #extract codes
  mutate(group_text = str_extract(`ALONG:Huom.`, "[:upper:][:digit:][:digit:].*")) %>% 
  mutate(group_text = str_replace(group_text, "(.*)\\s-\\s.*", "\\1")) %>% 
  mutate(group_text = str_replace(group_text, "(.*)\\.\\s.*", "\\1")) %>% 
  mutate(group_text = str_replace(group_text, "(.*)\\.\\s.*", "\\1")) %>% 
  #extract negations
  mutate(group_text_ei = str_extract(group_text, "\\(ei.*\\)")) %>% 
  mutate(group_text = str_remove(group_text, "\\s\\(ei.*\\)")) %>% 
  mutate(group_text_ei = str_replace(group_text_ei, "\\(ei\\s(.*)\\)", "\\1")) %>% 
  # tai to , 
  mutate_at(vars(group_text, group_text_ei), str_replace_all, "\\stai\\sryhmistä\\s|\\stai\\sryhmästä\\s|,\\s|\\stai\\s", "|") %>%
  # format as regex
  mutate(group_reg=group_text, group_reg_ei=group_text_ei) %>% 
  mutate(group_reg = str_replace(group_reg, "C00-D", "C00-C99\\|D00-D")) %>% 
  mutate(group_reg = str_replace(group_reg, "A([:digit:][:digit:])-B", "A\\1-A99\\|B00-B")) %>% 
  mutate_at(vars(group_reg,group_reg_ei), str_replace_all, "-[:upper:]", "-" ) %>% 
  #mutate_at(vars(group_reg,group_reg_ei), str_replace_all, "([:digit:][:digit:]-[:digit:][:digit:])", "\\[\\1\\]" ) %>% 
  mutate_at(vars(group_reg,group_reg_ei), str_replace_all, "\\|", "|^" ) %>% 
  mutate_at(vars(group_reg,group_reg_ei), ~{str_c("^",.)} ) %>% 
  mutate(group_reg = str_replace_all(group_reg, "[:digit:][:digit:]-[:digit:][:digit:]", range_to_regex)) %>% 
  mutate(group_reg_ei = str_replace_all(group_reg_ei, "50-53", "(50|51|52|53)"))%>% 
  #extract merkki
  mutate(group_reg_4merkki = str_extract(`ALONG:Huom.`, "(\\.[:digit:])($|\\.$)")) %>% 
  mutate(group_reg_4merkki = str_replace(group_reg_4merkki, "\\.$", "")) %>% 
  mutate(group_reg_4merkki = str_c("\\", group_reg_4merkki) ) 

  
  
  #icd10fi_extended_by_group %>% select(group_text, group_reg, group_reg_ei, group_reg_4merkki) %>% print(n=300)
```

Expand rules for `H36.00* Etiologinen koodi valitaan tässä ryhmässä
ryhmistä E10-E14. Neljäs merkki on .3`

``` r
a<-ICD10fi %>% filter(ParentId == "H36*") %>% filter(is.na(`A:Koodi2`)) %>%  select(CodeId)
b <- icd10fi_extended_by_group %>% filter(CodeId == "H36.00*")
b$CodeId[1] = a
b <- b %>%  unnest(CodeId)

icd10fi_extended_by_group <- bind_rows(icd10fi_extended_by_group, b) %>%  distinct()
```

``` r
# join rules 
icd10fi_extended_rules <- bind_rows(icd10fi_extended_by_one_code, icd10fi_extended_by_group)
```

# apply regex rules

Extend leaves only

``` r
icd10fi_leaves <- ICD10fi %>%
  filter(`A:Lehtisolmu`=="T" & is.na(`A:Koodi2`)) %>% 
  select(CodeId)
```

apply rules

``` r
icd10fi_extended<- icd10fi_extended_rules %>% #slice(1)%>% 
  mutate(code2 = pmap(list(group_reg, group_reg_ei, group_reg_4merkki), 
                      function(group_reg, group_reg_ei, group_reg_4merkki){
                        icd10fi_leaves %>% select(CodeId) %>%  
                          filter(str_detect(CodeId, group_reg)) %>% 
                          filter(is.na(group_reg_ei)      | !str_detect(CodeId, group_reg_ei)) %>% 
                          filter(is.na(group_reg_4merkki) |  str_detect(CodeId, group_reg_4merkki)) %>% 
                          rename(CodeId2 = CodeId)
  })) %>% unnest(code2) 
  
icd10fi_extended <- icd10fi_extended %>% 
  rename(CodeId1 = CodeId) %>% 
  mutate(code1 = str_replace(CodeId1, "\\+|\\*|\\#|\\&", "")) %>% 
  mutate(code2 = str_replace(CodeId2,"\\+|\\*|\\#|\\&", "")) %>% 
  mutate(CodeId = str_c(CodeId1, code2)) %>% 
  select(CodeId, CodeId1, CodeId2, code1, code2) %>%  
  distinct(CodeId,.keep_all = T)
  
icd10fi_extended
```

    ## # A tibble: 54,438 x 5
    ##    CodeId       CodeId1 CodeId2 code1 code2 
    ##    <chr>        <chr>   <chr>   <chr> <chr> 
    ##  1 M90.0*A18.0  M90.0*  A18.0   M90.0 A18.0 
    ##  2 M73.0*A54.4  M73.0*  A54.4   M73.0 A54.4 
    ##  3 N29.0*A52.79 N29.0*  A52.79  N29.0 A52.79
    ##  4 M01.1*A18.0  M01.1*  A18.0   M01.1 A18.0 
    ##  5 M49.0*A18.0  M49.0*  A18.0   M49.0 A18.0 
    ##  6 N33.0*A18.1  N33.0*  A18.1   N33.0 A18.1 
    ##  7 K67.3*A18.3  K67.3*  A18.3   K67.3 A18.3 
    ##  8 K93.0*A18.3  K93.0*  A18.3   K93.0 A18.3 
    ##  9 K23.0*A18.8  K23.0*  A18.8   K23.0 A18.8 
    ## 10 M01.0*A39.8  M01.0*  A39.8   M01.0 A39.8 
    ## # ... with 54,428 more rows

``` r
#icd10fi_extended_by_group %>%filter( str_detect(CodeId, "N08.3")) %>% view
```

How many already exists ?

``` r
new_icd10fi_extended <- left_join(icd10fi_extended, 
          ICD10fi %>% select(CodeId) %>%  mutate(is=TRUE), 
          by="CodeId"
) %>%
  filter(is.na(is))

nrow(icd10fi_extended)-nrow(new_icd10fi_extended)
```

    ## [1] 339

## Append the new codes to the standard

``` r
# get one code source codes 
icd10fi_source <- read_csv("./icd10fi_for_source_vocabulary0.csv")
```

    ## Parsed with column specification:
    ## cols(
    ##   code = col_character(),
    ##   name_fi = col_character(),
    ##   name_en = col_character(),
    ##   name_se = col_character(),
    ##   valid_start_date = col_date(format = ""),
    ##   valid_end_date = col_date(format = ""),
    ##   name_en_source = col_character()
    ## )

``` r
# TODO: this should be in the format_ICD10 file
icd10fi_source <- left_join(
  icd10fi_source, 
  ICD10fi %>% rename(code=CodeId, code1=`A:Koodi1`, code2=`A:Koodi2`, connector_mark=`A:Yhdistelymerkki`) %>% 
    select(code, code1, code2, connector_mark), 
  by="code"
  ) %>% 
  mutate(code_class = case_when(
    is.na(connector_mark) & !is.na(code2) ~ "classification", 
    !is.na(code2) ~ "2 code", 
    TRUE ~ "1 code"
  ))

icd10fi_source_1_code <- icd10fi_source %>% filter(code_class=="1 code") %>% select(-code1, -code2, - code_class, -connector_mark)
```

``` r
# join code1 info
icd10_extended_tmp1 <- left_join(
  new_icd10fi_extended, 
  icd10fi_source_1_code %>% rename_all(~str_c("code1_",.)) %>% rename(CodeId1=code1_code), 
  by="CodeId1"
)

# join code2 info
icd10_extended_tmp2 <- left_join(
  icd10_extended_tmp1, 
  icd10fi_source_1_code %>% rename_all(~str_c("code2_",.)) %>% rename(CodeId2=code2_code), 
  by="CodeId2"
)
```

``` r
#merge cols 
icd10_extended <- icd10_extended_tmp2 %>% mutate(
    #names
    name_fi = str_c(code1_name_fi, " LIITTYVÄ  ",code2_name_fi),
    name_en = str_c(code1_name_en, " RELATED-TO  ",code2_name_en),
    name_se = str_c(code1_name_se, " RELATERAD-TILL  ",code2_name_se),
    name_en_source = case_when(
      code1_name_en_source == "THL"    & code2_name_en_source == "THL"    ~ "THL",
      code1_name_en_source == "THL"    & code2_name_en_source == "Google" ~ "THL+Google",
      code1_name_en_source == "Google" & code2_name_en_source == "THL"    ~ "THL+Google",
      code1_name_en_source == "Google" & code2_name_en_source == "Google" ~ "Google"
    ),
    # dates 
    valid_start_date = max(code1_valid_start_date, code2_valid_start_date),
    valid_end_date   = min(code1_valid_end_date,   code2_valid_end_date),
    #
    code_class = "2 code generated", 
    connector_mark = "*"
  ) %>% 
  rename(code=CodeId) %>% 
  select(code, name_fi, name_en, name_se, valid_start_date, valid_end_date,  name_en_source,  code1,  code2,  connector_mark,  code_class, CodeId1, CodeId2)


#join 
icd10fi <- bind_rows(icd10fi_source, icd10_extended)
```

``` r
write_csv(icd10fi, "./ICD10_for_source_vocabulary_extended.csv")
```
