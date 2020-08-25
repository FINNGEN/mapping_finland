ICD10fi mappings
================

## NOTES

Several codes cover the same concept. They have the same LongName and
ShortName.

This is can be due to two reasons: - A concept exists on the table as to
be append to others “C55”, and to be used as diagnosis “c55&”. - Same
concept described as ”Oirekoodi” and ”Syykoodi”, e.g. J17.3\*B77.8
(Pneumonia in ascariasis) and B77.8+J17.3 (ascariasis caused by
Pneumonia)

**Distribution**

<div class="kable-table">

| tmp\_code\_class |     n |
| :--------------- | ----: |
| 1 code           | 13346 |
| 2 code           |  1037 |
| 2 code generated | 54099 |

</div>

## 1\. Mapping type : ICD10who + USAGUI

First, we map codes to ICD10who by code and name

Second, codes that didn’t find a map to ICD10who are mapped to
standard-OMOP using USAGI

### 1.1 Matchind codes to ICD10who

Try to match icd10fi’s “1 code” codes to icd10who by code and name.

Also try to match icd10fi’s “2 code” to icd10who by name.

##### How many “1 code” are a direct match to ICD10who??

If matching directly to ICD10fi code

    ## [1] 9587

If matching to ICD10fi code without any union-marks

    ## [1] 10716

##### How well these agree in the definition ??

Count the differences in characters (string distance) between the
English names of icd10fi and icd10who full matches

<div class="kable-table">

| English\_name\_match\_level |    n |
| --------------------------: | ---: |
|                           0 | 8982 |
|                           1 |   95 |
|                           2 |  180 |
|                           3 |  225 |
|                           4 |  130 |
|                           5 |   18 |
|                           6 |    9 |
|                           7 |   33 |
|                           8 |    8 |
|                           9 |    5 |
|                          10 |   34 |
|                          11 |   23 |
|                          12 |    9 |
|                          13 |    7 |
|                          14 |   15 |
|                          15 |   16 |
|                          16 |   13 |
|                          17 |  145 |
|                          18 |   12 |
|                          19 |   58 |

</div>

Most (8993) match the name exactly\!\!,

##### Expert checked almost matches

These almost matching are saved in
[icd10fi\_almost\_match\_icd10who.csv](icd10fi_almost_match_icd10who.csv).

Name matching was confirmed or rejected by had by Helmi and save as
[icd10fi\_almost\_match\_icd10who\_CHECKED.csv](icd10fi_almost_match_icd10who_CHECKED.csv).

    ## [1] TRUE

##### How many concepts are in ICD10who but have a different code?

Some concepts are repeated with a different ICD10fi code. Find these in
“2 code” and `ICD10fi_1code_no_match` by having the same
tmp\_name\_fi(icd10fi)

<div class="kable-table">

| concept\_code | concept\_code\_who | tmp\_name\_fi                             | concept\_name                                |
| :------------ | :----------------- | :---------------------------------------- | :------------------------------------------- |
| G46.3\*I67.9  | G46.3\*            | Aivorungon halvausoireyhtymä              | Brain stem stroke syndrome (I60-I67+)        |
| I67.9+G46.3   | G46.3\*            | Aivorungon halvausoireyhtymä              | Brain stem stroke syndrome (I60-I67+)        |
| I00+L54.0     | L54.0\*            | Akuutti kuumereuma ja erythema marginatum | Erythema marginatum in acute rheumatic fever |
| L54.0\*I00    | L54.0\*            | Akuutti kuumereuma ja erythema marginatum | Erythema marginatum in acute rheumatic fever |
| L40.5+M07.1   | M07.1\*            | Arthritis mutilans                        | Arthritis mutilans                           |
| M07.1\*L40.5  | M07.1\*            | Arthritis mutilans                        | Arthritis mutilans                           |
| B57.3+K93.1   | K93.1\*            | Chagasin tauti ja jättikoolon             | Megacolon in Chagas’ disease                 |
| K93.1\*B57.3  | K93.1\*            | Chagasin tauti ja jättikoolon             | Megacolon in Chagas’ disease                 |
| B57.3+K23.1   | K23.1\*            | Chagasin tautiin liittyvä jättiruokatorvi | Megaoesophagus in Chagas’ disease            |
| K23.1\*B57.3  | K23.1\*            | Chagasin tautiin liittyvä jättiruokatorvi | Megaoesophagus in Chagas’ disease            |

</div>

### Create CONCEPT\_RELATIONSHIP for ICD10who matcc

<div class="kable-table">

