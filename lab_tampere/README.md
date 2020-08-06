lab\_tampere
================

  - [Intro](#intro)
  - [Formating source vocabulary to
    OMOP](#formating-source-vocabulary-to-omop)
  - [Mapping the source vocabulary to the standard
    vocabularies](#mapping-the-source-vocabulary-to-the-standard-vocabularies)
      - [Progess in number of codes](#progess-in-number-of-codes)
      - [Progess in number of events](#progess-in-number-of-events)
  - [Assessing coverage of databases](#assessing-coverage-of-databases)
      - [Database tays](#database-tays)

# Intro

TODO

# Formating source vocabulary to OMOP

TODO

<div class="kable-table">

| name\_en\_source |    n |
| :--------------- | ---: |
| Google           | 9753 |

</div>

Source table with added translation has been formatted to be similar to
OMOP in
[1\_source\_vocabulary/lab\_tampere\_for\_source\_vocabulary.csv](1_source_vocabulary/lab_tampere_for_source_vocabulary.csv).

# Mapping the source vocabulary to the standard vocabularies

In short, USAGI

TODO

Mapping was carried by medical student
[@kalleaseppala](github.com/kalleaseppala) and reviewed by
[@helmisuominen](github.com/helmisuominen).

## Progess in number of codes

From 2 839 codes 665 have been approved.

This makes 23% of codes approved.

<div class="kable-table">

| mappingStatus |    n |
| :------------ | ---: |
| APPROVED      |  665 |
| UNCHECKED     | 2224 |

</div>

## Progess in number of events

Accepted codes covers 92% of the total number of events in the combined
databases.

Accepted codes covers all codes with more than 260 540 events in the
combined databases.

Top10 of the unchecked events sort by number of events :

<div class="kable-table">

| sourceCode | sourceFrequency | matchScore | sourceName | ADD\_<INFO:Pitkä.nimi> |
| :--------- | --------------: | ---------: | :--------- | :--------------------- |
| NLAATU     |          260540 |         NA | NA         | NA NA                  |
| U -TutkEsi |          167886 |         NA | NA         | NA Urine               |
| OTTOTAPA   |          166921 |         NA | NA         | NA NA                  |
| RAKKOAIKA  |          166921 |         NA | NA         | NA NA                  |
| MÄÄRITTÄJÄ |          141604 |         NA | NA         | NA NA                  |
| MÄÄRITYSPV |          141604 |         NA | NA         | NA NA                  |
| B -VeriToi |          141093 |         NA | NA         | NA Blood               |
| NÄYTENRO   |          141093 |         NA | NA         | NA NA                  |
| SÄDETYSTIE |          141093 |         NA | NA         | NA NA                  |
| TuotABORh  |          141093 |         NA | NA         | NA NA                  |

</div>

# Assessing coverage of databases

## Database tays

**How many codes labeled as lab\_tampere in tays are not in the
lab\_tampere standard?**

There are 0 codes not found in the standard

Top10 sort by freq:

| code | freq | freq\_per |
| :--- | ---: | :-------- |

The full list can be found in
[./3\_freq\_of\_source\_codes/tays\_not\_in\_lab\_tampere.csv](./3_freq_of_source_codes/tays_not_in_lab_tampere.csv)

**Status of the lab\_tampere codes intays**

| status      | n\_codes | per\_codes | n\_events | per\_events |
| :---------- | -------: | :--------- | --------: | :---------- |
| mapped      |     1100 | 27.007%    |  40906762 | 87.892%     |
| not\_mapped |     2973 | 72.993%    |   5635363 | 12.108%     |
