spat
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

The list of the SPAT codes have been downloaded from the official
source:
[kodistopalvelu](https://91.202.112.142/codeserver/pages/classification-view-page.xhtml?classificationKey=393&versionKey=471)(7.5.2020).

It contains the codes, Finnish names, Swedish names, and validity
periods.

All the codes missed the English names which was added by a professional
translator (Elina Ritala Lääketieteellinen käännöstoimisto Oy)

TODO ask [@CoderMikolaj](github.com/CoderMikolaj) if this is correct.

<div class="kable-table">

| name\_en\_source |   n |
| :--------------- | --: |
| Traslator        | 415 |

</div>

Source table with added translation has been formatted to be similar to
OMOP in
[1\_source\_vocabulary/spat\_for\_source\_vocabulary.csv](1_source_vocabulary/spat_for_source_vocabulary.csv).

# Mapping the source vocabulary to the standard vocabularies

TODO: In short, USAGI , to english names in procedures ??

## Progess in number of codes

From 415 codes 0 have been approved.

This makes 0% of codes approved.

## Progess in number of events

# Assessing coverage of databases

## Database finngen

**How many codes labeled as spat in finngen are not in the spat
standard?**

There are 9 codes not found in the standard

Top10 sort by freq:

| code  | freq | freq\_per |
| :---- | ---: | :-------- |
| \-1   |  847 | 0.014%    |
| \-2   |   52 | 0.001%    |
| XLD00 |   26 | 0.000%    |
| WW200 |   14 | 0.000%    |
| OAA11 |    8 | 0.000%    |
| OAB30 |    8 | 0.000%    |
| JFA15 |    7 | 0.000%    |
| OAB47 |    7 | 0.000%    |
| OAA70 |    6 | 0.000%    |

The full list can be found in
[./3\_freq\_of\_source\_codes/finngen\_not\_in\_spat.csv](./3_freq_of_source_codes/finngen_not_in_spat.csv)

**Status of the spat codes infinngen**

| status      | n\_codes | per\_codes | n\_events | per\_events |
| :---------- | -------: | :--------- | --------: | :---------- |
| not\_mapped |      323 | 97.289%    |   6112598 | 99.984%     |
| not\_found  |        9 | 2.711%     |       975 | 0.016%      |
