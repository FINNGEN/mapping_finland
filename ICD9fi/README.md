ICD9fi
================

  - [Intro](#intro)
  - [Formating source vocabulary to
    OMOP](#formating-source-vocabulary-to-omop)
  - [Mapping the source vocabulary to the standard
    vocabularies](#mapping-the-source-vocabulary-to-the-standard-vocabularies)
      - [Progess in number of codes](#progess-in-number-of-codes)
      - [Progess in number of events](#progess-in-number-of-events)
  - [Assessing coverage of databases](#assessing-coverage-of-databases)
      - [Database finngen](#database-finngen)

# Intro

TODO

# Formating source vocabulary to OMOP

The icd9fi codes have been …

TODO: i got it from aki now in the gitlab repo

The concept names are a mixed of Latin, Finnish, and English \!\!. These
are not translated to English \!\!. The English name were append by
matching the ICD9fi code to the ICD9 code dowloaded from
[Wolfbane.com](http://www.wolfbane.com/icd/) (1.6.2020).

There are 5 tipes of maching :

TODO

<div class="kable-table">

| name\_en\_source                         |    n |
| :--------------------------------------- | ---: |
| ICD9\_code\_match(parent\_match)         | 4304 |
| ICD9\_code\_match(unique\_parent\_match) | 3729 |
| ICD9\_code\_match(full\_match)           |  905 |
| ICD9\_code\_match(grandparent\_match)    |  171 |
| ICD9\_code\_match(no\_match)             |    2 |

</div>

Source table with added translation has been formatted to be similar to
OMOP in
[1\_source\_vocabulary/icd9fi\_for\_source\_vocabulary.csv](1_source_vocabulary/icd9fi_for_source_vocabulary.csv).

TODO: missing validity dates

# Mapping the source vocabulary to the standard vocabularies

In short, USAGI directly on icd9fi’s source names (Latin, Finnish, or
English) ranked by frequency calculated from FinnGen-DF5.

The frequencies from FinnGen-DF5
[3\_freq\_of\_source\_codes/freq\_total.csv](3_freq_of_source_codes/freq_total.csv)
were append to
[1\_source\_vocabulary/icd9fi\_for\_source\_vocabulary.csv](1_source_vocabulary/icd9fi_for_source_vocabulary.csv).
Resulting table was imported in to USAGY with vocabularies
[2\_mapping\_to\_standard/USAGI/VocabularyIds.txt](2_mapping_to_standard/USAGI/VocabularyIds.txt)
version
[2\_mapping\_to\_standard/USAGI/vocabularyVersion.txt](2_mapping_to_standard/USAGI/vocabularyVersion.txt).
Mapping was performed on the icd9fi’s source names (Latin, Finnish, or
English) and the English name was solely use as a guide.

Mapping was carried by medical student
[@kalleaseppala](github.com/kalleaseppala).

## Progess in number of codes

From 2 855 codes 657 have been approved.

This makes 23% of codes approved.

<div class="kable-table">

| mappingStatus |    n |
| :------------ | ---: |
| APPROVED      |  657 |
| UNCHECKED     | 2189 |

</div>

## Progess in number of events

Accepted codes covers 72% of the total number of events in the combined
databases.

Accepted codes covers all codes with more than 293 events in the
combined databases.

Top10 of the unchecked events sort by number of events :

<div class="kable-table">

| sourceCode | sourceFrequency | matchScore | sourceName                                         | name\_en\_icd9                                              |
| :--------- | --------------: | ---------: | :------------------------------------------------- | :---------------------------------------------------------- |
| 2411A      |             293 |         NA | STRUMA ATOXICA MULTINODULARIS                      | Nontoxic multinodular goiter                                |
| 6201A      |             292 |         NA | CYSTA OVARII CORPORIS LUTEI                        | Corpus luteum cyst or hematoma                              |
| 0340A      |             291 |         NA | TONSILLITIS STREPTOCOCCICA,STREPTOC BETAHAEMOLYT-A | Streptococcal sore throat                                   |
| 8024A      |             291 |         NA | FRACTURA MAXILLAE ET ARCUS ZYGOMATICI              | Closed fracture of malar and maxillary bones                |
| 6522A      |             290 |         NA | PRAESENTATIO CLUNIUM,RASKAUDEN AIKANA              | Breech presentation without mention of version              |
| 7183A      |             290 |         NA | LUXATIO HABITUALIS, OLKANIVEL                      | Recurrent dislocation of joint                              |
| 5509X      |             289 |         NA | HERNIA INGUINALIS SINE GANGR/OBSTR,ALIA SEU NUD    | Inguinal hernia, without mention of obstruction or gangrene |
| 5410X      |             288 |         NA | APPENDICITIS NUD                                   | Appendicitis, unqualified                                   |
| 4553A      |             287 |         NA | HAEMORRHOIDES EXTERNI NON COMPLICATAE              | External hemorrhoids without mention of complication        |
| 6117B      |             287 |         NA | TUMOR MAMMAE                                       | Signs and symptoms in breast                                |

</div>

# Assessing coverage of databases

## Database finngen

**How many codes labeled as icd9fi in finngen are not in the icd9fi
standard?**

There are 49 codes not found in the standard

Top10 sort by freq:

| code  | freq | freq\_per |
| :---- | ---: | :-------- |
| 4610A | 1663 | 0.416%    |
| 6440A | 1622 | 0.406%    |
| 2968A | 1438 | 0.360%    |
| 2200A |  752 | 0.188%    |
| 5301A |  518 | 0.130%    |
| 6282B |  417 | 0.104%    |
| 6582B |  325 | 0.081%    |
| 6528B |  278 | 0.070%    |
| 6341A |  264 | 0.066%    |
| 3882A |  139 | 0.035%    |

The full list can be found in
[./3\_freq\_of\_source\_codes/finngen\_not\_in\_icd9fi.csv](./3_freq_of_source_codes/finngen_not_in_icd9fi.csv)

**Status of the icd9fi codes infinngen**

| status      | n\_codes | per\_codes | n\_events | per\_events |
| :---------- | -------: | :--------- | --------: | :---------- |
| mapped      |      691 | 23.592%    |    345305 | 74.738%     |
| not\_mapped |     2189 | 74.735%    |    108407 | 23.464%     |
| not\_found  |       49 | 1.673%     |      8311 | 1.799%      |
