ICPC2
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

This table comes from the ontology gitlab repo. Created by
<mikolaj.wojnicki@helsinki.fi>.

It combines - ICPD2 download from
[kodistopalvelu](https://version.helsinki.fi/ontology-group/ontologists/-/wikis/uploads/ce2ce4426b394ef58021b198b28869d4/Koodistopalvelu_ICPC2_v5_2020-04-03.xlsx)
03.04.2020 `standard_ICPC2_kodistopalvelu_282_1471432260621.txt` -
ICPD2\_procedures download from
[kodistopalvelu](https://version.helsinki.fi/ontology-group/ontologists/-/wikis/uploads/ca4885e34d5715029f3305e4fb222960/Koodistopalvelu_ICPC2_prosessikoodit_v5_2020-04-03.xlsx)
03.04.2020
`standard_ICPC2_procedures_kodistopalvelu_283_1472198856551.txt` -
English names downloaded from [Norwegian Directorate of
eHealth](https://ehelse.no/kodeverk/icpc-2e--english-version)
`icpc-2e-v7.0.xlsx`. - ICPC1 downloaded from ??

TODO: not sure if all english names come from norwegian ??

There are 3 different types of ICPC codes:

<div class="kable-table">

| ICPC\_version |    n |
| :------------ | ---: |
| ICPC1         |   20 |
| ICPC2         | 1383 |
| ICPC2\_proc   |   40 |

</div>

Source table with added translation has been formatted to be similar to
OMOP in
[1\_source\_vocabulary/icpc2\_for\_source\_vocabulary.csv](1_source_vocabulary/icpc2_for_source_vocabulary.csv).

# Mapping the source vocabulary to the standard vocabularies

In short, the source table already includes a column with the equivalent
ICD10 codes. This was mapped to the OMOP’s ICD10who `concept_id`.

## Progess in number of codes

From 1 443 codes 1 110 have been approved.

This makes 77% of codes approved.

<div class="kable-table">

| mappingStatus |    n |
| :------------ | ---: |
| AUTO\_MAPPED  | 1110 |
| NOT\_MAPPED   |  333 |

</div>

Grouped by icpc version

<div class="kable-table">

| ICPC\_version | mappingStatus |    n |
| :------------ | :------------ | ---: |
| ICPC1         | AUTO\_MAPPED  |   17 |
| ICPC1         | NOT\_MAPPED   |    3 |
| ICPC2         | AUTO\_MAPPED  | 1093 |
| ICPC2         | NOT\_MAPPED   |  290 |
| ICPC2\_proc   | NOT\_MAPPED   |   40 |

</div>

# Assessing coverage of databases

## Database finngen

**How many codes labeled as icpc2 in finngen are not in the icpc2
standard?**

There are 3 codes not found in the standard

Top10 sort by freq:

| code |  freq | freq\_per |
| :--- | ----: | :-------- |
| \-1  | 37669 | 0.498%    |
| \-2  |  4283 | 0.057%    |
| F21  |   891 | 0.012%    |

The full list can be found in
[./3\_freq\_of\_source\_codes/finngen\_not\_in\_icpc2.csv](./3_freq_of_source_codes/finngen_not_in_icpc2.csv)

**Status of the icpc2 codes infinngen**

| status      | n\_codes | per\_codes | n\_events | per\_events |
| :---------- | -------: | :--------- | --------: | :---------- |
| mapped      |      783 | 77.448%    |   6603359 | 87.266%     |
| not\_mapped |      225 | 22.255%    |    920765 | 12.168%     |
| not\_found  |        3 | 0.297%     |     42843 | 0.566%      |
