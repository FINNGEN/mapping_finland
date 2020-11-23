hpn source vocabulary
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

from Mary

## Traslation to English

The concept names were translated to English as follow:

  - `GOOGLE_REVD`: translated with google and accepted by Elisa Lahtea
  - `ELISA_LAHTELA`: traslated by Elisa Lahtea

<div class="kable-table">

| name\_en\_source |   n |
| :--------------- | --: |
| GOOGLE\_REVD     | 121 |
| ELISA\_LAHTELA   |  69 |

</div>

## Formating source vocabulary to OMOP

#### Create VOCABULARY table

<div class="kable-table">

| vocabulary\_id | vocabulary\_name                  | vocabulary\_reference | vocabulary\_version | vocabulary\_concept\_id |
| :------------- | :-------------------------------- | :-------------------- | :------------------ | ----------------------: |
| HPN            | Demanding Heart Patient New codes |                       |                     |                       1 |

</div>

#### Create CONCEPT\_CLASS table

<div class="kable-table">

| concept\_class\_id | concept\_class\_name              | concept\_class\_concept\_id |
| :----------------- | :-------------------------------- | --------------------------: |
| HPN                | Demanding Heart Patient New codes |                           2 |

</div>

#### Create CONCEPT table

At the moment `domain_id` is “Procedure” for all although several are
not procedures.

TODO: recalcualte `domain_id` based on the mapping

<div class="kable-table">

| concept\_id | concept\_name                                                                           | domain\_id | vocabulary\_id | concept\_class\_id | standard\_concept | concept\_code  | valid\_start\_date | valid\_end\_date | invalid\_reason | tmp\_name\_fi                                                                               | tmp\_name\_en\_source |
| ----------: | :-------------------------------------------------------------------------------------- | :--------- | :------------- | :----------------- | :---------------- | :------------- | :----------------- | :--------------- | :-------------- | :------------------------------------------------------------------------------------------ | :-------------------- |
|           1 | Demanding Heart Patient New codese                                                      | Metadata   | Vocabulary     | Vocabulary         | NA                | OMOP generated | 1970-01-01         | 2099-12-31       | NA              | NA                                                                                          | NA                    |
|           2 | HPN                                                                                     | Metadata   | Concept Class  | Concept Class      | NA                | OMOP generated | 1970-01-01         | 2099-12-31       | NA              | NA                                                                                          | NA                    |
|           3 | Infection complication                                                                  | Procedure  | HPN            | HPN                | NA                | FA             | 1996-01-01         | 2017-12-31       | NA              | Infektiokomplikaatio                                                                        | GOOGLE\_REVD          |
|           4 | Other complication of infection                                                         | Procedure  | HPN            | HPN                | NA                | FAX            | 1996-01-01         | 2017-12-31       | NA              | Muu infektiokomplikaatio                                                                    | GOOGLE\_REVD          |
|           5 | Deep infection requiring surgical treatment                                             | Procedure  | HPN            | HPN                | NA                | FA1            | 1996-01-01         | 2017-12-31       | NA              | Kirurgista hoitoa vaatinut syvä infektio                                                    | GOOGLE\_REVD          |
|           6 | Lung / pleural infection                                                                | Procedure  | HPN            | HPN                | NA                | FA2            | 1996-01-01         | 2017-12-31       | NA              | Keuhko/pleuratilan infektio                                                                 | GOOGLE\_REVD          |
|           7 | Superficial wound infection: confirmed in bacterial culture or reddening purulent wound | Procedure  | HPN            | HPN                | NA                | FA3            | 1996-01-01         | 2017-12-31       | NA              | Pinnallinen haavan infektio: bakteeriviljelyssä varmistettu tai punoittava purulentti haava | ELISA\_LAHTELA        |
|           8 | Neurological complication                                                               | Procedure  | HPN            | HPN                | NA                | FB             | 1996-01-01         | 2017-12-31       | NA              | Neurologinen komplikaatio                                                                   | GOOGLE\_REVD          |
|           9 | Other neurological complication: also includes critical illness polyneuropathy          | Procedure  | HPN            | HPN                | NA                | FBX            | 1996-01-01         | 2017-12-31       | NA              | Muu neurologinen komplikaatio: sisältää myös critical illness polyneuropatian               | GOOGLE\_REVD          |
|          10 | Stroke: a neurological deficiency and confirmed by imaging                              | Procedure  | HPN            | HPN                | NA                | FB1            | 1996-01-01         | 2017-12-31       | NA              | Stroke: neurologinen puutosoire ja kuvantamisella varmistettu                               | ELISA\_LAHTELA        |

</div>

#### Create CONCEPT\_SYNONYM table

  - 4181730 \# Finnish language
  - 4175777 \# Swedish language

TOASK: should we add the abbreviation and short\_name as synonyms ??

<div class="kable-table">

| concept\_id | concept\_synonym\_name                                                                      | language\_concept\_id |
| ----------: | :------------------------------------------------------------------------------------------ | --------------------: |
|           3 | Infektiokomplikaatio                                                                        |               4181730 |
|           4 | Muu infektiokomplikaatio                                                                    |               4181730 |
|           5 | Kirurgista hoitoa vaatinut syvä infektio                                                    |               4181730 |
|           6 | Keuhko/pleuratilan infektio                                                                 |               4181730 |
|           7 | Pinnallinen haavan infektio: bakteeriviljelyssä varmistettu tai punoittava purulentti haava |               4181730 |
|           8 | Neurologinen komplikaatio                                                                   |               4181730 |
|           9 | Muu neurologinen komplikaatio: sisältää myös critical illness polyneuropatian               |               4181730 |
|          10 | Stroke: neurologinen puutosoire ja kuvantamisella varmistettu                               |               4181730 |
|          11 | Ohimennyt neurologinen komplikaatio: hoitoa vaatinut delirium, TIA, sekavuus                |               4181730 |
|          12 | Munuaiskomplikaatio                                                                         |               4181730 |

</div>

Summary of codes added in each language:

<div class="kable-table">

| n\_codes | n\_witn\_name\_fi |
| -------: | ----------------: |
|      190 |               190 |

</div>
