SPAT
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

<div class="kable-table">

| tmp\_name\_en\_source |   n |
| :-------------------- | --: |
| Traslator             | 415 |

</div>

Source table with added translation has been formatted to be similar to
OMOP in
[1\_source\_vocabulary/spat\_for\_source\_vocabulary.csv](1_source_vocabulary/spat_for_source_vocabulary.csv).

## Progess in number of codes

From 415 codes 0 have been approved.

This makes 0% of codes approved.

# Assessing coverage of databases

## Database finngen

**How many codes labeled as SPAT in finngen are not in the atc
standard?**

There are 9 codes not found in the standard

Top10 sorted by freq:

<div class="kable-table">

| concept\_code | freq | freq\_per |
| :------------ | ---: | :-------- |
| \-1           |  847 | 0.014%    |
| \-2           |   52 | 0.001%    |
| XLD00         |   26 | 0.000%    |
| WW200         |   14 | 0.000%    |
| OAA11         |    8 | 0.000%    |
| OAB30         |    8 | 0.000%    |
| JFA15         |    7 | 0.000%    |
| OAB47         |    7 | 0.000%    |
| OAA70         |    6 | 0.000%    |

</div>

The full list can be found in
[./3\_freq\_of\_source\_codes/finngen\_not\_in\_SPAT.csv](./3_freq_of_source_codes/finngen_not_in_SPAT.csv)

**Status of the SPAT codes infinngen**

<div class="kable-table">

| status      | n\_codes | per\_codes | n\_events | per\_events |
| :---------- | -------: | :--------- | --------: | :---------- |
| not\_mapped |      323 | 97.289%    |   6112598 | 99.984%     |
| not\_found  |        9 | 2.711%     |       975 | 0.016%      |

</div>
