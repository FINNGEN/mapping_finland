icd8fi
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

TODO ask [@CoderMikolaj](github.com/CoderMikolaj) how table was created.

TODO: Missing English translations were made using Google-tralator

<div class="kable-table">

| name\_en\_source |    n |
| :--------------- | ---: |
| THL              | 6147 |
| TODO:Google      |  760 |

</div>

Source table with added translation has been formatted to be similar to
OMOP in
[1\_source\_vocabulary/icd8fi\_for\_source\_vocabulary.csv](1_source_vocabulary/icd8fi_for_source_vocabulary.csv).

# Mapping the source vocabulary to the standard vocabularies

TODO: In short, USAGI , to conditions high level concepts ??

Once the english tralations have been checked, or mappe to the lating
names like in icd9fi

## Progess in number of codes

From 6 907 codes 0 have been approved.

This makes 0% of codes approved.

## Progess in number of events

# Assessing coverage of databases

## Database finngen

**How many codes labeled as icd8fi in finngen are not in the icd8fi
standard?**

There are 229 codes not found in the standard

Top10 sort by freq:

| code  | freq | freq\_per |
| :---- | ---: | :-------- |
| 00000 | 2402 | 0.553%    |
| 62550 |  501 | 0.115%    |
| 38699 |  395 | 0.091%    |
| 61200 |  238 | 0.055%    |
| 66170 |  221 | 0.051%    |
| 64094 |  162 | 0.037%    |
| 62551 |  155 | 0.036%    |
| 46300 |  141 | 0.032%    |
| 0     |  134 | 0.031%    |
| 22005 |  127 | 0.029%    |

The full list can be found in
[./3\_freq\_of\_source\_codes/finngen\_not\_in\_icd8fi.csv](./3_freq_of_source_codes/finngen_not_in_icd8fi.csv)

**Status of the icd8fi codes infinngen**

| status      | n\_codes | per\_codes | n\_events | per\_events |
| :---------- | -------: | :--------- | --------: | :---------- |
| not\_mapped |     2549 | 91.757%    |    425896 | 98.064%     |
| not\_found  |      229 | 8.243%     |      8406 | 1.936%      |
