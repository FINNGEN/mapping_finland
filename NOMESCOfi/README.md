NOMESCOfi
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

The procedure classification is based on the NCSP Nordic Classification
of Surgical Procedures, first published in 1996. The NCSP classification
is maintained by the Nordic Classification Center (NCC) and is
copyrighted by NOMESKO
[ref](https://koodistopalvelu.kanta.fi/codeserver/pages/classification-view-page.xhtml?classificationKey=57&versionKey=119)

# Formating source vocabulary to OMOP

The NOMESCO codes have been downloaded from
[kodistopalvelu](https://koodistopalvelu.kanta.fi/codeserver/pages/classification-view-page.xhtml?classificationKey=57&versionKey=119)(7.5.2020).

The concept names were translated to English as translator by
<mary.reeve@helsinki.fi>

Details in
[./1\_source\_vocabulary/README.md](./1_source_vocabulary/README.md)

# Mapping the source vocabulary to the standard vocabularies

NOMESCO codes ranked by frequency calculated from FinnGen-DF5 and
TAYS-oncology.

Mapping was carried in USAGI by medical student
[@kalleaseppala](github.com/kalleaseppala) and reviewed by
[@helmisuominen](github.com/helmisuominen).

## Progess in number of codes

From 11 290 codes 1 804 have been approved.

This makes 16% of codes approved.

# Assessing coverage of databases

## Database finngen

**How many codes labeled as NOMESCOfi in finngen are not in the atc
standard?**

There are 260 codes not found in the standard

Top10 sorted by freq:

<div class="kable-table">

| concept\_code | freq | freq\_per |
| :------------ | ---: | :-------- |
| XLA10         | 7408 | 0.127%    |
| RD211         | 3200 | 0.055%    |
| XF640         | 2477 | 0.043%    |
| 1LA05         | 1632 | 0.028%    |
| 1XC03         | 1619 | 0.028%    |
| WQ066         | 1300 | 0.022%    |
| 4AA12         | 1102 | 0.019%    |
| 6BA02         |  993 | 0.017%    |
| 1XC02         |  830 | 0.014%    |
| 1XC07         |  774 | 0.013%    |

</div>

The full list can be found in
[./3\_freq\_of\_source\_codes/finngen\_not\_in\_NOMESCOfi.csv](./3_freq_of_source_codes/finngen_not_in_NOMESCOfi.csv)

**Status of the NOMESCOfi codes infinngen**

<div class="kable-table">

| status      | n\_codes | per\_codes | n\_events | per\_events |
| :---------- | -------: | :--------- | --------: | :---------- |
| mapped      |     1397 | 26.044%    |   4947275 | 85.045%     |
| not\_mapped |     3707 | 69.109%    |    827930 | 14.232%     |
| not\_found  |      260 | 4.847%     |     42010 | 0.722%      |

</div>

## Database tays

**How many codes labeled as NOMESCOfi in tays are not in the atc
standard?**

There are 0 codes not found in the standard

Top10 sorted by freq:

<div class="kable-table">

| concept\_code | freq | freq\_per |
| :------------ | ---: | :-------- |

</div>

The full list can be found in
[./3\_freq\_of\_source\_codes/tays\_not\_in\_NOMESCOfi.csv](./3_freq_of_source_codes/tays_not_in_NOMESCOfi.csv)

**Status of the NOMESCOfi codes intays**

<div class="kable-table">

| status      | n\_codes | per\_codes | n\_events | per\_events |
| :---------- | -------: | :--------- | --------: | :---------- |
| mapped      |     1463 | 26.475%    |   3454182 | 95.550%     |
| not\_mapped |     4063 | 73.525%    |    160869 | 4.450%      |

</div>
