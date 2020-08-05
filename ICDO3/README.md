icdo3
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

ICDO3 exists and is mapped in OMOP

# Mapping the source vocabulary to the standard vocabularies

TODO: In short, USAGI , to conditions high level concepts ??

Once the english tralations have been checked, or mappe to the lating
names like in icd9fi

## Progess in number of codes

From 63 666 codes 63 666 have been approved.

This makes 100% of codes approved.

## Progess in number of events

# Assessing coverage of databases

## Database finngen

**How many codes labeled as icdo3 in finngen are not in the icdo3
standard?**

There are 26 codes not found in the standard

Top10 sort by freq:

| code         | freq | freq\_per |
| :----------- | ---: | :-------- |
| 6666/0-C53.9 |  596 | 1.349%    |
| 8070/3-C1    |   77 | 0.174%    |
| 8070/3-C99   |   75 | 0.170%    |
| 8070/3-C29   |   58 | 0.131%    |
| 8070/3-C21   |   56 | 0.127%    |
| 8070/3-C19   |   43 | 0.097%    |
| 8070/3-C49   |   29 | 0.066%    |
| 8070/3-C69   |   27 | 0.061%    |
| 8070/3-C60   |   19 | 0.043%    |
| 9591/3-C99   |   19 | 0.043%    |

The full list can be found in
[./3\_freq\_of\_source\_codes/finngen\_not\_in\_icdo3.csv](./3_freq_of_source_codes/finngen_not_in_icdo3.csv)

**Status of the icdo3 codes infinngen**

| status     | n\_codes | per\_codes | n\_events | per\_events |
| :--------- | -------: | :--------- | --------: | :---------- |
| mapped     |      504 | 95.094%    |     43033 | 97.388%     |
| not\_found |       26 | 4.906%     |      1154 | 2.612%      |
