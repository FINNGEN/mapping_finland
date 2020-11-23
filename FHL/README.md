FHL
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

The fhl codes were downloaded from [nose](nose) (3.4.2020). Missing
codes, translations and validity dates were manually colledted from
kela’s web page into table
[./1\_source\_vocabulary/Kela\_fhlursement\_codes.xlsx](./1_source_vocabulary/Kela_fhlursement_codes.xlsx)
by [@CoderMikolaj](github.com/CoderMikolaj).

Resulting table contains the codes, names, and validity periods. Some
codes (e.g 307) have a different names during different periods, and
therefore codes are repeated on the table for name and time period.

TODO: we got the name changes over time only for the top 21 codes. The
rest should be checked. (top 21 bcs were the ones with no name at all
kela’s )

Missing English translations were made using Google-tralator

<div class="kable-table">

| tmp\_name\_en\_source |    n |
| :-------------------- | ---: |
| Google                | 1639 |

</div>

Source table with added translation has been formatted to be similar to
OMOP in
[1\_source\_vocabulary/fhl\_for\_source\_vocabulary.csv](1_source_vocabulary/fhl_for_source_vocabulary.csv).

## Progess in number of codes

From 1 639 codes 0 have been approved.

This makes 0% of codes approved.

# Assessing coverage of databases

## Database finngen

**How many codes labeled as FHL in finngen are not in the atc
standard?**

There are 10 codes not found in the standard

Top10 sorted by freq:

<div class="kable-table">

| concept\_code | freq | freq\_per |
| :------------ | ---: | :-------- |
| 0             |  366 | 0.210%    |
| \_\_\_\_      |  170 | 0.098%    |
| 6823          |   34 | 0.020%    |
| 7215          |   33 | 0.019%    |
| 6469          |   16 | 0.009%    |
| 6903          |   16 | 0.009%    |
| 9744          |   16 | 0.009%    |
| 0000          |    9 | 0.005%    |
| 1392          |    9 | 0.005%    |
| 120           |    8 | 0.005%    |

</div>

The full list can be found in
[./3\_freq\_of\_source\_codes/finngen\_not\_in\_FHL.csv](./3_freq_of_source_codes/finngen_not_in_FHL.csv)

**Status of the FHL codes infinngen**

<div class="kable-table">

| status      | n\_codes | per\_codes | n\_events | per\_events |
| :---------- | -------: | :--------- | --------: | :---------- |
| not\_mapped |      955 | 98.964%    |    173482 | 99.611%     |
| not\_found  |       10 | 1.036%     |       677 | 0.389%      |

</div>
