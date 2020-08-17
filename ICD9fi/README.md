ICD9fi
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

TODO: intro icd9fi

# Formating source vocabulary to OMOP

The icd9fi codes have been …

TODO: i got it from aki now in the gitlab repo

The concept names are a mixed of Latin, Finnish, and English \!\!. These
are not translated to English \!\!. The English name were append by
matching the ICD9fi code to the ICD9 code dowloaded from
[Wolfbane.com](http://www.wolfbane.com/icd/) (1.6.2020).

There are 5 tipes of maching :

TODO

# Mapping the source vocabulary to the standard vocabularies

ICD9fi codes ranked by frequency calculated from FinnGen-DF5.

Mapping was carried in USAGI by medical student
[@kalleaseppala](github.com/kalleaseppala).

## Progess in number of codes

From 9 115 codes 657 have been approved.

This makes 7% of codes approved.

# Assessing coverage of databases

## Database finngen

**How many codes labeled as ICD9fi in finngen are not in the atc
standard?**

There are 10 codes not found in the standard

Top10 sorted by freq:

<div class="kable-table">

| concept\_code | freq | freq\_per |
| :------------ | ---: | :-------- |
| 6341A         |  264 | 0.066%    |
| 2959X         |   21 | 0.005%    |
| 7181F         |   15 | 0.004%    |
| 6420A         |   14 | 0.004%    |
| 6500A         |   10 | 0.003%    |
| 7150F         |   10 | 0.003%    |
| 7890X         |    9 | 0.002%    |
| 4610B         |    6 | 0.002%    |
| 5409A         |    6 | 0.002%    |
| 6530C         |    6 | 0.002%    |

</div>

The full list can be found in
[./3\_freq\_of\_source\_codes/finngen\_not\_in\_ICD9fi.csv](./3_freq_of_source_codes/finngen_not_in_ICD9fi.csv)

**Status of the ICD9fi codes infinngen**

<div class="kable-table">

| status      | n\_codes | per\_codes | n\_events | per\_events |
| :---------- | -------: | :--------- | --------: | :---------- |
| mapped      |      657 | 22.686%    |    282946 | 70.787%     |
| not\_mapped |     2229 | 76.968%    |    116405 | 29.122%     |
| not\_found  |       10 | 0.345%     |       361 | 0.090%      |

</div>
