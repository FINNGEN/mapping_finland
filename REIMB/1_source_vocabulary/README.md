REIMB source vocabulary
================

  - [Import Vocabulary](#import-vocabulary)
  - [Traslation to English](#traslation-to-english)
  - [Formating source vocabulary to
    OMOP](#formating-source-vocabulary-to-omop)
      - [Create VOCABULARY table](#create-vocabulary-table)
      - [Create CONCEPT\_CLASS table](#create-concept_class-table)
      - [Create CONCEPT table](#create-concept-table)
      - [Create CONCEPT\_SYNONYM table](#create-concept_synonym-table)

## Import Vocabulary

REIMB codes were downloaded from [dono](dono) (3.4.2020). Missing codes,
translations and validity dates were manually colledted from kela’s web
page into table
[./1\_source\_vocabulary/Kela\_reimbursement\_codes.xlsx](./1_source_vocabulary/Kela_reimbursement_codes.xlsx)
by [@CoderMikolaj](github.com/CoderMikolaj).

Resulting table contains the codes, names, and validity periods. Some
codes (e.g 307) have a different names during different periods, and
therefore codes are repeated on the table for name and time period.

TODO: we got the name changes over time only for the top 21 codes. The
rest should be checked. (top 21 bcs were the ones with no name at all
kela’s )

Missing English translations were made using Google-tralator

## Traslation to English

The concept names were translated to English as follow:

  - `THL`: concept name in English already exists in the source table.
  - `Traslator`: missing names were send to a translator by
    <mary.reeve@helsinki.fi>

<div class="kable-table">

| name\_en\_source |   n |
| :--------------- | --: |
| KELA             | 236 |
| Google           |  31 |

</div>

## Formating source vocabulary to OMOP

#### Create VOCABULARY table

<div class="kable-table">

| vocabulary\_id | vocabulary\_name           | vocabulary\_reference | vocabulary\_version | vocabulary\_concept\_id |
| :------------- | :------------------------- | :-------------------- | :------------------ | ----------------------: |
| REIMB          | Finnish reimbursement code |                       |                     |                       1 |

</div>

#### Create CONCEPT\_CLASS table

<div class="kable-table">

| concept\_class\_id | concept\_class\_name       | concept\_class\_concept\_id |
| :----------------- | :------------------------- | --------------------------: |
| REIMB              | Finnish reimbursement code |                           2 |

</div>

#### Create CONCEPT table

At the moment `domain_id` is “Condition” for all although several are
not procedures.

TODO: recalcualte `domain_id` based on the mapping

<div class="kable-table">

| concept\_id | concept\_name                                                                                                       | domain\_id | vocabulary\_id | concept\_class\_id | standard\_concept | concept\_code  | valid\_start\_date | valid\_end\_date | invalid\_reason | tmp\_name\_fi                                                                                                                       | tmp\_name\_en\_source |
| ----------: | :------------------------------------------------------------------------------------------------------------------ | :--------- | :------------- | :----------------- | :---------------- | :------------- | :----------------- | :--------------- | :-------------- | :---------------------------------------------------------------------------------------------------------------------------------- | :-------------------- |
|           1 | Finnish reimbursement code                                                                                          | Metadata   | Vocabulary     | Vocabulary         | NA                | OMOP generated | 1970-01-01         | 2099-12-31       | NA              | NA                                                                                                                                  | NA                    |
|           2 | REIMB                                                                                                               | Metadata   | Concept Class  | Concept Class      | NA                | OMOP generated | 1970-01-01         | 2099-12-31       | NA              | NA                                                                                                                                  | NA                    |
|           3 | Fat metabolism disorder associated with chronic coronary artery disease                                             | Condition  | REIMB          | REIMB              | NA                | 213            | 1970-01-01         | 2012-03-31       | NA              | Krooniseen sepelvaltimotautiin liittyvä rasva-aineenvaihdunnan häiriö                                                               | Google                |
|           4 | NA                                                                                                                  | Condition  | REIMB          | REIMB              | NA                | 204            | 1970-01-01         | 2099-12-31       | NA              | NA                                                                                                                                  | Google                |
|           5 | Tacrine, donepezil, rivastigmine, galantamine and other major and expensive drugs used to treat Alzheimer’s disease | Condition  | REIMB          | REIMB              | NA                | 307            | 1999-01-01         | 2003-03-31       | NA              | Takriini, donepetsiili, rivastigmiini, galantamiini ja muut merkittävät ja kalliit Alzheimerin taudin hoidossa käytettävät lääkkeet | Google                |
|           6 | Donepezil, galantamine, memantine and rivastigmine                                                                  | Condition  | REIMB          | REIMB              | NA                | 307            | 2003-04-01         | 2016-10-31       | NA              | Donepetsiili, galantamiini, memantiini ja rivastigmiini                                                                             | Google                |
|           7 | Rivastigmine                                                                                                        | Condition  | REIMB          | REIMB              | NA                | 307            | 2016-11-01         | 2018-05-31       | NA              | Rivastigmiini                                                                                                                       | Google                |
|           8 | Insulin glargine 300 U / ml                                                                                         | Condition  | REIMB          | REIMB              | NA                | 177            | 2017-01-01         | 2020-02-29       | NA              | Glargininsuliini 300 U/ml                                                                                                           | Google                |
|           9 | Psychosis requiring demanding treatment                                                                             | Condition  | REIMB          | REIMB              | NA                | 188            | 2000-04-01         | 2014-10-31       | NA              | Vaikeahoitoinen psykoosi                                                                                                            | KELA                  |
|          10 | exenatide                                                                                                           | Condition  | REIMB          | REIMB              | NA                | 160            | 2013-04-01         | 2016-02-29       | NA              | Eksenatidi                                                                                                                          | Google                |

</div>

#### Create CONCEPT\_SYNONYM table

  - 4181730 \# Finnish language
  - 4175777 \# Swedish language

TOASK: should we add the abbreviation and short\_name as synonyms ??

<div class="kable-table">

| concept\_id | concept\_synonym\_name                                                                                                              | language\_concept\_id |
| ----------: | :---------------------------------------------------------------------------------------------------------------------------------- | --------------------: |
|           3 | Krooniseen sepelvaltimotautiin liittyvä rasva-aineenvaihdunnan häiriö                                                               |               4181730 |
|           4 | NA                                                                                                                                  |               4181730 |
|           5 | Takriini, donepetsiili, rivastigmiini, galantamiini ja muut merkittävät ja kalliit Alzheimerin taudin hoidossa käytettävät lääkkeet |               4181730 |
|           6 | Donepetsiili, galantamiini, memantiini ja rivastigmiini                                                                             |               4181730 |
|           7 | Rivastigmiini                                                                                                                       |               4181730 |
|           8 | Glargininsuliini 300 U/ml                                                                                                           |               4181730 |
|           9 | Vaikeahoitoinen psykoosi                                                                                                            |               4181730 |
|          10 | Eksenatidi                                                                                                                          |               4181730 |
|          11 | Eksenatidi ja liraglutidi                                                                                                           |               4181730 |
|          12 | Clopidogrel                                                                                                                         |               4181730 |

</div>

Summary of codes added in each language:

<div class="kable-table">

| n\_codes | n\_witn\_name\_fi |
| -------: | ----------------: |
|      267 |               267 |

</div>
