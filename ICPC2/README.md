ICPC
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

`ICPC2_merged_and__ICPC1_from_DF6_UTF8.txt` Contains the ICPC codes with
English and Finnish names.

This table comes from several sources. Created by
<mikolaj.wojnicki@helsinki.fi>.

<div class="kable-table">

| concept\_class\_id |    n |
| :----------------- | ---: |
| ICPC2              | 1383 |
| ICPC2proc          |   40 |
| ICPC1              |   20 |

</div>

Details in
[./1\_source\_vocabulary/README.md](./1_source_vocabulary/README.md)

# Mapping the source vocabulary to the standard vocabularies

In short, the source table already includes a column with the equivalent
ICD10 codes. This was mapped to the OMOP’s ICD10who `concept_id`.

## Progess in number of codes

From 1 443 codes 940 have been approved.

This makes 65% of codes approved.

# Assessing coverage of databases

## Database finngen

**How many codes labeled as ICPC in finngen are not in the atc
standard?**

There are 3 codes not found in the standard

Top10 sorted by freq:

<div class="kable-table">

| concept\_code |  freq | freq\_per |
| :------------ | ----: | :-------- |
| \-1           | 37669 | 0.498%    |
| \-2           |  4283 | 0.057%    |
| F21           |   891 | 0.012%    |

</div>

The full list can be found in
[./3\_freq\_of\_source\_codes/finngen\_not\_in\_ICPC.csv](./3_freq_of_source_codes/finngen_not_in_ICPC.csv)

**Status of the ICPC codes infinngen**

<div class="kable-table">

| status      | n\_codes | per\_codes | n\_events | per\_events |
| :---------- | -------: | :--------- | --------: | :---------- |
| mapped      |      672 | 66.469%    |   6404158 | 84.633%     |
| not\_mapped |      336 | 33.234%    |   1119966 | 14.801%     |
| not\_found  |        3 | 0.297%     |     42843 | 0.566%      |

</div>
