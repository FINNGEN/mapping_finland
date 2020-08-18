ICD10fi source vocabulary
================

  - [Import Vocabulary](#import-vocabulary)
  - [Traslation to English](#traslation-to-english)
  - [Extending composed-codes](#extending-composed-codes)
      - [Parse descritions into regex
        rules](#parse-descritions-into-regex-rules)
      - [Expand one code addition](#expand-one-code-addition)
      - [Expand by class/chapter/group](#expand-by-classchaptergroup)
      - [apply regex rules](#apply-regex-rules)
      - [Append the new codes to the
        standard](#append-the-new-codes-to-the-standard)
  - [Formating source vocabulary to
    OMOP](#formating-source-vocabulary-to-omop)
      - [Create VOCABULARY table](#create-vocabulary-table)
      - [Create CONCEPT\_CLASS table](#create-concept_class-table)
      - [Create CONCEPT table](#create-concept-table)
      - [Create CONCEPT\_SYNONYM table](#create-concept_synonym-table)

## Import Vocabulary

The list of the icd10fi codes have been downloaded from the official
source:
[kodistopalvelu](https://91.202.112.142/codeserver/pages/publication-view-page.xhtml?distributionKey=9395&versionKey=58&returnLink=fromVersionPublicationList)(7.5.2020).

This table contains all the single codes, some composed-codes, and
classification. The last only used for hierarchy and not diagnose. In
addition, the table also contains the rules to generated other valid
composed-codes (in column `A:Huom`).

Table describes a total of 14 681 codes distributed as follow:

<div class="kable-table">

| code\_class    |     n |
| :------------- | ----: |
| 1 code         | 13346 |
| 2 code         |  1037 |
| classification |   298 |

</div>

We wont be using the classigfication codes

## Traslation to English

All codes come with the name in Finnish, in Swedish, and many, but not
all, also in English. For these missing we used Google-translator.

  - `THL`: concept name in English already exists in the source table.
  - `Google`: translated using Google-translator API

<div class="kable-table">

| name\_en\_source |     n |
| :--------------- | ----: |
| THL              | 12078 |
| Google           |  2305 |

</div>

## Extending composed-codes

We generate new composed-codes based on the “1 code” codes that contain
generation rules in column `A:Huom`. This process is detailed in
[README.Rmd](README.Rmd).

#### Parse descritions into regex rules

Get codes with a described expansion in `ALONG:Huom.`

<div class="kable-table">

| CodeId  | ALONG:Huom.                                             |
| :------ | :------------------------------------------------------ |
| D63.0\* | Etiologinen koodi valitaan luokasta C00-D48 - Kasvaimet |
| G73.2\* | Etiologinen koodi valitaan luokasta C00-D48 - Kasvaimet |
| G63.0\* | Etiologinen koodi valitaan luvusta A00-B99              |
| G94.0\* | Etiologinen koodi valitaan luvusta A00-B99              |
| H06.1\* | Etiologinen koodi valitaan luvusta A00-B99              |
| H13.1\* | Etiologinen koodi valitaan luvusta A00-B99              |
| H19.2\* | Etiologinen koodi valitaan luvusta A00-B99              |
| H22.0\* | Etiologinen koodi valitaan luvusta A00-B99              |
| H32.0\* | Etiologinen koodi valitaan luvusta A00-B99              |
| K67.8\* | Etiologinen koodi valitaan luvusta A00-B99              |

</div>

There are 2 types of expansion: - Added single code “Etiologiseksi
koodiksi valitaan Xxx.x” - To chose from a chapter/group “Etiologinen
koodi valitaan ryhmistä”

#### Expand one code addition

Parse description in Huom to CodeId2

#### Expand by class/chapter/group

Expand rules for `H36.00* Etiologinen koodi valitaan tässä ryhmässä
ryhmistä E10-E14. Neljäs merkki on .3`

#### apply regex rules

Extend leaves only

apply rules

<div class="kable-table">

| CodeId        | CodeId1 | CodeId2 | code1 | code2  |
| :------------ | :------ | :------ | :---- | :----- |
| M90.0\*A18.0  | M90.0\* | A18.0   | M90.0 | A18.0  |
| M73.0\*A54.4  | M73.0\* | A54.4   | M73.0 | A54.4  |
| N29.0\*A52.79 | N29.0\* | A52.79  | N29.0 | A52.79 |
| M01.1\*A18.0  | M01.1\* | A18.0   | M01.1 | A18.0  |
| M49.0\*A18.0  | M49.0\* | A18.0   | M49.0 | A18.0  |
| N33.0\*A18.1  | N33.0\* | A18.1   | N33.0 | A18.1  |
| K67.3\*A18.3  | K67.3\* | A18.3   | K67.3 | A18.3  |
| K93.0\*A18.3  | K93.0\* | A18.3   | K93.0 | A18.3  |
| K23.0\*A18.8  | K23.0\* | A18.8   | K23.0 | A18.8  |
| M01.0\*A39.8  | M01.0\* | A39.8   | M01.0 | A39.8  |

</div>

How many already exists ?

    ## [1] 339

#### Append the new codes to the standard

For the new codes, name is given as both source code’s names joined by
“LIITTYVÄ”, “RELATERAD-TILL”, and “RELATED-TO” respectively for
name\_fi, name\_se, and name\_en.

For the validity dates, the latest is chose for valid\_start\_date and
the earliest for valid\_end\_date.

For the how the English name was translated: `THL` if both were
translated by THL, `Google` if both were translated by
google-translator, and `THL+Google` if both.

<div class="kable-table">

| name\_en\_source |     n |
| :--------------- | ----: |
| THL              | 51484 |
| THL+Google       | 14635 |
| Google           |  2363 |

</div>

## Formating source vocabulary to OMOP

#### Create VOCABULARY table

<div class="kable-table">

| vocabulary\_id | vocabulary\_name             | vocabulary\_reference                                                                                                                          | vocabulary\_version | vocabulary\_concept\_id |
| :------------- | :--------------------------- | :--------------------------------------------------------------------------------------------------------------------------------------------- | :------------------ | ----------------------: |
| ICD10fi        | ICD10fi Finnish modification | <https://91.202.112.142/codeserver/pages/publication-view-page.xhtml?distributionKey=9395&versionKey=58&returnLink=fromVersionPublicationList> |                     |                       1 |

</div>

#### Create CONCEPT\_CLASS table

<div class="kable-table">

| concept\_class\_id         | concept\_class\_name                                          | concept\_class\_concept\_id |
| :------------------------- | :------------------------------------------------------------ | --------------------------: |
| ICD10fi Hierarchy          | ICD10fi Hierarchy                                             |                           2 |
| ICD10fi code               | ICD10fi code                                                  |                           3 |
| ICD10fi 2 code             | ICD10fi Finnish Modification composed code                    |                           5 |
| ICD10fi 2 code \[autogen\] | ICD10fi Finnish Modification composed code \[auto generated\] |                           6 |

</div>

#### Create CONCEPT table

At the moment `domain_id` is “Condition” for all although several are
not procedures.

TODO: recalculate `domain_id` based on the mapping

<div class="kable-table">

| concept\_id | concept\_name                                      | domain\_id | vocabulary\_id | concept\_class\_id | standard\_concept | concept\_code  | valid\_start\_date | valid\_end\_date | invalid\_reason | tmp\_code1\_concept\_id | tmp\_code2\_concept\_id | tmp\_name\_fi                 | tmp\_code\_class | tmp\_code1\_code | tmp\_code2\_code | tmp\_name\_en\_source |
| ----------: | :------------------------------------------------- | :--------- | :------------- | :----------------- | :---------------- | :------------- | :----------------- | :--------------- | :-------------- | ----------------------: | ----------------------: | :---------------------------- | :--------------- | :--------------- | :--------------- | :-------------------- |
|           1 | ICD10fi Finnish modification                       | Metadata   | Vocabulary     | Vocabulary         | NA                | OMOP generated | 1970-01-01         | 2099-12-31       | NA              |                      NA |                      NA | NA                            | NA               | NA               | NA               | NA                    |
|           2 | ICD10fi Hierarchy                                  | Metadata   | Concept Class  | Concept Class      | NA                | OMOP generated | 1970-01-01         | 2099-12-31       | NA              |                      NA |                      NA | NA                            | NA               | NA               | NA               | NA                    |
|           3 | ICD10fi code                                       | Metadata   | Concept Class  | Concept Class      | NA                | OMOP generated | 1970-01-01         | 2099-12-31       | NA              |                      NA |                      NA | NA                            | NA               | NA               | NA               | NA                    |
|           5 | ICD10fi 2 code                                     | Metadata   | Concept Class  | Concept Class      | NA                | OMOP generated | 1970-01-01         | 2099-12-31       | NA              |                      NA |                      NA | NA                            | NA               | NA               | NA               | NA                    |
|           6 | ICD10fi 2 code \[autogen\]                         | Metadata   | Concept Class  | Concept Class      | NA                | OMOP generated | 1970-01-01         | 2099-12-31       | NA              |                      NA |                      NA | NA                            | NA               | NA               | NA               | NA                    |
|           7 | Cholera                                            | Condition  | ICD10fi        | ICD10fi Hierarchy  | NA                | A00            | 1900-01-01         | 2020-12-31       | NA              |                      NA |                      NA | Kolera                        | 1 code           | A00              | NA               | THL                   |
|           8 | Cholera due to Vibrio cholerae 01, biovar cholerae | Condition  | ICD10fi        | ICD10fi Hierarchy  | NA                | A00.0          | 1900-01-01         | 2020-12-31       | NA              |                      NA |                      NA | Klassinen kolera              | 1 code           | A00.0            | NA               | THL                   |
|           9 | Cholera due to Vibrio cholerae 01, biovar eltor    | Condition  | ICD10fi        | ICD10fi Hierarchy  | NA                | A00.1          | 1900-01-01         | 2020-12-31       | NA              |                      NA |                      NA | El Tor-kolera                 | 1 code           | A00.1            | NA               | THL                   |
|          10 | Cholera, unspecified                               | Condition  | ICD10fi        | ICD10fi Hierarchy  | NA                | A00.9          | 1900-01-01         | 2020-12-31       | NA              |                      NA |                      NA | Määrittämätön kolera          | 1 code           | A00.9            | NA               | THL                   |
|          11 | Typhoid and paratyphoid fevers                     | Condition  | ICD10fi        | ICD10fi Hierarchy  | NA                | A01            | 1900-01-01         | 2020-12-31       | NA              |                      NA |                      NA | Lavantauti ja pikkulavantauti | 1 code           | A01              | NA               | THL                   |

</div>

#### Create CONCEPT\_SYNONYM table

  - 4181730 \# Finnish language
  - 4175777 \# Swedish language

TOASK: should we add the abbreviation and short\_name as synonyms ??

<div class="kable-table">

| concept\_id | concept\_synonym\_name                            | language\_concept\_id |
| ----------: | :------------------------------------------------ | --------------------: |
|           7 | Kolera                                            |               4181730 |
|           8 | Klassinen kolera                                  |               4181730 |
|           9 | El Tor-kolera                                     |               4181730 |
|          10 | Määrittämätön kolera                              |               4181730 |
|          11 | Lavantauti ja pikkulavantauti                     |               4181730 |
|          12 | Lavantauti                                        |               4181730 |
|          13 | Lavantautiin liittyvä aivokalvotulehdus           |               4181730 |
|          14 | Lavantautiin liittyvä sydämen sisäkalvon tulehdus |               4181730 |
|          15 | Lavantautiin liittyvä keuhkokuume                 |               4181730 |
|          16 | Pikkulavantauti A                                 |               4181730 |

</div>

Summary of codes added in each language:

<div class="kable-table">

| n\_codes | n\_witn\_name\_fi | n\_witn\_name\_se |
| -------: | ----------------: | ----------------: |
|    68482 |             68482 |             68482 |

</div>
