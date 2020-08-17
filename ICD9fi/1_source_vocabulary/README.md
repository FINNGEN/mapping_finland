ICD9fi source vocabulary
================

  - [Import Vocabulary](#import-vocabulary)
  - [Traslation to English](#traslation-to-english)
  - [Formating source vocabulary to
    OMOP](#formating-source-vocabulary-to-omop)
      - [Create VOCABULARY table](#create-vocabulary-table)
      - [Create CONCEPT\_CLASS table](#create-concept_class-table)
      - [Create CONCEPT table](#create-concept-table)

## Import Vocabulary

TODO: i got it from aki now in the gitlab repo

The concept names are a mixed of Latin, Finnish, and English \!\!. These
are not translated to English \!\!. The English name were append by
matching the ICD9fi code to the ICD9 code dowloaded from
[Wolfbane.com](http://www.wolfbane.com/icd/) (1.6.2020).

## Traslation to English

TODO: so far we have tried to match ICD9fi codes to ICD9CM and Wolfbane
(seems to be the same) with no success

ATM i will keep the names as they are and lets see later

## Formating source vocabulary to OMOP

#### Create VOCABULARY table

<div class="kable-table">

| vocabulary\_id | vocabulary\_name          | vocabulary\_reference | vocabulary\_version | vocabulary\_concept\_id |
| :------------- | :------------------------ | :-------------------- | :------------------ | ----------------------: |
| ICD9fi         | ICD9 Finnish modification |                       |                     |                       1 |

</div>

#### Create CONCEPT\_CLASS table

<div class="kable-table">

| concept\_class\_id | concept\_class\_name                        | concept\_class\_concept\_id |
| :----------------- | :------------------------------------------ | --------------------------: |
| 3-char ICD9fi      | 3 ICD9 Finnish Modification Hierarchy Level |                           5 |
| 4-char ICD9fi      | 4 ICD9 Finnish Modification Hierarchy Level |                           6 |
| 5-char ICD9fi      | 5 ICD9 Finnish Modification Hierarchy Level |                           7 |

</div>

#### Create CONCEPT table

At the moment `domain_id` is “Condition” for all although several are
not procedures.

TODO: recalcualte `domain_id` based on the mapping

<div class="kable-table">

| concept\_id | concept\_name                           | domain\_id | vocabulary\_id | concept\_class\_id | standard\_concept | concept\_code  | valid\_start\_date | valid\_end\_date | invalid\_reason | tmp\_name\_fi                           |
| ----------: | :-------------------------------------- | :--------- | :------------- | :----------------- | :---------------- | :------------- | :----------------- | :--------------- | :-------------- | :-------------------------------------- |
|           1 | ICD9 Finnish modification               | Metadata   | Vocabulary     | Vocabulary         | NA                | OMOP generated | 1970-01-01         | 2099-12-31       | NA              | NA                                      |
|           5 | 3-char ICD9fi                           | Metadata   | Concept Class  | Concept Class      | NA                | OMOP generated | 1970-01-01         | 2099-12-31       | NA              | NA                                      |
|           6 | 4-char ICD9fi                           | Metadata   | Concept Class  | Concept Class      | NA                | OMOP generated | 1970-01-01         | 2099-12-31       | NA              | NA                                      |
|           7 | 5-char ICD9fi                           | Metadata   | Concept Class  | Concept Class      | NA                | OMOP generated | 1970-01-01         | 2099-12-31       | NA              | NA                                      |
|           8 | CHOLERA                                 | Condition  | ICD9fi         | 3-char ICD9fi      | NA                | 001            | 1970-01-01         | 2099-12-31       | NA              | CHOLERA                                 |
|           9 | CHOLERA E VIBRIONE CHOLERAE (01)        | Condition  | ICD9fi         | 5-char ICD9fi      | NA                | 0010A          | 1970-01-01         | 2099-12-31       | NA              | CHOLERA E VIBRIONE CHOLERAE (01)        |
|          10 | CHOLERA E VIBRIONE CHOLERAE EL TOR (01) | Condition  | ICD9fi         | 5-char ICD9fi      | NA                | 0011A          | 1970-01-01         | 2099-12-31       | NA              | CHOLERA E VIBRIONE CHOLERAE EL TOR (01) |
|          11 | CHOLERA NUD                             | Condition  | ICD9fi         | 5-char ICD9fi      | NA                | 0019X          | 1970-01-01         | 2099-12-31       | NA              | CHOLERA NUD                             |
|          12 | FEBRIS TYPHOIDES ET PARATYPHOIDES       | Condition  | ICD9fi         | 3-char ICD9fi      | NA                | 002            | 1970-01-01         | 2099-12-31       | NA              | FEBRIS TYPHOIDES ET PARATYPHOIDES       |
|          13 | FEBRIS TYPHOIDES                        | Condition  | ICD9fi         | 5-char ICD9fi      | NA                | 0020A          | 1970-01-01         | 2099-12-31       | NA              | FEBRIS TYPHOIDES                        |

</div>
