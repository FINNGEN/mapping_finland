ICD8fi
================

  - [Intro](#intro)
  - [Formating source vocabulary to
    OMOP](#formating-source-vocabulary-to-omop)
      - [Progess in number of codes](#progess-in-number-of-codes)
  - [Assessing coverage of databases](#assessing-coverage-of-databases)
      - [Database finngen](#database-finngen)

# Intro

TODO:

# Formating source vocabulary to OMOP

TODO ask [@CoderMikolaj](github.com/CoderMikolaj) how table was created.

TODO: Missing English translations were made using Google-tralator

## Progess in number of codes

From 6 736 codes 0 have been approved.

This makes 0% of codes approved.

# Assessing coverage of databases

## Database finngen

**How many codes labeled as ICD8fi in finngen are not in the atc
standard?**

There are 231 codes not found in the standard

Top10 sorted by freq:

<div class="kable-table">

| concept\_code | freq | freq\_per |
| :------------ | ---: | :-------- |
| 00000         | 2402 | 0.553%    |
| 62550         |  501 | 0.115%    |
| 38699         |  395 | 0.091%    |
| 71700         |  308 | 0.071%    |
| 13300         |  272 | 0.063%    |
| 61200         |  238 | 0.055%    |
| 66170         |  221 | 0.051%    |
| 64094         |  162 | 0.037%    |
| 62551         |  155 | 0.036%    |
| 46300         |  141 | 0.032%    |

</div>

The full list can be found in
[./3\_freq\_of\_source\_codes/finngen\_not\_in\_ICD8fi.csv](./3_freq_of_source_codes/finngen_not_in_ICD8fi.csv)

**Status of the ICD8fi codes infinngen**

<div class="kable-table">

| status      | n\_codes | per\_codes | n\_events | per\_events |
| :---------- | -------: | :--------- | --------: | :---------- |
| not\_mapped |     2547 | 91.685%    |    425316 | 97.931%     |
| not\_found  |      231 | 8.315%     |      8986 | 2.069%      |

</div>
