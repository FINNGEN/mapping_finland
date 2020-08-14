ICDO3
================

  - [Intro](#intro)
  - [Formating source vocabulary to
    OMOP](#formating-source-vocabulary-to-omop)
  - [Mapping the source vocabulary to the standard
    vocabularies](#mapping-the-source-vocabulary-to-the-standard-vocabularies)
      - [Progess in number of codes](#progess-in-number-of-codes)
  - [Assessing coverage of databases](#assessing-coverage-of-databases)
      - [Database finngen](#database-finngen)

# Intro

TODO:

# Formating source vocabulary to OMOP

ICDO3 codes are already part of the OMOP vocabularies.

# Mapping the source vocabulary to the standard vocabularies

Few ICDO3 codes are already standard codes. For who are not standard a
mapping to standar concept is provided by OMOP.

## Progess in number of codes

From 63 667 codes 62 924 have been approved.

This makes 99% of codes approved.

# Assessing coverage of databases

## Database finngen

**How many codes labeled as ICDO3 in finngen are not in the atc
standard?**

There are 26 codes not found in the standard

Top10 sorted by freq:

<div class="kable-table">

| concept\_code | freq | freq\_per |
| :------------ | ---: | :-------- |
| 6666/0-C53.9  |  596 | 1.349%    |
| 8070/3-C1     |   77 | 0.174%    |
| 8070/3-C99    |   75 | 0.170%    |
| 8070/3-C29    |   58 | 0.131%    |
| 8070/3-C21    |   56 | 0.127%    |
| 8070/3-C19    |   43 | 0.097%    |
| 8070/3-C49    |   29 | 0.066%    |
| 8070/3-C69    |   27 | 0.061%    |
| 8070/3-C60    |   19 | 0.043%    |
| 9591/3-C99    |   19 | 0.043%    |

</div>

The full list can be found in
[./3\_freq\_of\_source\_codes/finngen\_not\_in\_ICDO3.csv](./3_freq_of_source_codes/finngen_not_in_ICDO3.csv)

**Status of the ICDO3 codes infinngen**

<div class="kable-table">

| status     | n\_codes | per\_codes | n\_events | per\_events |
| :--------- | -------: | :--------- | --------: | :---------- |
| mapped     |      504 | 95.094%    |     43033 | 97.388%     |
| not\_found |       26 | 4.906%     |      1154 | 2.612%      |

</div>
