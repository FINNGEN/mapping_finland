ATC
================

  - [Intro](#intro)
  - [Formating source vocabulary to
    OMOP](#formating-source-vocabulary-to-omop)
  - [Mapping the source vocabulary to the standard
    vocabularies](#mapping-the-source-vocabulary-to-the-standard-vocabularies)
      - [Progess in number of codes](#progess-in-number-of-codes)
  - [Assessing coverage of databases](#assessing-coverage-of-databases)
      - [Database finngen](#database-finngen)
      - [Database tays](#database-tays)

# Intro

# TODO
ATC, VNRO and KELA reimbursement codes are interrelated.

# Formating source vocabulary to OMOP

ATC codes are already part of the OMOP vocabularies.

However, I notice that few old codes are missing and reported in the
forum ([see
post](https://forums.ohdsi.org/t/atc-alterations-missing-in-omop/11496/3)).
In sort, ATC releases do not incude these any more and are out of the
OMOP pipeline, but they could be included.

ATC codes missing in OMOP are listed in
[1\_source\_vocabulary/missing\_atc\_in\_omop.csv](./1_source_vocabulary/missing_atc_in_omop.csv)

# Mapping the source vocabulary to the standard vocabularies

ATC codes are consider Classification codes in OMOP. However, there is a
working group in OMOP with this aim
[here](https://www.ohdsi.org/web/wiki/doku.php?id=projects:workgroups:atc).
It seems to be difficult for some 5th level ATC codes.

## Progess in number of codes

From 6 396 codes 4 418 have been approved.

This makes 69% of codes approved.

# Assessing coverage of databases

## Database finngen

**How many codes labeled as ATC in finngen are not in the atc
standard?**

There are 67 codes not found in the standard

Top10 sorted by freq:

<div class="kable-table">

| concept\_code |   freq | freq\_per |
| :------------ | -----: | :-------- |
| J01DA01       | 212106 | 0.468%    |
| E000001       | 126123 | 0.278%    |
| E000002       |  53278 | 0.117%    |
| J01DA09       |  43863 | 0.097%    |
| NA            |  40881 | 0.090%    |
| NA            |  40881 | 0.090%    |
| G03DC05       |  30761 | 0.068%    |
| L04AA01       |  29573 | 0.065%    |
| E000007       |  21913 | 0.048%    |
| E000006       |  20537 | 0.045%    |

</div>

The full list can be found in
[./3\_freq\_of\_source\_codes/finngen\_not\_in\_ATC.csv](./3_freq_of_source_codes/finngen_not_in_ATC.csv)

**Status of the ATC codes infinngen**

<div class="kable-table">

| status      | n\_codes | per\_codes | n\_events | per\_events |
| :---------- | -------: | :--------- | --------: | :---------- |
| mapped      |      979 | 88.517%    |  43184873 | 95.218%     |
| not\_mapped |       60 | 5.425%     |   1404682 | 3.097%      |
| not\_found  |       67 | 6.058%     |    763930 | 1.684%      |

</div>

    ## Parsed with column specification:
    ## cols(
    ##   concept_code = col_character(),
    ##   concept_id = col_logical(),
    ##   substance_name = col_character(),
    ##   new_atc_code = col_character(),
    ##   year_of_change = col_double()
    ## )

**Reasons why not found**

<div class="kable-table">

| reason\_not\_found         | n\_codes | per\_codes | n\_events | per\_events |
| :------------------------- | -------: | :--------- | --------: | :---------- |
| ATC starst with E          |        8 | 0.723%     |    240855 | 0.531%      |
| Excluded from ATC releases |       17 | 1.537%     |    358983 | 0.792%      |
| unknown                    |       42 | 3.797%     |    164092 | 0.362%      |

</div>

Top10 of unknown sorted by freq:

<div class="kable-table">

| concept\_code |  freq | freq\_per |
| :------------ | ----: | :-------- |
| NA            | 40881 | 0.090%    |
| NA            | 40881 | 0.090%    |
| S01EX03       | 16212 | 0.036%    |
| A10AA02       | 12019 | 0.027%    |
| A10AA01       | 10816 | 0.024%    |
| G04AC01       |  4416 | 0.010%    |
| 1A1           |  4246 | 0.009%    |
| N02CX04       |  3752 | 0.008%    |
| B04AB02       |  3560 | 0.008%    |
| A02BDXX       |  3299 | 0.007%    |

</div>

## Database tays

**How many codes labeled as ATC in tays are not in the atc standard?**

There are 67 codes not found in the standard

Top10 sorted by freq:

<div class="kable-table">

| concept\_code |  freq | freq\_per |
| :------------ | ----: | :-------- |
| NA            | 34518 | 1.255%    |
| NA            |  6789 | 0.247%    |
| D02AM         |  2427 | 0.088%    |
| D02AL         |  2399 | 0.087%    |
| V06DB30       |  1338 | 0.049%    |
| V06DB65       |  1291 | 0.047%    |
| D02AN         |  1193 | 0.043%    |
| V06DB63       |   457 | 0.017%    |
| W             |   357 | 0.013%    |
| V06DB57       |   168 | 0.006%    |

</div>

The full list can be found in
[./3\_freq\_of\_source\_codes/tays\_not\_in\_ATC.csv](./3_freq_of_source_codes/tays_not_in_ATC.csv)

**Status of the ATC codes intays**

<div class="kable-table">

| status      | n\_codes | per\_codes | n\_events | per\_events |
| :---------- | -------: | :--------- | --------: | :---------- |
| mapped      |     1339 | 85.778%    |   2595558 | 94.345%     |
| not\_mapped |      155 | 9.930%     |    103314 | 3.755%      |
| not\_found  |       67 | 4.292%     |     52251 | 1.899%      |

</div>

**Reasons why not found**

<div class="kable-table">

| reason\_not\_found         | n\_codes | per\_codes | n\_events | per\_events |
| :------------------------- | -------: | :--------- | --------: | :---------- |
| Excluded from ATC releases |        5 | 0.320%     |        45 | 0.002%      |
| unknown                    |       62 | 3.972%     |     52206 | 1.898%      |

</div>

Top10 of unknown sorted by freq:

<div class="kable-table">

| concept\_code |  freq | freq\_per |
| :------------ | ----: | :-------- |
| NA            | 34518 | 1.255%    |
| NA            |  6789 | 0.247%    |
| D02AM         |  2427 | 0.088%    |
| D02AL         |  2399 | 0.087%    |
| V06DB30       |  1338 | 0.049%    |
| V06DB65       |  1291 | 0.047%    |
| D02AN         |  1193 | 0.043%    |
| V06DB63       |   457 | 0.017%    |
| W             |   357 | 0.013%    |
| V06DB57       |   168 | 0.006%    |

</div>
