ICD9fi mappings
================

## Mapping type : USAGUI

#### Preparation fotrUSAGI

In short, USAGI directly on icd9fi’s source names (Latin, Finnish, or
English) ranked by frequency calculated from FinnGen-DF5.

The frequencies from FinnGen-DF5
[3\_freq\_of\_source\_codes/freq\_total.csv](3_freq_of_source_codes/freq_total.csv)
were append to
[1\_source\_vocabulary/CONCEPT\_ICD9fi.csv](1_source_vocabulary/CONCEPT_ICD9fi.csv).

Mapping was carried by medical student
[@kalleaseppala](github.com/kalleaseppala).

#### After USAGI

Summary of mapping progress after USAGI:

<div class="kable-table">

| mappingStatus |    n |
| :------------ | ---: |
| APPROVED      |  657 |
| UNCHECKED     | 2189 |

</div>

Accepted codes covers 72% of the total number of events in the combined
databases.

Accepted codes covers all codes with more than 293 events in the
combined databases.

Top10 of the unchecked events sort by number of events :

<div class="kable-table">

| sourceCode | sourceFrequency | matchScore | sourceName                                         | ADD\_<INFO:possible_english_name>                           |
| :--------- | --------------: | ---------: | :------------------------------------------------- | :---------------------------------------------------------- |
| 2411A      |             293 |  0.5691079 | STRUMA ATOXICA MULTINODULARIS                      | Nontoxic multinodular goiter                                |
| 6201A      |             292 |  0.4690962 | CYSTA OVARII CORPORIS LUTEI                        | Corpus luteum cyst or hematoma                              |
| 0340A      |             291 |  0.4300646 | TONSILLITIS STREPTOCOCCICA,STREPTOC BETAHAEMOLYT-A | Streptococcal sore throat                                   |
| 8024A      |             291 |  0.5720443 | FRACTURA MAXILLAE ET ARCUS ZYGOMATICI              | Closed fracture of malar and maxillary bones                |
| 6522A      |             290 |  0.1796813 | PRAESENTATIO CLUNIUM,RASKAUDEN AIKANA              | Breech presentation without mention of version              |
| 7183A      |             290 |  0.4764987 | LUXATIO HABITUALIS, OLKANIVEL                      | Recurrent dislocation of joint                              |
| 5509X      |             289 |  0.3497866 | HERNIA INGUINALIS SINE GANGR/OBSTR,ALIA SEU NUD    | Inguinal hernia, without mention of obstruction or gangrene |
| 5410X      |             288 |  0.7500632 | APPENDICITIS NUD                                   | Appendicitis, unqualified                                   |
| 4553A      |             287 |  0.6549118 | HAEMORRHOIDES EXTERNI NON COMPLICATAE              | External hemorrhoids without mention of complication        |
| 6117B      |             287 |  0.3954999 | TUMOR MAMMAE                                       | Signs and symptoms in breast                                |

</div>

## Formating mappigs to OMOP

Mappings based on USAGI.

  - For valid\_start\_date max of source concept and mapped concept is
    chosen
  - For valid\_end\_date min of source concept and mapped concept is
    chosen

<div class="kable-table">

| concept\_id\_1 | concept\_id\_2 | relationship\_id | valid\_start\_date | valid\_end\_date | invalid\_reason | temp\_mapping\_type |
| -------------: | -------------: | :--------------- | :----------------- | :--------------- | :-------------- | :------------------ |
|             19 |         196328 | Maps to          | 1970-01-01         | 2099-12-31       | NA              | USAGI               |
|             65 |       46273592 | Maps to          | 2015-07-31         | 2099-12-31       | NA              | USAGI               |
|             67 |        4314257 | Maps to          | 1970-01-01         | 2099-12-31       | NA              | USAGI               |
|             68 |         193688 | Maps to          | 1970-01-01         | 2099-12-31       | NA              | USAGI               |
|             70 |         199718 | Maps to          | 1970-01-01         | 2099-12-31       | NA              | USAGI               |
|             73 |         196620 | Maps to          | 1970-01-01         | 2099-12-31       | NA              | USAGI               |
|             74 |        4230249 | Maps to          | 1970-01-01         | 2099-12-31       | NA              | USAGI               |
|             76 |         198337 | Maps to          | 1970-01-01         | 2099-12-31       | NA              | USAGI               |
|             77 |         197484 | Maps to          | 1970-01-01         | 2099-12-31       | NA              | USAGI               |
|            307 |         138346 | Maps to          | 1970-01-01         | 2099-12-31       | NA              | USAGI               |

</div>