| concept\_id\_1 | concept\_id\_who | tmp\_mapping\_type         | tmp\_code\_class | tmp\_domain\_id\_2 | concept\_id\_2 | relationship\_id | valid\_start\_date | valid\_end\_date | invalid\_reason |
| -------------: | ---------------: | :------------------------- | :--------------- | :----------------- | -------------: | :--------------- | :----------------- | :--------------- | :-------------- |
|              7 |         45537706 | ICD10who code and name\_en | 1 code           | Condition          |         198677 | Maps to          | 2014-07-01         | 2099-12-31       | NA              |
|              8 |         45537707 | ICD10who code and name\_en | 1 code           | Condition          |        4344638 | Maps to          | 2018-11-28         | 2099-12-31       | NA              |
|              9 |         45552149 | ICD10who code and name\_en | 1 code           | Condition          |         200629 | Maps to          | 1970-01-01         | 2099-12-31       | NA              |
|             10 |         45590788 | ICD10who code and name\_en | 1 code           | Condition          |         198677 | Maps to          | 1970-01-01         | 2099-12-31       | NA              |
|             11 |         45576225 | ICD10who code and name\_en | 1 code           | Condition          |         192819 | Maps to          | 2016-12-01         | 2099-12-31       | NA              |
|             12 |         45537708 | ICD10who code and name\_en | 1 code           | Condition          |         192819 | Maps to          | 2014-07-01         | 2099-12-31       | NA              |
|             16 |         45566486 | ICD10who code and name\_en | 1 code           | Condition          |         195460 | Maps to          | 1970-01-01         | 2099-12-31       | NA              |
|             17 |         45571411 | ICD10who code and name\_en | 1 code           | Condition          |         193953 | Maps to          | 1970-01-01         | 2099-12-31       | NA              |
|             18 |         45600393 | ICD10who code and name\_en | 1 code           | Condition          |         442291 | Maps to          | 1970-01-01         | 2099-12-31       | NA              |
|             19 |         45566487 | ICD10who code and name\_en | 1 code           | Condition          |         195177 | Maps to          | 1970-01-01         | 2099-12-31       | NA              |

</div>

### 1.2 Matchind unmatched “1 code” and “2 code” fwith USAGUI

##### Prepare for USAGI

    ## [1] TRUE

##### After USAGI

##### Create CONCEPT\_RELATIONSHIP wfrom USAGI

<div class="kable-table">

| concept\_id\_1 | concept\_id\_2 | relationship\_id | valid\_start\_date | valid\_end\_date | invalid\_reason | tmp\_mapping\_type | tmp\_code\_class | tmp\_domain\_id\_2 |
| -------------: | -------------: | :--------------- | :----------------- | :--------------- | :-------------- | :----------------- | :--------------- | :----------------- |
|           3808 |        4218017 | Maps to          | 1970-01-01         | 2020-12-31       | NA              | USAGI              | 2 code           | Condition          |
|           3816 |        4220313 | Maps to          | 1970-01-01         | 2020-12-31       | NA              | USAGI              | 2 code           | Condition          |
|           3824 |       43021816 | Maps to          | 2013-01-31         | 2020-12-31       | NA              | USAGI              | 2 code           | Condition          |
|           3888 |       44782422 | Maps to          | 2014-01-31         | 2020-12-31       | NA              | USAGI              | 2 code           | Condition          |
|           3916 |       44784474 | Maps to          | 2014-01-31         | 2020-12-31       | NA              | USAGI              | 2 code           | Condition          |
|           4762 |         438338 | Maps to          | 1970-01-01         | 2020-12-31       | NA              | USAGI              | 2 code           | Condition          |
|           5076 |        4102481 | Maps to          | 2010-01-01         | 2020-12-31       | NA              | USAGI              | 2 code           | Condition          |
|           5077 |        4102481 | Maps to          | 1970-01-01         | 2020-12-31       | NA              | USAGI              | 2 code           | Condition          |
|           5079 |        4105009 | Maps to          | 1970-01-01         | 2020-12-31       | NA              | USAGI              | 2 code           | Condition          |
|           5140 |       37017431 | Maps to          | 2016-01-31         | 2020-12-31       | NA              | USAGI              | 2 code           | Condition          |

</div>

### 2 Create CONCEPT\_RELATIONSHIP for 2 code generated

<div class="kable-table">

| concept\_id\_1 | tmp\_domain\_id\_2 | concept\_id\_2 | relationship\_id | valid\_start\_date | valid\_end\_date | tmp\_mapping\_type         | tmp\_code\_class |
| -------------: | :----------------- | -------------: | :--------------- | :----------------- | :--------------- | :------------------------- | :--------------- |
|              7 | Condition          |         198677 | Maps to          | 2014-07-01         | 2099-12-31       | ICD10who code and name\_en | 1 code           |
|              8 | Condition          |        4344638 | Maps to          | 2018-11-28         | 2099-12-31       | ICD10who code and name\_en | 1 code           |
|              9 | Condition          |         200629 | Maps to          | 1970-01-01         | 2099-12-31       | ICD10who code and name\_en | 1 code           |
|             10 | Condition          |         198677 | Maps to          | 1970-01-01         | 2099-12-31       | ICD10who code and name\_en | 1 code           |
|             11 | Condition          |         192819 | Maps to          | 2016-12-01         | 2099-12-31       | ICD10who code and name\_en | 1 code           |
|             12 | Condition          |         192819 | Maps to          | 2014-07-01         | 2099-12-31       | ICD10who code and name\_en | 1 code           |
|             16 | Condition          |         195460 | Maps to          | 1970-01-01         | 2099-12-31       | ICD10who code and name\_en | 1 code           |
|             17 | Condition          |         193953 | Maps to          | 1970-01-01         | 2099-12-31       | ICD10who code and name\_en | 1 code           |
|             18 | Condition          |         442291 | Maps to          | 1970-01-01         | 2099-12-31       | ICD10who code and name\_en | 1 code           |
|             19 | Condition          |         195177 | Maps to          | 1970-01-01         | 2099-12-31       | ICD10who code and name\_en | 1 code           |

</div>

## Recalculate domain

<div class="kable-table">

| domain\_id          |     n |
| :------------------ | ----: |
| Condition           | 67159 |
| Observation         |   765 |
| Condition/Obs       |   318 |
| Procedure           |   198 |
| Measurement         |    38 |
| Metadata            |     5 |
| Condition/Procedure |     4 |

</div>
