reimb
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

The reimb codes were downloaded from [nose](nose) (3.4.2020). Missing
codes, translations and validity dates were manually colledted from
kela’s web page into table
[./1\_source\_vocabulary/Kela\_reimbursement\_codes.xlsx](./1_source_vocabulary/Kela_reimbursement_codes.xlsx)
by [@CoderMikolaj](github.com/CoderMikolaj).

Resulting table contains the codes, names, and validity periods. Some
codes (e.g 307) have a different names during different periods, and
therefore codes are repeated on the table for name and time period.

TODO: we got the name changes over time only for the top 21 codes. The
rest should be checked. (top 21 bcs were the ones with no name at all
kela’s )

Missing English translations were made using Google-tralator

<div class="kable-table">

| name\_en\_source |   n |
| :--------------- | --: |
| KELA             | 236 |
| Google           |  31 |

</div>

Source table with added translation has been formatted to be similar to
OMOP in
[1\_source\_vocabulary/reimb\_for\_source\_vocabulary.csv](1_source_vocabulary/reimb_for_source_vocabulary.csv).

# Mapping the source vocabulary to the standard vocabularies

TODO: In short, USAGI , to conditions high level concepts ?? WE NEED AN
EXPERT HERE \!\!

## Progess in number of codes

From 264 codes 0 have been approved.

This makes 0% of codes approved.

## Progess in number of events

# Assessing coverage of databases

## Database finngen

**How many codes labeled as reimb in finngen are not in the reimb
standard?**

There are 0 codes not found in the standard

Top10 sort by freq:

| code | freq | freq\_per |
| :--- | ---: | :-------- |

The full list can be found in
[./3\_freq\_of\_source\_codes/finngen\_not\_in\_reimb.csv](./3_freq_of_source_codes/finngen_not_in_reimb.csv)

**Status of the reimb codes infinngen**

| status      | n\_codes | per\_codes | n\_events | per\_events |
| :---------- | -------: | :--------- | --------: | :---------- |
| not\_mapped |      169 | 100.000%   |    318175 | 100.000%    |
