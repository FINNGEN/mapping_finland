NOMESCOfi source vocabulary
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

NOMESCOfi codes can be found in
[Koodistopalvelu](https://91.202.112.142/codeserver/pages/download?name=120_1387444168447.txt&pKey=pubfiles0).

However, some of the English names are missing and were send to a
translator by <mary.reeve@helsinki.fi>.

Resulting table is
[./NOMESCO\_codes\_UTF8.txt](./NOMESCO_codes_UTF8.txt)

## Traslation to English

The concept names were translated to English as follow:

  - `THL`: concept name in English already exists in the source table.
  - `Traslator`: missing names were send to a translator by
    <mary.reeve@helsinki.fi>

<div class="kable-table">

| english\_name\_source |    n |
| :-------------------- | ---: |
| THL                   | 9301 |
| Translator            | 1983 |

</div>

TODO: the translator and the students notice that few THL translations
were wrong, they should be checked

## Formating source vocabulary to OMOP

#### Create VOCABULARY table

<div class="kable-table">

| vocabulary\_id | vocabulary\_name             | vocabulary\_reference                                                                                                  | vocabulary\_version | vocabulary\_concept\_id |
| :------------- | :--------------------------- | :--------------------------------------------------------------------------------------------------------------------- | :------------------ | ----------------------: |
| NOMESCOfi      | NOMESCO Finnish modification | <https://koodistopalvelu.kanta.fi/codeserver/pages/classification-view-page.xhtml?classificationKey=57&versionKey=119> |                     |                       1 |

</div>

#### Create CONCEPT\_CLASS table

<div class="kable-table">

| concept\_class\_id | concept\_class\_name                           | concept\_class\_concept\_id |
| :----------------- | :--------------------------------------------- | --------------------------: |
| NOMESCOfi Level 0  | NOMESCO Finnish Modification Hierarchy Level 0 |                           2 |
| NOMESCOfi Level 1  | NOMESCO Finnish Modification Hierarchy Level 1 |                           3 |
| NOMESCOfi Level 2  | NOMESCO Finnish Modification Hierarchy Level 2 |                           4 |
| NOMESCOfi Level 3  | NOMESCO Finnish Modification Hierarchy Level 3 |                           5 |
| NOMESCOfi Level 4  | NOMESCO Finnish Modification Hierarchy Level 4 |                           6 |

</div>

#### Create CONCEPT table

At the moment `domain_id` is “Procedure” for all although several are
not procedures.

TODO: recalcualte `domain_id` based on the mapping

<div class="kable-table">

| concept\_id | concept\_name                          | domain\_id | vocabulary\_id | concept\_class\_id | standard\_concept | concept\_code  | valid\_start\_date | valid\_end\_date | invalid\_reason | tmp\_name\_fi                   | tmp\_name\_en\_source |
| ----------: | :------------------------------------- | :--------- | :------------- | :----------------- | :---------------- | :------------- | :----------------- | :--------------- | :-------------- | :------------------------------ | :-------------------- |
|           1 | NOMESCO Finnish modification           | Metadata   | Vocabulary     | Vocabulary         | NA                | OMOP generated | 1970-01-01         | 2099-12-31       | NA              | NA                              | NA                    |
|           2 | NOMESCOfi Level 0                      | Metadata   | Concept Class  | Concept Class      | NA                | OMOP generated | 1970-01-01         | 2099-12-31       | NA              | NA                              | NA                    |
|           3 | NOMESCOfi Level 1                      | Metadata   | Concept Class  | Concept Class      | NA                | OMOP generated | 1970-01-01         | 2099-12-31       | NA              | NA                              | NA                    |
|           4 | NOMESCOfi Level 2                      | Metadata   | Concept Class  | Concept Class      | NA                | OMOP generated | 1970-01-01         | 2099-12-31       | NA              | NA                              | NA                    |
|           5 | NOMESCOfi Level 3                      | Metadata   | Concept Class  | Concept Class      | NA                | OMOP generated | 1970-01-01         | 2099-12-31       | NA              | NA                              | NA                    |
|           6 | NOMESCOfi Level 4                      | Metadata   | Concept Class  | Concept Class      | NA                | OMOP generated | 1970-01-01         | 2099-12-31       | NA              | NA                              | NA                    |
|           7 | Nervous system                         | Procedure  | NOMESCOfi      | NOMESCOfi Level 0  | NA                | A              | 1900-01-01         | 2030-12-31       | NA              | Hermosto                        | THL                   |
|           8 | Skull and intracranial structures      | Procedure  | NOMESCOfi      | NOMESCOfi Level 1  | NA                | AA             | 1900-01-01         | 2030-12-31       | NA              | Kallo ja kallon sisäiset elimet | THL                   |
|           9 | Diagnostic radiology of head and brain | Procedure  | NOMESCOfi      | NOMESCOfi Level 2  | NA                | AA\_           | 1900-01-01         | 2030-12-31       | NA              | Pään diagnostinen radiologia    | THL                   |
|          10 | Head X-ray examination                 | Procedure  | NOMESCOfi      | NOMESCOfi Level 3  | NA                | AA1AA          | 1999-01-01         | 2030-12-31       | NA              | Kallon röntgen                  | THL                   |

</div>

#### Create CONCEPT\_SYNONYM table

  - 4181730 \# Finnish language
  - 4175777 \# Swedish language

TOASK: should we add the abbreviation and short\_name as synonyms ??

<div class="kable-table">

| concept\_id | concept\_synonym\_name                              | language\_concept\_id |
| ----------: | :-------------------------------------------------- | --------------------: |
|           7 | Hermosto                                            |               4181730 |
|           8 | Kallo ja kallon sisäiset elimet                     |               4181730 |
|           9 | Pään diagnostinen radiologia                        |               4181730 |
|          10 | Kallon röntgen                                      |               4181730 |
|          11 | Pään tietokonetomografiatutkimus                    |               4181730 |
|          12 | Pään suppea magneettitutkimus keskikenttälaitteella |               4181730 |
|          13 | Pään suppea magneettitutkimus                       |               4181730 |
|          14 | Pään suppea 3 Teslan MT                             |               4181730 |
|          15 | Kallon laaja röntgen                                |               4181730 |
|          16 | Pään laaja tietokonetomografiatutkimus              |               4181730 |

</div>

Summary of codes added in each language:

<div class="kable-table">

| n\_codes | n\_witn\_name\_fi | n\_witn\_name\_se |
| -------: | ----------------: | ----------------: |
|    11284 |             11284 |             11277 |

</div>
