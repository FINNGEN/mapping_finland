HPN
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

TODO

<div class="kable-table">

| tmp\_name\_en\_source |   n |
| :-------------------- | --: |
| GOOGLE\_REVD          | 121 |
| ELISA\_LAHTELA        |  69 |

</div>

Source table with added translation has been formatted to be similar to
OMOP in
[1\_source\_vocabulary/hpn\_for\_source\_vocabulary.csv](1_source_vocabulary/hpn_for_source_vocabulary.csv).

## Progess in number of codes

From 190 codes 0 have been approved.

This makes 0% of codes approved.

# Assessing coverage of databases

## Database finngen

**How many codes labeled as HPN in finngen are not in the atc
standard?**

There are 24 codes not found in the standard

Top10 sorted by freq:

<div class="kable-table">

| concept\_code | freq | freq\_per |
| :------------ | ---: | :-------- |
| 81            | 2161 | 4.855%    |
| 82            |  702 | 1.577%    |
| 61            |  252 | 0.566%    |
| 83            |  196 | 0.440%    |
| 73            |  157 | 0.353%    |
| 72            |  145 | 0.326%    |
| 71            |  140 | 0.315%    |
| 112           |  102 | 0.229%    |
| 62            |   89 | 0.200%    |
| 211           |   70 | 0.157%    |

</div>

The full list can be found in
[./3\_freq\_of\_source\_codes/finngen\_not\_in\_HPN.csv](./3_freq_of_source_codes/finngen_not_in_HPN.csv)

**Status of the HPN codes infinngen**

<div class="kable-table">

| status      | n\_codes | per\_codes | n\_events | per\_events |
| :---------- | -------: | :--------- | --------: | :---------- |
| not\_mapped |       90 | 78.947%    |     40202 | 90.313%     |
| not\_found  |       24 | 21.053%    |      4312 | 9.687%      |

</div>
