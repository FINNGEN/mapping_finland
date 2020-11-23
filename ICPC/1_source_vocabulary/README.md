ICPC source vocabulary
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

`ICPC2_merged_and__ICPC1_from_DF6_UTF8.txt` Contains the ICPC codes with
English and Finnish names.

This table comes from the ontology gitlab repo. Created by
[@CoderMikolaj](github.com/CoderMikolaj).

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

## Traslation to English

All codes have english name

## Formating source vocabulary to OMOP

#### Create VOCABULARY table

<div class="kable-table">

| vocabulary\_id | vocabulary\_name        | vocabulary\_reference | vocabulary\_version | vocabulary\_concept\_id |
| :------------- | :---------------------- | :-------------------- | :------------------ | ----------------------: |
| ICPC           | ICPC1, ICPC2, ICPC2proc |                       |                     |                       1 |

</div>

#### Create CONCEPT\_CLASS table

<div class="kable-table">

| concept\_class\_id | concept\_class\_name | concept\_class\_concept\_id |
| :----------------- | :------------------- | --------------------------: |
| ICPC1              | ICPC version 1       |                           2 |
| ICPC2              | ICPC version 2       |                           3 |
| ICPC2proc          | ICPC procedures      |                           4 |

</div>

#### Create CONCEPT table

At the moment `domain_id` is “Condition” for all although several are
not procedures.

TODO: recalcualte `domain_id` based on the mapping

<div class="kable-table">

| concept\_id | concept\_name                       | domain\_id | vocabulary\_id | concept\_class\_id | standard\_concept | concept\_code  | valid\_start\_date | valid\_end\_date | invalid\_reason | tmp\_main\_icd10fi | tmp\_name\_fi                             | tmp\_name\_en\_source |
| ----------: | :---------------------------------- | :--------- | :------------- | :----------------- | :---------------- | :------------- | :----------------- | :--------------- | :-------------- | :----------------- | :---------------------------------------- | :-------------------- |
|           1 | ICPC1, ICPC2, ICPC2proc             | Metadata   | Vocabulary     | Vocabulary         | NA                | OMOP generated | 1970-01-01         | 2099-12-31       | NA              | NA                 | NA                                        | NA                    |
|           2 | ICPC1                               | Metadata   | Concept Class  | Concept Class      | NA                | OMOP generated | 1970-01-01         | 2099-12-31       | NA              | NA                 | NA                                        | NA                    |
|           3 | ICPC2                               | Metadata   | Concept Class  | Concept Class      | NA                | OMOP generated | 1970-01-01         | 2099-12-31       | NA              | NA                 | NA                                        | NA                    |
|           4 | ICPC2proc                           | Metadata   | Concept Class  | Concept Class      | NA                | OMOP generated | 1970-01-01         | 2099-12-31       | NA              | NA                 | NA                                        | NA                    |
|           5 | Medical examin/health eval complete | Procedure  | ICPC           | ICPC2proc          | NA                | \-30           | 1970-01-01         | 2099-12-31       | NA              | NA                 | Laaja terveydentilan arviointi/tarkastus  | THL                   |
|           6 | Medical examin/health eval partial  | Procedure  | ICPC           | ICPC2proc          | NA                | \-31           | 1970-01-01         | 2099-12-31       | NA              | NA                 | Suppea terveydentilan arviointi/tarkastus | THL                   |
|           7 | Sensitivity test                    | Procedure  | ICPC           | ICPC2proc          | NA                | \-32           | 1970-01-01         | 2099-12-31       | NA              | NA                 | Allergiatutkimus                          | THL                   |
|           8 | Microbiological/immunological test  | Procedure  | ICPC           | ICPC2proc          | NA                | \-33           | 1970-01-01         | 2099-12-31       | NA              | NA                 | Mikrobiologinen/immunologinen koe         | THL                   |
|           9 | Blood test                          | Procedure  | ICPC           | ICPC2proc          | NA                | \-34           | 1970-01-01         | 2099-12-31       | NA              | NA                 | Veritutkimus                              | THL                   |
|          10 | Urine test                          | Procedure  | ICPC           | ICPC2proc          | NA                | \-35           | 1970-01-01         | 2099-12-31       | NA              | NA                 | Virtsatutkimus                            | THL                   |

</div>

#### Create CONCEPT\_SYNONYM table

  - 4181730 \# Finnish language
  - 4175777 \# Swedish language

TOASK: should we add the abbreviation and short\_name as synonyms ??

<div class="kable-table">

| concept\_id | concept\_synonym\_name                    | language\_concept\_id |
| ----------: | :---------------------------------------- | --------------------: |
|           5 | Laaja terveydentilan arviointi/tarkastus  |               4181730 |
|           6 | Suppea terveydentilan arviointi/tarkastus |               4181730 |
|           7 | Allergiatutkimus                          |               4181730 |
|           8 | Mikrobiologinen/immunologinen koe         |               4181730 |
|           9 | Veritutkimus                              |               4181730 |
|          10 | Virtsatutkimus                            |               4181730 |
|          11 | Ulostetutkimus                            |               4181730 |
|          12 | Histologinen/sytologinen tutkimus         |               4181730 |
|          13 | Muu laboratoriotutkimus                   |               4181730 |
|          14 | Kliininen toimintakoe                     |               4181730 |

</div>

Summary of codes added in each language:

<div class="kable-table">

| n\_codes | n\_witn\_name\_fi |
| -------: | ----------------: |
|     1443 |              1443 |

</div>
